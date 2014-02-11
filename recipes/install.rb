#
# Cookbook Name:: osmosis
# Recipe:: install
#
# Copyright 2013, Mapzen
#
# All rights reserved - Do Not Redistribute
#

case node[:osmosis][:install_type]
when 'tgz'
  directory node[:osmosis][:installdir] do
    owner   node[:osmosis][:user]
    group   node[:osmosis][:group]
    mode    node[:osmosis][:dirmode]
  end

  http_request "HEAD #{node[:osmosis][:remote_source]}" do
    message ""
    url node[:osmosis][:remote_source]
    action :head
    if File.exists?("#{node[:osmosis][:installdir]}/#{node[:osmosis][:filename]}")
      headers "If-Modified-Since" => File.mtime("#{node[:osmosis][:installdir]}/#{node[:osmosis][:filename]}").httpdate
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

when 'pkg'
  apt_repository 'mapzen-public' do
    uri           'http://s3.amazonaws.com/mapzen-debian'
    distribution  'stable'
    components    ['main']
    key           'https://s3.amazonaws.com/mapzen-debian/mapzen-debian.gpg.key'
  end

  package 'mapzen-osmosis' do
    action  :install
    version node[:osmosis][:pkg_version]
  end
end

