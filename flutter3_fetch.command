#!/bin/bash

# Turn off echo
set +x

coreFolder="Flutter3Core"

if [ -d "$PWD/$coreFolder" ]; then
    cd $coreFolder
    echo "准备拉取仓库：$coreFolder"
    git fetch
    git rebase origin/main
else
    echo "准备克隆仓库：$coreFolder"
    git clone git@gitee.com:angcyo/Flutter3Core.git
fi

cd ..

extendFolder="Flutter3Extend"

if [ -d "$PWD/$extendFolder" ]; then
    cd $extendFolder
    echo "准备拉取仓库：$extendFolder"
    git fetch
    git rebase origin/main
else
    echo "准备克隆仓库：$extendFolder"
    git clone git@gitee.com:angcyo/Flutter3Extend.git
fi

cd ..

read -n 1 -s -r -p "!结束! Press any key to continue..."
