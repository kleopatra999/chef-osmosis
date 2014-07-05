# default attributes
#
default[:osmosis][:install_type]  = 'tgz' # 'pkg' or 'tgz'
default[:osmosis][:user]          = 'root'

# for tgz
#
default[:osmosis][:version]     = '0.43.1'
default[:osmosis][:url]         = "https://github.com/openstreetmap/osmosis/archive/#{node[:osmosis][:version]}.tar.gz"
default[:osmosis][:installdir]  = '/usr/local'
