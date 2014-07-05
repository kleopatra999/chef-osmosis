# default attributes
#
default[:osmosis][:install_type]  = 'tgz' # 'pkg' or 'tgz'
default[:osmosis][:user]          = 'root'

# for tgz
#
default[:osmosis][:version]     = '0.43.1'
default[:osmosis][:url]         = "http://bretth.dev.openstreetmap.org/osmosis-build/osmosis-#{node[:osmosis][:version]}.tgz"
default[:osmosis][:installdir]  = '/usr/local'
