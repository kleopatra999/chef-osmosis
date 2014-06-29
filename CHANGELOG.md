CHANGELOG
=========

0.5.0
-----
* remove pkg install

0.4.3
-----
* symlink into /usr/bin option
* explicit java::default

0.4.1
-----
* add `default[:osmosis][:symlink]` option: creates a symlink from 
`node[:osmosis][:installdir]/bin/osmosis` to `/usr/bin/osmosis` when true.
Defaults to nil.

0.4.0
-----
* supports install from pkg or tgz

