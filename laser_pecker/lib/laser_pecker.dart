library laser_pecker;

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';

import 'assets_generated/assets.gen.dart';
import 'l10n/generated/l10n.dart';

export 'l10n/generated/l10n.dart';

part 'src/laser_pecker_app.dart';

part 'src/models/login_model.dart';

part 'src/models/user_model.dart';

part 'src/pages/login/login_page.dart';

part 'src/pages/main/community_page.dart';

part 'src/pages/main/home_page.dart';

part 'src/pages/main/main_page.dart';

part 'src/pages/main/mine_page.dart';

/// [toast]
lpToast(Widget msg) => toast(
      msg,
      bgBlurSigma: kM,
      position: OverlayPosition.center,
    );

/// [loadAssetSvgWidget]
Widget lpSvgWidget(
  String key, {
  Color? tintColor,
  UiColorFilter? colorFilter,
  BoxFit fit = BoxFit.contain,
}) =>
    loadAssetSvgWidget(
      key,
      package: "laser_pecker",
      tintColor: tintColor,
      colorFilter: colorFilter,
      fit: fit,
    );

/// [loadAssetImageWidget]
Widget lpImageWidget(
  String key, {
  BoxFit? fit,
  double? width,
  double? height,
}) =>
    loadAssetImageWidget(
      key,
      package: "laser_pecker",
      fit: fit,
      width: width,
      height: height,
    );
