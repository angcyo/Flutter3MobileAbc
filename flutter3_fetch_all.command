#!/bin/bash

# Turn off echo
set +x

echo "准备拉取仓库"
git fetch
git rebase origin/main

chmod 755 ./flutter3_fetch.command

./flutter3_fetch.command
