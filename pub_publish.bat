@echo off
rem 设置当前控制台为UTF-8编码
chcp 65001 >> nul

:: 尝试发布检查
:: flutter packages pub publish --dry-run

:: 发布
flutter packages pub publish