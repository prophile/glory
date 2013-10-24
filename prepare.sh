#!/bin/bash
if [ ! -f modules/secrets/manifests/init.pp ]
  then
    scripts/decrypt.sh
fi
git submodule update --init
exec scripts/download-deps.sh

