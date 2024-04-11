import 'package:flutter/material.dart';
import 'package:flutter3_abc/src/routes/main_route.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:lp_module/lp_module.dart';

import 'model/device_scan_mixin.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/04/09
///
class BluetoothAbc extends StatefulWidget {
  const BluetoothAbc({super.key});

  @override
  State<BluetoothAbc> createState() => _BluetoothAbcState();
}

class _BluetoothAbcState extends State<BluetoothAbc>
    with BaseAbcStateMixin, StreamSubscriptionMixin, DeviceScanMixin {
  /// 蓝牙设备操作
  final BlueDevice blueDevice = BlueDevice();

  @override
  DeviceMixin get device => blueDevice;

  late TextFieldConfig scanFilterServicesField = TextFieldConfig(
    text: "scanFilterServicesField".hiveGet(),
    hintText: "扫描过滤的服务id",
    notifyDefaultTextChange: true,
    onChanged: (value) {
      //debugger();
      "scanFilterServicesField".hivePut(value);
      blueDevice.scanFilterServices = value.splitAndTrim(" ");
    },
  );
  late TextFieldConfig scanFilterKeywordsField = TextFieldConfig(
    text: "scanFilterKeywordsField".hiveGet(),
    hintText: "扫描过滤的关键字",
    notifyDefaultTextChange: true,
    onChanged: (value) {
      //debugger();
      "scanFilterKeywordsField".hivePut(value);
      blueDevice.scanFilterKeywords = value.splitAndTrim(" ");
    },
  );

  @override
  List<Widget> buildBodyList(BuildContext context) {
    const size = kH;
    return [
      [
        Bluetooth.isSupported().toWidget((value) {
          if (value == true) {
            return "支持蓝牙[${true.toDC()}]".text();
          } else {
            return "[$value]不支持蓝牙".text();
          }
        }).ink(() {}),
        Bluetooth.hasPermissions().toWidget((value) {
          if (value == true) {
            return "蓝牙权限[${true.toDC()}]".text();
          } else {
            return "蓝牙权限[$value]".text().ink(() {
              context.showWidgetDialog(
                MessageDialog(
                    title: "注意",
                    message: "即将请求蓝牙相关权限!",
                    onConfirmTap: ((_) async {
                      Bluetooth.requestPermissions().get((value, error) {
                        updateState();
                      });
                      return false;
                    })),
              );
            });
          }
        }),
        Bluetooth.hasPermissions().toWidget((value) {
          if (value == true) {
            return [
              GradientButton.normal(() {
                if (blueDevice.scanStateStream.value) {
                  blueDevice.stopScanDevices("手动停止扫描");
                } else {
                  blueDevice.scanDevices();
                }
              },
                  child: (blueDevice.scanStateStream.value ? "停止扫描" : "扫描")
                      .text()),
            ].wrap()!;
          } else {
            return empty;
          }
        }),
      ]
          .wrap(
            spacing: size,
            runSpacing: size,
            crossAxisAlignment: WrapCrossAlignment.center,
          )!
          .paddingAll(kX),
      SingleInputWidget(config: scanFilterServicesField)
          .paddingSymmetric(horizontal: kX, vertical: kL),
      SingleInputWidget(config: scanFilterKeywordsField)
          .paddingSymmetric(horizontal: kX, vertical: kL),
      for (var item
          in blueDevice.scanDeviceListStream.value
            ..sort((a, b) => b.rssi.compareTo(a.rssi)))
        FindDeviceInfoTile(blueDevice, item),
    ];
  }
}
