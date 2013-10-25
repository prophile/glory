#!/bin/bash
set -e
if [ ! -f settings.yaml ]
  then
    echo "No settings.yaml found."
    exit 1
fi
git submodule update --init
scripts/unpack-secrets.rb
exec scripts/download-deps.sh

