#!/bin/bash
scripts/decrypt.sh
git submodule update --init
wget 'http://ci.md-5.net/job/Spigot/lastStableBuild/artifact/Spigot-Server/target/spigot.jar' -O modules/minecraft/files/spigot.jar

