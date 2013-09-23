#!/bin/bash
read -p "Enter config name: " config
file="modules/secrets/secrets.$config"
if [ ! -e $file ]
  then
    read -p "$file does not exist. Create it now? [y/N]" result
    if [ "$result" != "y" ]
      then
        echo "Exiting."
        exit 1
    fi
fi
openssl enc -aes-256-cbc -salt -in modules/secrets/manifests/init.pp -out $file

