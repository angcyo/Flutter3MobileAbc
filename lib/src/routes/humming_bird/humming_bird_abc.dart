import 'package:flutter/material.dart';
import 'package:flutter3_abc/src/routes/humming_bird/humming_bird_adjust.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:lp_module/lp_module.dart';

import '../abc/canvas_abc.dart';
import '../main_route.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/06/30
///
class HummingBirdAbc extends StatefulWidget {
  const HummingBirdAbc({super.key});

  @override
  State<HummingBirdAbc> createState() => _HummingBirdAbcState();
}

class _HummingBirdAbcState extends State<HummingBirdAbc>
    with BaseAbcStateMixin {
  final resultUpdateSignal = createUpdateSignal();

  final adjust = HummingBirdAdjust();

  @override
  void initState() {
    sRequestHeader = "AA55";
    sDeviceRequestConfig["AA55"] = DeviceRequestConfig(
      header: sRequestHeader,
      dataLength: 2,
      checkLength: defRequestCheckLength,
    );
    super.initState();
  }

  @override
  void dispose() {
    sRequestHeader = "AABB";
    super.dispose();
  }

  @override
  WidgetList buildBodyList(BuildContext context) {
    final globalTheme = GlobalTheme.of(context);

    final deviceId = $deviceManager.operateDeviceId;
    final device = $deviceManager.getAnyDeviceById(deviceId);
    final deviceScanResult = device?.getDeviceScanResult(deviceId);
    final deviceState = device?.getDeviceState(deviceId);

    final deviceQueryVersion =
        $deviceManager.getAnyDeviceQueryVersionById(deviceId);
    final deviceWorkState =
        $deviceManager.getAnyDeviceQueryWorkStateById(deviceId);
    final deviceSetting = $deviceManager.getAnyDeviceQuerySettingById(deviceId);

    //adjust.rotateAngle = 90;
    adjust.updateCount(xCount: 201, yCount: 201);

    return [
      [
        GradientButton.normal(
          () async {
            final connected =
                await context.showWidgetDialog(const DeviceConnectDialog());
            l.d("$connected");
            if (connected) {
              //连接成功
              toastInfo("连接成功");
              updateState();
            }
          },
          child: "连接设备".text(),
        ),
        GradientButton.normal(
          () async {
            final value = await context
                .showWidgetDialog(NumberKeyboardDialog(number: adjust.xFactor));
            if (value != null) {
              adjust.xFactor = value;
              updateState();
            }
          },
          child: "x->${adjust.xFactor}".text(),
        ),
        GradientButton.normal(
          () async {
            final value = await context.showWidgetDialog(
                NumberKeyboardDialog(number: adjust.x2Factor));
            if (value != null) {
              adjust.x2Factor = value;
              updateState();
            }
          },
          child: "x2->${adjust.x2Factor}".text(),
        ),
        GradientButton.normal(
          () async {
            final value = await context
                .showWidgetDialog(NumberKeyboardDialog(number: adjust.yFactor));
            if (value != null) {
              adjust.yFactor = value;
              updateState();
            }
          },
          child: "y->${adjust.yFactor}".text(),
        ),
        GradientButton.normal(
          () async {
            final value = await context.showWidgetDialog(
                NumberKeyboardDialog(number: adjust.y2Factor));
            if (value != null) {
              adjust.y2Factor = value;
              updateState();
            }
          },
          child: "y2->${adjust.y2Factor}".text(),
        ),
        GradientButton.normal(
          () async {
            final pointList = await adjust.adjust();
            resultUpdateSignal.updateValue(adjust.outputLogImage);
            adjust.send(pointList);
          },
          child: "adjust".text(),
        ),
        GradientButton.normal(
          () {},
          onContextTap: (context) {
            context.showArrowPopupRoute(
              CommandTestPopup(
                null,
                resultUpdateSignal: resultUpdateSignal,
              ),
            );
          },
          child: "指令...".text(),
        ),
      ].flowLayout(childGap: kH, padding: const EdgeInsets.all(kX))!,
      "$deviceQueryVersion\n\n$deviceWorkState\n\n$deviceSetting"
          .text(maxLines: 100)
          .paddingAll(kX),
      rebuild(resultUpdateSignal, (context, data) {
        if (data is UiImage) {
          return data.toImageWidget(fit: BoxFit.contain).click(() {
            context.showWidgetDialog(SinglePhotoDialog(
              content: data,
            ));
          });
        } else {
          return data?.toString().text();
        }
      }),
    ];
  }
}
