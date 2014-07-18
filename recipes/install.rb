#
# Cookbook Name:: osmosis
# Recipe:: install
#

ark 'osmosis' do
  url               node[:osmosis][:url]
  version           node[:osmosis][:version]
  owner             node[:osmosis][:user]
  prefix_root       node[:osmosis][:installdir]
  has_binaries      ['bin/osmosis']
  strip_components  0
  only_if { node[:osmosis][:install_type] == 'tgz' }
end

package 'osmosis' do
  action :install
  only_if { node[:osmosis][:install_type] == 'pkg' }
end
