@echo off
rem 设置当前控制台为UTF-8编码
chcp 65001 >> nul
rem https://docs.flutter.dev/deployment/android#build-the-app-for-release
dart run Flutter3Core/script/build_config.dart & flutter build appbundle --release