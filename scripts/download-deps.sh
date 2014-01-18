#!/bin/bash
pushd modules/minecraft/files
wget --timestamping 'http://ci.md-5.net/job/Spigot/lastSuccessfulBuild/artifact/Spigot-Server/target/spigot.jar'
popd
mkdir -p modules/essentials/files
pushd modules/essentials/files
wget --timestamping 'http://dev.bukkit.org/media/files/758/474/Essentials.zip'
unzip -u Essentials.zip
popd
mkdir -p modules/worldedit/files
pushd modules/worldedit/files
wget --timestamping 'http://dev.bukkit.org/media/files/739/932/worldedit-5.5.8.zip'
unzip -u worldedit-5.5.8.zip
popd
mkdir -p modules/prism/files
pushd modules/prism/files
wget --timestamping 'http://dev.bukkit.org/media/files/751/785/Prism-v1.6.8.jar'
popd
mkdir -p modules/nocheatplus/files
pushd modules/nocheatplus/files
wget --timestamping 'http://dev.bukkit.org/media/files/753/528/NoCheatPlus.jar'
popd
mkdir -p modules/worldborder/files
pushd modules/worldborder/files
wget --timestamping 'http://dev.bukkit.org/media/files/761/625/WorldBorder.jar'
popd
mkdir -p modules/permissionsex/files
pushd modules/permissionsex/files
wget --timestamping 'http://dev.bukkit.org/media/files/742/103/PermissionsEx.jar'
popd
mkdir -p modules/worldguard/files
pushd modules/worldguard/files
wget --timestamping 'http://dev.bukkit.org/media/files/719/258/worldguard-5.8.zip'
unzip -u worldguard-5.8.zip
popd

