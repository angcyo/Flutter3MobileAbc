import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:laser_pecker/laser_pecker.dart';
import 'package:laser_pecker/src/pages/main/home/add_device_bean.dart';

import '../../../../assets_generated/assets.gen.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/30
///
/// 添加设备,设备选择tile
class AddDeviceTile extends StatelessWidget {
  /// 是否选中
  final bool isSelected;

  /// 设备数据
  final AddDeviceBean? bean;

  const AddDeviceTile({
    super.key,
    required this.bean,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final globalTheme = GlobalTheme.of(context);
    final bean = this.bean;
    return [
      lpImageWidget(bean?.assetsKey, fit: BoxFit.contain),
      bean?.name?.text().align(alignment: Alignment.topLeft),
      isSelected
          ? lpSvgWidget(Assets.svg.squareChecked)
              .align(alignment: Alignment.topRight)
          : null,
    ].stack(alignment: Alignment.center)!.container(
          color: isSelected
              ? globalTheme.accentColor.withOpacity(0.2)
              : globalTheme.itemWhiteBgColor,
          radius: kX,
          padding: const EdgeInsets.all(kH),
          borderColor: isSelected
              ? globalTheme.accentColor
              : globalTheme.itemWhiteBgColor,
        );
  }
}
