osmosis Cookbook
================
![Build Status](https://circleci.com/gh/mapzen/chef-osmosis.png?circle-token=2e34aedb4ea6b3cd53244a7ae912cb699599f80c)

Usage
-----
#### osmosis::default
Simply ```include_recipe 'osmosis::default'```

Attributes
----------
### default

#### install_type
'pkg' or 'source'. The former installs osmosis
as a debian package, the latter pulls from node[:osmosis][:url] 
and unpacks the tarball to node[:osmosis][:installdir]. Ark will
create a symlink to '/usr/local/bin/osmosis', assuming you use the defaults.
* default: tgz

#### installdir
Only used for install_type 'tgz'.
* default: /usr/local

#### user
Only used for install_type 'tgz'.
User to install osmosis as. The user will
not be created by the cookbook, so it must
already exist.
* default: root

#### url
Where to download osmosis from if using install_type == 'tgz'
* default: http://bretth.dev.openstreetmap.org/osmosis-build/osmosis-#{node[:osmosis][:version]}.tgz

#### version
Only used for install_type 'tgz'
* default: 0.43.1

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: grant@mapzen.com
