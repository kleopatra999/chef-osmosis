#
# Cookbook Name:: osmosis
# Recipe:: build
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'git'

directory '/opt/osmosis' do
  action :create
  owner 'root'
  group 'root'
  mode 0755
end

bash 'install_osmosis' do
  action :nothing
  cwd '/tmp'
  code <<-EOH
    wget http://bretth.dev.openstreetmap.org/osmosis-build/osmosis-latest.tgz
    tar zxf osmosis/osmosis-latest.tgz -C /opt/osmosis
  EOH
  not_if 'test -d /opt/osmosis/bin/osmosis'
end

