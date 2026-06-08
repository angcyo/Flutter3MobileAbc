#!/bin/bash

# Turn off echo
set +x

# https://docs.flutter.dev/deployment/android#build-the-app-for-release
echo "🚀 [1/3] 准备构建配置信息并打包..."
dart run Flutter3Core/script/build_config.dart

echo "✅ [2/3] 开始执行 Flutter 编译..."
flutter build appbundle --release

echo "🎉 [3/3] 准备收集产物..."
dart run Flutter3Core/script/collect_product.dart