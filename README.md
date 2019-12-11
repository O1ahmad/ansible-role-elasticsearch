Ansible Role :mag_right: :high_brightness: Elasticsearch
=========
[![Galaxy Role](https://img.shields.io/ansible/role/45171.svg)](https://galaxy.ansible.com/0x0I/elasticsearch)
[![Downloads](https://img.shields.io/ansible/role/d/45171.svg)](https://galaxy.ansible.com/0x0I/elasticsearch)
[![Build Status](https://travis-ci.org/0x0I/ansible-role-elasticsearch.svg?branch=master)](https://travis-ci.org/0x0I/ansible-role-elasticsearch)

**Table of Contents**
  - [Supported Platforms](#supported-platforms)
  - [Requirements](#requirements)
  - [Role Variables](#role-variables)
      - [Install](#install)
      - [Config](#config)
      - [Launch](#launch)
      - [Uninstall](#uninstall)
  - [Dependencies](#dependencies)
  - [Example Playbook](#example-playbook)
  - [License](#license)
  - [Author Information](#author-information)

Ansible role that installs and configures Elasticsearch, a real-time distributed search and analytics engine.

##### Supported Platforms:
```
* Debian
* Redhat(CentOS/Fedora)
* Ubuntu
```

Requirements
------------

Requires the `unzip/gtar` utility to be installed on the target host. See ansible `unarchive` module [notes](https://docs.ansible.com/ansible/latest/modules/unarchive_module.html#notes) for details.

Role Variables
--------------
Variables are available and organized according to the following software & machine provisioning stages:
* _install_
* _config_
* _launch_

#### Install

`elasticsearch`can be installed using OS package management systems (e.g `apt`, `yum`) or compressed archives (`.tar`, `.zip`) downloaded and extracted from various sources.

_The following variables can be customized to control various aspects of this installation process, ranging from software version and source location of binaries to the installation directory where they are stored:_

`install_type: <package | archive>` (**default**: archive)
- **package**: supported by Debian and Redhat distributions, package installation of Elasticsearch pulls the specified package available from the respective package management repositories.
  - Note that the installation directory is determined by the package management system and currently defaults to `/usr/share` for both distros. Attempts to set and execute a package installation on other Linux distros will result in failure due to lack of support.
- **archive**: compatible with both **tar and zip** formats, archived installation binaries can be obtained from local and remote compressed archives either from the official [download/releases](https://www.elastic.co/downloads/elasticsearch) site or those generated from development/custom sources.

`default_install_dir: </path/to/installation/dir>` (**default**: `/opt/elasticsearch`)
- path on target host where the `elasticsearch` binaries should be extracted to. *ONLY* relevant when `install_type` is set to **archive**.

`archive_url: <path-or-url-to-archive>` (**default**: see `defaults/main.yml`)
- address of a compressed **tar or zip** archive containing `elasticsearch` binaries. This method technically supports installation of any available version of `elasticsearch`. Links to official versions can be found [here](https://www.elastic.co/downloads/past-releases#elasticsearch). *ONLY* relevant when `install_type` is set to **archive**

`archive_checksum: <path-or-url-to-checksum>` (**default**: see `defaults/main.yml`)
- address of a checksum file for verifying the data integrity of the specified archive. While recommended and generally considered a best practice, specifying a checksum is *not required* and can be disabled by providing an empty string (`''`) for its value. *ONLY* relevant when `install_type` is set to **archive**.

`package_url: <path-or-url-to-package>` (**default**: see `defaults/main.yml`)
- address of a **DEB or RPM** package containing `elasticsearch` source and binaries. Note that the installation layout is determined by the package management systems. Consult Elastic's official documentation for both [RPM](https://www.elastic.co/guide/en/elasticsearch/reference/current/rpm.html) and [Debian](https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html) installation details. *ONLY* relevant when `install_type` is set to **package**

`package_checksum: <path-or-url-to-checksum>` (**default**: see `vars/...`)
- address of a checksum file for verifying the data integrity of the specified package. While recommended and generally considered a best practice, specifying a checksum is *not required* and can be disabled by providing an empty string (`''`) for its value. *ONLY* relevant when `install_type` is set to **package**.

`checksum_format: <string>` (**default**: see `sha512`)
- hash algorithm used for file verification associated with the specified archive or package checksum. Reference [here](https://en.wikipedia.org/wiki/Cryptographic_hash_function) for more information about checksums/cryptographic hashes. 

#### Config

...*description of configuration related vars*...

#### Launch

...*description of service launch related vars*...

#### Uninstall

...*description of uninstallation related vars*...

Dependencies
------------

- 0x0i.systemd

Example Playbook
----------------
default example:
```
- hosts: all
  roles:
  - role: 0xOI.elasticsearch
```

License
-------

Apache, BSD, MIT

Author Information
------------------

This role was created in 2019 by O1.IO.
