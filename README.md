# asdf-mongodb [![Build Status](https://travis-ci.org/sylph01/asdf-mongodb.svg?branch=master)](https://travis-ci.org/sylph01/asdf-mongodb)

[MongoDB](https://www.mongodb.org) binary plugin for [asdf](https://github.com/asdf-vm/asdf)

## Limitations

This plugin downloads the most generic binary for the given version number of MongoDB. Which means:

- The distribution does not include SSL encryption.
- For Linux, there are binaries compiled for different distributions, but the binaries downloaded with this plugin is the generic Linux binary (Linux legacy binary), which means the binary may lack the performance optimizations included in distribution-specific binaries.

For this reason, this plugin is targeted for development environments. For production environments, please set up your environments manually.

Also, this plugin handles only the installation of the binary file. You will still need to set up your data directory (for example, `mkdir -p /data/db`, and setting permissions so that `mongod` can read it) manually. Please consult the [Installation Guide](https://docs.mongodb.org/manual/installation/) of your environment for details.

## Versioning Convention of MongoDB

MongoDB uses a versioning convention where:

- Even-numbered builds are production releases (2.4.x, 2.6.x, 3.0.x)
- Odd-numbered builds are development/unstable releases (2.5.x, 2.7.x, 3.1.x)
- Minor version numbers indicate bugfix/security releases

All versions that can be downloaded from the server is included in the version list. In most of the cases, you will install the **even-numbered production release** with the **highest minor version number.**

## Install

```
asdf plugin-add mongodb https://github.com/sylph01/asdf-mongodb.git
```

## Use

Check [asdf](https://github.com/asdf-vm/asdf) readme for instructions on how to install & manage versions of MongoDB.
