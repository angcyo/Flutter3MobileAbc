import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_canvas/flutter3_canvas.dart';
import 'package:lp_module/lp_module.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/07/29
///
/// 新设计界面
class CanvasAbc2 extends StatefulWidget {
  const CanvasAbc2({super.key});

  @override
  State<CanvasAbc2> createState() => _CanvasAbc2State();
}

class _CanvasAbc2State extends State<CanvasAbc2> with CreationMixin {
  @override
  void initState() {
    super.initState();
    initCanvasDesign2Style();

    //logo
    final element = TextElementPainter();
    element.initElementFromText("LaserPecker");
    element.paintProperty
      ?..left = -1110
      ..top = -1110;
    canvasDelegate.canvasElementManager.beforeElements.add(element);
  }

  @override
  ElementPainter? createDeviceBoundsPainter() => DeviceContentPainter();

  @override
  Widget build(BuildContext context) {
    final globalTheme = GlobalTheme.of(context);
    return OverlayManager(
      controller: overlayManagerController,
      home: Scaffold(
        backgroundColor: globalTheme.themeWhiteColor,
        body: [
          buildCreationAppBar(context),
          kHorizontalLine,
          buildCreationContainer(context, CanvasWidget(canvasDelegate))
              .expanded(),
          /*buildCreationNavigation(context),*/
        ].column()!.stackOf(
            buildCreationNavigation(context).position(alignBottom: true)),
      ),
    );
  }
}
