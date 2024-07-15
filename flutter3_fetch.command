#!/bin/bash

# Turn off echo
set +x

coreFolder="Flutter3Core"

if [ -d "$PWD/$coreFolder" ]; then
    cd %coreFolder%
    git fetch
    # git reabase origin/master
else
    git clone git@gitee.com:angcyo/Flutter3Core.git
fi

cd ..

extendFolder="Flutter3Extend"

if [ -d "$PWD/$extendFolder" ]; then
    cd %extendFolder%
    git fetch
    rem git reabase origin/master
else
    git clone git@gitee.com:angcyo/Flutter3Extend.git
fi

cd ..

read -n 1 -s -r -p "Press any key to continue..."
