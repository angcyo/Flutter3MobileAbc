@echo off
set "coreFolder=Flutter3Core"

IF EXIST "%CD%\%coreFolder%\" (
    cd %coreFolder%
    git fetch
    rem git reabase origin/master
) else (
    git clone git@gitee.com:angcyo/Flutter3Core.git 
)

cd ..

set "extendFolder=Flutter3Extend"

IF EXIST "%CD%\%extendFolder%\" (
    cd %extendFolder%
    git fetch
    rem git reabase origin/master
) else (
    git clone git@gitee.com:angcyo/Flutter3Extend.git
)

cd ..

pause