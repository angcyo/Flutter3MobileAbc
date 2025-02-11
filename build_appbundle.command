#!/bin/bash

# Turn off echo
set +x

# https://docs.flutter.dev/deployment/android#build-the-app-for-release
dart run Flutter3Core/script/build_config.dart & flutter build appbundle --release