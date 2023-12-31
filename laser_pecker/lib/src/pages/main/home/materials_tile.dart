import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:laser_pecker/src/models/bean/materials_bean.dart';

import '../../../../assets_generated/assets.gen.dart';
import '../../../../laser_pecker.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/30
///
/// 素材显示
class MaterialsTile extends StatelessWidget {
  /// 是否选中
  final bool isSelected;

  /// 设备数据
  final MaterialsBean? bean;

  /// 子布局
  final Widget? child;

  const MaterialsTile({
    super.key,
    this.bean,
    this.child,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final globalTheme = GlobalTheme.of(context);
    final bean = this.bean;
    final sourcePath = bean?.sourcePath;
    final cacheSize = screenWidth / 3;
    return [
      sourcePath?.toImageWidget(
        fit: BoxFit.contain,
        memCacheWidth: cacheSize.floor(),
      ),
      child,
      isSelected
          ? lpSvgWidget(Assets.svg.circleChecked)
              .align(alignment: Alignment.bottomRight)
          : null,
      if (isDebug && !isNullOrEmpty(sourcePath))
        sourcePath!
            .exName()
            .text(textColor: Colors.white, fontSize: 10)
            .container(
                decoration: fillDecoration(fillColor: Colors.black12),
                padding: const EdgeInsets.symmetric(horizontal: kM))
            .align(alignment: Alignment.topRight),
    ].stack(alignment: Alignment.center)!.container(
          color: isSelected
              ? globalTheme.themeWhiteColor.withOpacity(0.2)
              : globalTheme.themeWhiteColor,
          radius: kX,
          shadowBlurRadius: kDefaultBlurRadius,
          padding: const EdgeInsets.all(kH),
        );
  }
}
