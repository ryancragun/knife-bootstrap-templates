# Knife Bootstrap Templates

## Description
A repo that contains Chef knife bootstrap templates for strange Distro's that aren't supported out of the box.

## Templates

CentOS 4.9 :thumbsdown: | :warning: These will overwrite the :poop: system Ruby (1.8.1).  Omnibus packages would require their own omnibus-software repo with compilable dependencies.  That's not gonna happen with ggc 3.4.6.
------------------------|--------------------
centos4-rpm | Installs Ruby and Chef via RPMs
centos4-gem | Installs Ruby via an RPM and chef as a gem
## Installation

```shell
git clone https://github.com/ryancragun/knife-bootstrap-templates
mkdir -p ~/.chef/bootstrap
cp ./knife-bootstrap-templates/templates/* ~/.chef/bootstrap/
```

## Usage

To bootstrap with custom template you specify them with the ```--distro``` switch.

```shell
knife bootstrap 127.0.0.1 -p 2201 --sudo -x vagrant -i ~/.ssh/vagrant --distro centos4-rpm
```

or

```shell
knife bootstrap 127.0.0.1 -p 2201 --sudo -x vagrant -i ~/.ssh/vagrant --distro centos4-gem
```

## License

Author:: Ryan Cragun - @ryancragun<br>
Copyright:: Copyright (c) 2014 Chef Software, Inc.<br>
License:: Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
