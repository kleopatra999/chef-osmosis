#
# Cookbook Name:: osmosis
# Recipe:: install
#

case node[:osmosis][:install_type]
when 'tgz'
  ark 'osmosis' do
    url               node[:osmosis][:url]
    version           node[:osmosis][:version]
    owner             node[:osmosis][:user]
    prefix_root       node[:osmosis][:installdir]
    has_binaries      ['bin/osmosis']
    strip_components  0
  end
when 'pkg'
  package 'osmosis' do
    action :install
  end
end
