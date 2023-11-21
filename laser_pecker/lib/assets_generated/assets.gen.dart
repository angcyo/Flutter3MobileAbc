/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/defaultBanner.png
  AssetGenImage get defaultBanner =>
      const AssetGenImage('assets/png/defaultBanner.png');

  /// List of all assets
  List<AssetGenImage> get values => [defaultBanner];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/add_device.svg
  String get addDevice => 'assets/svg/add_device.svg';

  /// File path: assets/svg/community_normal.svg
  String get communityNormal => 'assets/svg/community_normal.svg';

  /// File path: assets/svg/community_selected.svg
  String get communitySelected => 'assets/svg/community_selected.svg';

  /// File path: assets/svg/default_device_avatar.svg
  String get defaultDeviceAvatar => 'assets/svg/default_device_avatar.svg';

  /// File path: assets/svg/default_user_avatar.svg
  String get defaultUserAvatar => 'assets/svg/default_user_avatar.svg';

  /// File path: assets/svg/home_album.svg
  String get homeAlbum => 'assets/svg/home_album.svg';

  /// File path: assets/svg/home_camera.svg
  String get homeCamera => 'assets/svg/home_camera.svg';

  /// File path: assets/svg/home_creation.svg
  String get homeCreation => 'assets/svg/home_creation.svg';

  /// File path: assets/svg/home_material.svg
  String get homeMaterial => 'assets/svg/home_material.svg';

  /// File path: assets/svg/home_normal.svg
  String get homeNormal => 'assets/svg/home_normal.svg';

  /// File path: assets/svg/home_selected.svg
  String get homeSelected => 'assets/svg/home_selected.svg';

  /// File path: assets/svg/mine_normal.svg
  String get mineNormal => 'assets/svg/mine_normal.svg';

  /// File path: assets/svg/mine_selected.svg
  String get mineSelected => 'assets/svg/mine_selected.svg';

  /// List of all assets
  List<String> get values => [
        addDevice,
        communityNormal,
        communitySelected,
        defaultDeviceAvatar,
        defaultUserAvatar,
        homeAlbum,
        homeCamera,
        homeCreation,
        homeMaterial,
        homeNormal,
        homeSelected,
        mineNormal,
        mineSelected
      ];
}

class Assets {
  Assets._();

  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
