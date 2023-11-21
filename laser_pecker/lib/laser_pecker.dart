library laser_pecker;

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';

import 'assets_generated/assets.gen.dart';
import 'l10n/generated/l10n.dart';

export 'l10n/generated/l10n.dart';

part 'src/laser_pecker_app.dart';

part 'src/pages/main/community_page.dart';

part 'src/pages/main/home_page.dart';

part 'src/pages/main/main_page.dart';

part 'src/pages/main/mine_page.dart';

/// [loadAssetSvgWidget]
Widget lpSvgWidget(
  String key, {
  UiColorFilter? colorFilter,
  BoxFit fit = BoxFit.contain,
}) =>
    loadAssetSvgWidget(
      key,
      package: "laser_pecker",
      colorFilter: colorFilter,
      fit: fit,
    );

/// [loadAssetImageWidget]
Widget lpImageWidget(
  String key, {
  BoxFit? fit,
}) =>
    loadAssetImageWidget(
      key,
      package: "laser_pecker",
      fit: fit,
    );
