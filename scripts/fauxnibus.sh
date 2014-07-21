#!/bin/sh

yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel openssl-devel make bzip2 autoconf automake libtool bison curl

tmp_dir=$(mktemp -d) || exit 1
ruby_dir=$(mktemp -d) || exit 1
yaml_dir=$(mktemp -d) || exit 1
chef_dir=$(mktemp -d) || exit 1
rpm_dir=$(mktemp -d) || exit 1
mkdir -p "~/chef_pkgs"

cd "$tmp_dir"
curl -Lk https://s3-us-west-2.amazonaws.com/ancient-images/yaml-0.1.6.tar.gz -o yaml.tgz
curl -Lk https://s3-us-west-2.amazonaws.com/ancient-images/ruby-1.9.3-p547.tar.gz -o ruby.tgz
tar zxvf yaml.tgz
tar zxvf ruby.tgz

cd "$tmp_dir/yaml-0.1.6/"
./configure --prefix=/usr/local
make
make install
make install DESTDIR="$yaml_dir"

cd "$tmp_dir/ruby-1.9.3-p547/"
./configure
make
make install
make install DESTDIR="$ruby_dir"

gem install --no-ri --no-rdoc --install-dir "$chef_dir" chef
gem install -y fpm

cd "$rpm_dir"
find "$chef_dir" -name '*.gem' | xargs -rn1 fpm -d ruby --prefix /usr/local/lib/ruby/gems/1.9.1 -s gem -t rpm
fpm --verbose -s dir -t rpm -n ruby -v 1.9.3 -C "$ruby_dir" -p ruby-1.9.3-p547.el4.i386.rpm -d 'yaml' /usr/local/bin /usr/local/lib /usr/local/include
fpm --verbose -s dir -t rpm -n yaml -v 0.1.6 -C "$yaml_dir" -p yaml.0.1.6.el4.i386.rpm /usr/local/lib /usr/local/include

tar cfz fauxnibus-chef.tgz ./*
mv {fauxnibus-chef.tgz,ruby-1.9.3-p547.el4.i386.rpm,yaml.0.1.6.el4.i386.rpm} "~/chef_pkgs/"
echo 'Packages have been placed in ~/chef_pkgs'
rm -rf $tmp_dir $ruby_dir $yaml_dir $chef_dir $rpm_dir
