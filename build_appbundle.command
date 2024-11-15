#!/bin/bash

# Turn off echo
set +x

dart run Flutter3Core/script/build_config.dart & flutter build appbundle --release