#!/bin/bash
if [ ! -f modules/secrets/manifests/init.pp ]
  then
    scripts/decrypt.sh
fi
git submodule update --init
pushd modules/minecraft/files
wget --timestamping 'http://ci.md-5.net/job/Spigot/lastStableBuild/artifact/Spigot-Server/target/spigot.jar'
popd
mkdir -p modules/essentials/files
pushd modules/essentials/files
wget --timestamping 'http://dev.bukkit.org/media/files/740/302/Essentials.zip'
unzip -u Essentials.zip
popd
mkdir -p modules/worldedit/files
pushd modules/worldedit/files
wget --timestamping 'http://dev.bukkit.org/media/files/739/932/worldedit-5.5.8.zip'
unzip -u worldedit-5.5.8.zip
popd

