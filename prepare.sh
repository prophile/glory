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
unzip -f Essentials.zip
popd

