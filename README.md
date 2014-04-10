osmosis Cookbook
==================

Downloads and extracts osmosis

Current Build Status
--------------------
[![Travis Build Status](https://secure.travis-ci.org/mapzen/chef-osmosis.png)](http://travis-ci.org/mapzen/chef-osmosis)
[![CircleCI Build Status](https://circleci.com/gh/mapzen/chef-osmosis.png?circle-token=2e34aedb4ea6b3cd53244a7ae912cb699599f80c)](https://circleci.com/gh/mapzen/chef-osmosis)

Usage
-----
#### osmosis::default
Simply ```include_recipe 'osmosis::default'```

Attributes
----------
### default

#### install_type
'pkg' or 'tgz'. The former installs osmosis
as a debian package from the Mapzen debian repo,
the latter pulls from node[:osmosis][:remote_source] 
and unpacks the tarball to node[:osmosis][:installdir].

#### installdir
Where should osmosis be installed if using install_type == 'pkg'

#### user
User to install osmosis as. The user will
not be created by the cookbook, so it must
already exist.

#### group
Group to install osmosis with.

#### dirmode
Directory mode for installdir.

#### remote_source
Where to download osmosis from if using install_type == 'pkg'

#### filename
Derive the filename from the last portion of the
url download string.

#### java
Should we install java?
Default: true


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
