#!/bin/bash
set -e
cd modules/website/files
git fetch
git merge --ff-only origin/master
cd ../../..
git add modules/website/files
