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
  /// 是否恢复临时工程
  final bool? restoreTempProject;

  /// 需要打开的工程
  final ProjectBean? openProjectBean;

  const CanvasAbc2({
    super.key,
    this.restoreTempProject,
    this.openProjectBean,
  });

  @override
  State<CanvasAbc2> createState() => _CanvasAbc2State();
}

class _CanvasAbc2State extends State<CanvasAbc2> with CreationMixin {
  @override
  void initState() {
    restoreTempProject = widget.restoreTempProject;
    if (widget.openProjectBean != null) {
      restoreTempProject = false;
    }
    super.initState();
    initCanvasDesign2Style();

    //logo
    final element = TextElementPainter();
    element.initElementFromText("LaserPecker");
    element.paintProperty
      ?..left = -1110
      ..top = -1110;
    canvasDelegate.canvasElementManager.beforeElements.add(element);

    if (widget.openProjectBean != null) {
      postCallback(() {
        CanvasZipProject(zipFilePath: widget.openProjectBean!.projectPath)
            .openProject(canvasDelegate: canvasDelegate);
      });
    }
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
        resizeToAvoidBottomInset: false,
        body: [
          [
            buildCreationAppBar(context),
            kHorizontalLine,
            CanvasHeaderTile(canvasDelegate).size(height: 16),
            kHorizontalLine,
            buildCreationContainer(context, CanvasWidget(canvasDelegate))
                .expanded(),
            /*buildCreationNavigation(context),*/
          ].column()!,
          buildCreationNavigation(context).position(alignBottom: true),
          buildCreationQuickActions(context).position(
            right: 0,
            bottom: kCanvas2NavigationHeight,
          ),
        ].stack(),
      ),
    ).interceptPopResult(() async {
      if (canvasDelegate.isCanvasEmpty == true) {
        return false;
      }
      return showSaveLocalProject();
    });
  }
}
