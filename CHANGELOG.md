# slurm CHANGELOG
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this project adheres to [Semantic Versioning](http://semver.org/).

This file is used to list changes made in each version of the slurm cookbook.

## 0.6.0

### Added

- MUNGE user and group with pre-established uid and gid 
- SLURM user and group with pre-established uid and gid
- Updated documentation

## 0.5.6

### Removed

- munge service nfs mount due to user uid mismatch between the controller and the compute nodes

## 0.5.5

### Changed

- Now using supermarket sources for all dependent cookbooks

## 0.5.4

### Added

- Chef logging (info) for compute information on mount stage

## 0.5.3

### Fixed

- Ruby syntax error on assignment

## 0.5.2

### Added

- subnet filtering to exports file, via the `node['slurm']['nfs_network']` attribute
- `enabled` option to chef `mount` resources
- proper update to `exportfs`

### Fixed

- slurm.conf newlines and definitions
- exports file generation
- slurm variable `apps_dir` deprecated

## 0.5.1

### Changed

- apps directory is now slurm directory, making nodes mount the nfs share to the correct path  

## 0.4.1

### Added

- TESTING.md

## 0.4.0

### Added

- Shifter support and dependency
- Kitchen suite with shifter support
- Older Ubuntu/Debian images 

## 0.3.9

### Changed

- proxy is now passed as attribute
- action for slurm services to `:start`

## 0.3.8

### Changed

- proxy string not ending with ";" anymore, gave false negatives in InSpec 

## 0.3.7

### Fixed

- `plugin_shifter` recipe, had `default` instead of `node`

## 0.3.6

### Changed

- now using appropriate attribute names instead of `node['fqdn']`

## 0.3.5

### Changed

- now passing root password to reflect changes in mariadb cookbook, `node['mariadb']['server_root_password']` is no longer used as default.

## 0.3.4

### Changed

- translating base64 munge key into binary

## 0.3.3

### Removed

- support for Ubuntu 16.04. The slurm version from apt repos is < 16 so slurmdbd fails to start because of hostname issues.

## 0.3.2

### Added

- support for monolith testing, setting `node['slurm']['monolith_testing']` attribute to `true` configures slurm.conf file with an entry for the `slurmctl` too

### Fixed

- `cgroup_allowed_devices_file.conf` missing error
- nfs mount resource does not apply to monolith
- typo in slurm.conf property
- Service resource commands for Slurm server

## 0.3.1

### Added

- Added `apt_repository` variable to mariadb_repository, changed its mirror to `http://mirrors.up.pt/pub/mariadb/repo` 

### Removed

- Fully removed support for CentOS

## 0.3.0

### Added

- slurm controller automatic registration with the slurm accounting
- NFS package installation for the slurm controller and compute nodes 
- NFS configuration for the slurm controller and compute nodes

### Removed

- disable ipv6 on the chef run list

### Modified

- `.kitchen.yml` sets up a mariadb database, a slurmdb daemon and a slurm controller in one single `controller` machine
- changed proxy address to its fqdn, so it will either resolve in ipv5 ou ipv6 

### Fixed

- added some redundant `apt update` commands as in some cases the apt cache didn't seem to be updated

## 0.2.0

### Added

- working database recipe
- recipe to disable ipv6 on linux systems

## 0.1.0

Initial release.

### Added

- created skeleton for the recipes of the different slurm components
- created initial inspec tests
- created initial chefspec tests
- created a modified version of openstack-common get_password library
- created test data bag skeleton and changed usual location for them, as well as the data bag secret
- created some attributes, the data structure's structure is still not set in stone
