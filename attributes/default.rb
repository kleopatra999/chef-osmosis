# default attributes
#

default[:osmosis][:installdir]    = '/opt/osmosis'
default[:osmosis][:user]          = 'root'
default[:osmosis][:group]         = 'root'
default[:osmosis][:dirmode]       = 0755
default[:osmosis][:remote_source] = 'http://bretth.dev.openstreetmap.org/osmosis-build/osmosis-latest.tgz'
default[:osmosis][:filename]      = default[:osmosis][:remote_source].split('/').last
default[:osmosis][:java]          = true

