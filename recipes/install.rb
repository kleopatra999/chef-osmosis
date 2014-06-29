#
# Cookbook Name:: osmosis
# Recipe:: install
#

case node[:osmosis][:install_type]
when 'tgz'
  directory node[:osmosis][:installdir] do
    owner   node[:osmosis][:user]
    group   node[:osmosis][:group]
    mode    node[:osmosis][:dirmode]
  end

  http_request "HEAD #{node[:osmosis][:remote_source]}" do
    message ''
    url node[:osmosis][:remote_source]
    action :head
    if File.exist?("#{node[:osmosis][:installdir]}/#{node[:osmosis][:filename]}")
      headers 'If-Modified-Since' => File.mtime("#{node[:osmosis][:installdir]}/#{node[:osmosis][:filename]}").httpdate
    end
    notifies :create, "remote_file[#{node[:osmosis][:installdir]}/#{node[:osmosis][:filename]}]", :immediately
  end

  remote_file "#{node[:osmosis][:installdir]}/#{node[:osmosis][:filename]}" do
    action    :nothing
    source    node[:osmosis][:remote_source]
    notifies  :run, 'bash[extract-osmosis]', :immediately
  end

  bash 'extract-osmosis' do
    action  :nothing
    cwd     node[:osmosis][:installdir]
    code <<-BASH
      tar zxf #{node[:osmosis][:filename]}
    BASH
  end

  link '/usr/bin/osmosis' do
    to "#{node[:osmosis][:installdir]}/bin/osmosis"
    only_if { node[:osmosis][:symlink] }
  end

when 'pkg'
  package 'osmosis' do
    action :install
  end
end
