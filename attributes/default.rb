# default attributes
#

default[:osmosis][:install_type]  = 'deb' # 'pkg' or 'tgz'
default[:osmosis][:pkg_version]   = '0.0.1'
default[:osmosis][:installdir]    = '/opt/osmosis'
default[:osmosis][:user]          = 'root'
default[:osmosis][:group]         = 'root'
default[:osmosis][:java]          = true

# for pkg install
default[:osmosis][:dirmode]       = 0755
default[:osmosis][:remote_source] = 'http://bretth.dev.openstreetmap.org/osmosis-build/osmosis-latest.tgz'
default[:osmosis][:filename]      = default[:osmosis][:remote_source].split('/').last

