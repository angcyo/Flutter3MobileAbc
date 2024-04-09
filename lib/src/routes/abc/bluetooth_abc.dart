import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter3_abc/src/routes/main_route.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:lp_module/lp_module.dart';

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

class _BluetoothAbcState extends State<BluetoothAbc> with BaseAbcStateMixin {
  @override
  void initState() {
    // if your terminal doesn't support color you'll see annoying logs like `\x1B[1;35m`
    assert(() {
      FlutterBluePlus.setLogLevel(LogLevel.verbose, color: true);
      return true;
    }());
    super.initState();

    // listen to scan results
    // Note: `onScanResults` only returns live scan results, i.e. during scanning
    // Use: `scanResults` if you want live scan results *or* the results from a previous scan
    final subscription = FlutterBluePlus.onScanResults.listen(
      (results) {
        //debugger();
        if (results.isNotEmpty) {
          ScanResult r = results.last; // the most recently found device
          l.d('[${r.rssi}]${r.device.remoteId}: "${r.advertisementData.advName}" found!');
        }
      },
      onError: (e) => l.e(e),
    );
    // cleanup: cancel subscription when scanning stops
    FlutterBluePlus.cancelWhenScanComplete(subscription);
  }

  @override
  List<Widget> buildBodyList(BuildContext context) {
    const size = kH;
    return [
      [
        Bluetooth.isSupported().toWidget((value) {
          if (value == true) {
            return "支持蓝牙".text();
          } else {
            return "不支持蓝牙:$value".text();
          }
        }),
        Bluetooth.hasPermissions().toWidget((value) {
          if (value == true) {
            return "有蓝牙权限".text();
          } else {
            return "没有蓝牙权限:$value".text().ink(onTap: () {
              Bluetooth.requestPermissions().get((value, error) {
                updateState();
              });
            });
          }
        }),
        Bluetooth.hasPermissions().toWidget((value) {
          if (value == true) {
            return [
              GradientButton.normal(
                  onTap: () {
                    Bluetooth.scanDevices();
                  },
                  child: "扫描".text()),
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
          .paddingAll(kX)
    ];
  }
}
