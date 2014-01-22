osmosis Cookbook
==================
Downloads and extracts osmosis

Usage
-----
#### osmosis::default
Simply ```include_recipe 'osmosis::default'```

Attributes
----------
#### default
* installdir
Where should osmosis be installed.

* user
User to install osmosis as. The user will
not be created by the cookbook, so it must
already exist.

* group
Group to install osmosis with.

* dirmode
Directory mode for installdir.

* remote_source
Where to download osmosis from.

* filename
Derive the filename from the last portion of the
url download string.

* java
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

