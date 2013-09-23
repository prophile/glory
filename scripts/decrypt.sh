#!/bin/bash
OPTIONS=$(find modules/secrets -maxdepth 1 -name 'secrets.*' | sed 's/.*\.//')
echo "Select secrets file:"
select config in $OPTIONS; do
    file="modules/secrets/secrets.$config"
    openssl enc -d -aes-256-cbc -in $file -out modules/secrets/manifests/init.pp
    echo $file
    break
done

