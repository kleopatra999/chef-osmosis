#
# Cookbook Name:: osmosis
# Recipe:: default
#

include_recipe 'apt::default'
include_recipe 'osmosis::packages'
include_recipe 'osmosis::install'
