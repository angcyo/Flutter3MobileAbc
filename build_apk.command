#!/bin/bash

# Turn off echo
set +x

# https://docs.flutter.dev/deployment/android#build-an-apk

echo "🚀 [1/3] 准备构建配置信息并打包..."
dart run Flutter3Core/script/build_config.dart

echo "✅ [2/3] 开始执行 Flutter 编译..."
flutter build apk --release

echo "🎉 [3/3] 准备收集产物..."
dart run Flutter3Core/script/collect_product.dart

# dart run Flutter3Core/script/build.dart -p "com.angcyo.flutter3.abc" -f "pretest" & flutter build apk --release --build-name "1.0.0" --build-number "2"
# dart run build_runner build --delete-conflicting-outputs

# https://docs.flutter.dev/deployment/android

# build/app/outputs/apk/release/app-release.apk
# --build-name  --build-number
# flutter build apk --release --build-name "1.0.0" --build-number "1"

# flutter build ios --release --build-name "1.0.0" --build-number "1"
# echo "Build done"
