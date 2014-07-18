# Knife Bootstrap Templates

## Description
A repo that contains Chef knife bootstrap templates for strange Distro's that aren't supported out of the box.

## Installation

```shell
git clone https://github.com/ryancragun/knife-bootstrap-templates
mkdir -p ~/.chef/bootstrap
cp ./knife-bootstrap-templates/templates/* ~/.chef/bootstrap/
```

## Usage
Right now I've included two templates for CentOS 4.9 :thumbsdown:.  One installs Ruby and Chef via RPMs, the other installs Ruby via an RPM and then installs the chef as a gem.  Either work just fine but beware that they'll both will overwrite the :poop: Ruby 1.8.1.  I tried to created an Omnibus package to sandbox this but that was a herd of Yak's I had not time to shave.  (ggc 3.4.6, I don't even...)

To use bootstrap files you specify them with the ```--distro``` switch with knife bootstrap.

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
