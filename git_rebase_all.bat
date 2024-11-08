@echo off
rem 设置当前控制台为UTF-8编码
chcp 65001 >> nul

@echo off
echo fetch main project...
git fetch
git rebase origin/main
cd Flutter3Core
echo fetch Flutter3Core...
git fetch
git rebase origin/main
cd ..
echo fetch Flutter3Extend...
cd Flutter3Extend
git fetch
git rebase origin/main
cd ..
echo fetch finish...
pause