#!/bin/bash

# Turn off echo
set +x

#echo $PUB_HOSTED_URL
#export PUB_HOSTED_URL=https://pub.flutter-io.cn
#echo $PUB_HOSTED_URL
dart run build_runner build --delete-conflicting-outputs