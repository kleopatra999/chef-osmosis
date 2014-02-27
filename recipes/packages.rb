#
# Cookbook Name:: osmosis
# Recipe:: packages
#
# Copyright 2013, Mapzen
#
# All rights reserved - Do Not Redistribute
#

package 'openjdk-7-jre' do
  action :remove
end

include_recipe 'java'

