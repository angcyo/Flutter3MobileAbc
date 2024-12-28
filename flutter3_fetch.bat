@echo off
rem 设置当前控制台为UTF-8编码
chcp 65001 >> nul

set "coreFolder=Flutter3Core"
IF EXIST "%CD%\%coreFolder%\" (
    cd %coreFolder%
    echo 准备拉取仓库：%coreFolder%
    git fetch
    git rebase origin/main
    cd ..
) else (
    echo 准备克隆仓库：%coreFolder%
    git clone git@github.com:angcyo/Flutter3Core.git
)

set "extendFolder=Flutter3Extend"
IF EXIST "%CD%\%extendFolder%\" (
    cd %extendFolder%
    echo 准备拉取仓库：%extendFolder%
    git fetch
    git rebase origin/main
    cd ..
) else (
    echo 准备克隆仓库：%extendFolder%
    git clone git@github.com:angcyo/Flutter3Extend.git
)

echo "结束"
pause