#
# Cookbook Name:: osmosis
# Recipe:: build
#
# Copyright 2013, Mapzen
#
# All rights reserved - Do Not Redistribute
#

directory node[:osmosis][:installdir] do
  owner   node[:osmosis][:user]
  group   node[:osmosis][:group]
  mode    node[:osmosis][:dirmode]
end

remote_file "#{node[:osmosis][:installdir]}/#{node[:osmosis][:filename]}" do
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

