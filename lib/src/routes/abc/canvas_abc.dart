import 'package:flutter/material.dart';
import 'package:flutter3_abc/src/routes/main_route.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_canvas/flutter3_canvas.dart';
import 'package:lp_module/lp_module.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2024/02/01
///
class CanvasAbc extends StatefulWidget {
  const CanvasAbc({super.key});

  @override
  State<CanvasAbc> createState() => _CanvasAbcState();
}

class _CanvasAbcState extends State<CanvasAbc> with BaseAbcStateMixin {
  ///
  CanvasFolderProject tempFolderProject = CanvasFolderProject();

  /// 最后一次自动保存的时间3
  Duration lastAutoSaveTime = nowDuration();
  final CanvasDelegate canvasDelegate = CanvasDelegate();
  late CanvasListener canvasListener = CanvasListener(
    onCanvasPaint: (delegate, paintCount) {
      //2次时间间隔超过10秒, 自动保存
      final now = nowDuration();
      //debugger();
      if (delegate.isRequestRefresh &&
          delegate.isElementChanged &&
          now - lastAutoSaveTime > 10.seconds) {
        //自动保存
        lastAutoSaveTime = now;
        //debugger();
        tempFolderProject.saveProject(canvasDelegate).get((value, error) {
          //debugger();
          if (error != null) {
            l.d(error);
          } else {
            delegate.isRequestRefresh = false;
            delegate.isElementChanged = false;
            l.i('自动保存工程成功');
          }
        });
      }
    },
    onCanvasViewBoxChangedAction: (canvasViewBox, isCompleted) {
      updateState();
    },
    onCanvasElementSelectChangedAction: (elementSelect, from, to) {
      //debugger();
      updateState();
    },
    onDoubleTapElementAction: (elementPainter) {
      //debugger();
      ElementPainter painter = elementPainter;
      if (elementPainter is ElementSelectComponent) {
        painter = elementPainter.selectedChildElement;
      }
      if (painter is LpElementMixin) {
        final bean = painter.elementBean;
        buildContext.showWidgetDialog(AddTextDialog(
          canvasDelegate,
          defaultText: bean?.text,
          forceType: bean?.mtype,
          onSubmitted: (text) {
            (painter as LpElementMixin).wrapChangeElementBeanAction(
              () {
                bean?.text = text;
              },
              resetElementSize: true,
            );
          },
        ));
      }
    },
  );

  @override
  void initState() {
    super.initState();
    canvasDelegate.addCanvasListener(canvasListener);
    var axisManager = canvasDelegate.canvasPaintManager.axisManager;
    canvasDelegate.canvasEventManager.canvasBoundsEventComponent
        .addBoundsEventActionMap(
            Rect.fromLTRB(
              0,
              0,
              axisManager.yAxisWidth,
              axisManager.xAxisHeight,
            ), (event, touchType) {
      if (touchType == TouchDetectorMixin.sTouchTypeClick) {
        //在坐标轴左上角点击
        canvasDelegate.canvasViewBox.changeMatrix(Matrix4.identity());
      }
      return true;
    });

    loadAssetImage("all_in2.webp")?.getValue((image, error) async {
      //debugger();
      if (image != null) {
        //final base64 = await image.toBase64();
        final element = ImageElementPainter();
        element.initFromImage(image);
        element.paintProperty?.left = -1000;
        element.paintProperty?.top = -1000;
        canvasDelegate.canvasElementManager.beforeElements.add(element);
      }
    });

    loadAssetImage("flutter.png")?.getValue((image, error) async {
      //debugger();
      if (image != null) {
        //final base64 = await image.toBase64();
        final element = ImageElementPainter();
        element.initFromImage(image);
        const sx = 0.5;
        const sy = 0.5;
        element.paintProperty?.left = -element.paintProperty!.width * sx;
        element.paintProperty?.top = -element.paintProperty!.height * sy;
        element.paintProperty?.scaleX = sx;
        element.paintProperty?.scaleY = sy;
        canvasDelegate.canvasElementManager.beforeElements.add(element);
      }
    });

    //initCanvasDelegateElement();
    postFrameCallback((timeStamp) {
      tempFolderProject.openProject(
        canvasDelegate,
        onConfirmAction: (projectBean, painterList) async {
          if (isNil(painterList)) {
            return false;
          }
          final confirm = await showDialogWidget(
              buildContext,
              IosNormalDialog(
                title: "提示",
                message: "恢复之前的工程?",
                cancel: "取消",
                confirm: "确定",
                onConfirmTap: (_) async {
                  return false;
                },
              ));
          return confirm;
        },
      );
    });
  }

  List<Offset> calculateControlPoints(
      Offset startPoint, Offset endPoint, Offset curvePoint) {
    double x1 = startPoint.dx + (2.0 / 3.0) * (curvePoint.dx - startPoint.dx);
    double y1 = startPoint.dy + (2.0 / 3.0) * (curvePoint.dy - startPoint.dy);

    double x2 = endPoint.dx + (2.0 / 3.0) * (curvePoint.dx - endPoint.dx);
    double y2 = endPoint.dy + (2.0 / 3.0) * (curvePoint.dy - endPoint.dy);

    return [Offset(x1, y1), Offset(x2, y2)];
  }

  @override
  void reassemble() {
    super.reassemble();
    //initCanvasDelegateElement();
  }

  void initCanvasDelegateElement() {
    canvasDelegate.canvasElementManager.clearElements();
    /*final path = "M0 0 L100 0 L100 100 L0 100z"
        .toPath()
        */ /*.transformPath(Matrix4.identity()..translateTo(x: 100, y: 100))*/ /*;*/

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(100, 0)
      ..lineTo(100, 100)
      ..lineTo(0, 100)
      ..lineTo(0, 0)
      ..close()
      ..moveTo(0, 0)
      ..lineTo(1, 1)
      ..close()
      ..moveTo(-50, -50)
      ..lineTo(-100, -100) /*..close()*/;

    path.eachPathMetrics(
        (posIndex, ratio, contourIndex, position, angle, isClose) {
      l.d('$isClose posIndex:$posIndex ratio:$ratio contourIndex:$contourIndex '
          'position:$position angle:${angle.toDegrees}° $angle ');
    }, 50);

    const width = 100.0;
    const height = 100.0;
    const kappa = 0.5522848; // 4 * ((√(2) - 1) / 3)
    const ox = (width / 2.0) * kappa; // control point offset horizontal
    const oy = (height / 2.0) * kappa; // control point offset vertical

    const cx = width / 2.0; // center x
    const cy = height / 2.0; // center y

    const p1 = Offset(0, 0);
    const cc = Offset(width / 2, 0);
    const p2 = Offset(width, 0);
    // l.d(stringBuilder((builder) {
    //   /*builder.write("M${cx - width / 2} ${cy}");
    //   //半圆到p2
    //   builder.write(
    //       "C${cx - width / 2} ${cy - oy} ${cx - ox} ${cy - height / 2} $cx ${cy - height / 2}");*/
    //   builder.write("M${p1.dx} ${p1.dy}");
    //   builder.write("A${width / 2} ${height / 2} 0 0 1 ${p2.dx} ${p2.dy}");
    // }));

    l.d(stringBuilder((builder) {
      builder.write("M${p1.dx} ${p1.dy}");
      final c = calculateControlPoints(p1, p2, cc);
      builder.write(
          "C${c[0].dx} ${c[0].dy} ${c[1].dx} ${c[1].dy} ${p2.dx} ${p2.dy}");
    }));

    /*final path = Path()
      ..moveTo(0, 0)
      ..lineTo(100, 100)
      ..lineTo(100, 0)
      ..close();*/

    /*canvasDelegate.canvasElementManager.addElement(PathElementPainter()
      ..paintProperty = (PaintProperty()
        ..width = 10
        ..height = 10)
      ..path = (Path()..addOval(const Rect.fromLTWH(0, 0, 10, 10))));*/

    final element1 = PathElementPainter()
      ..paintProperty = (PaintProperty()
        ..angle = 15.hd
        ..left = -100
        ..top = -100
        ..width = 50
        ..height = 50)
      ..painterPath = (Path()..addRect(const Rect.fromLTWH(0, 0, 50, 50)));
    final element2 = PathElementPainter()
      ..paintProperty = (PaintProperty()
        ..angle = 0.hd
        ..left = -50
        ..top = -50
        ..width = 80
        ..height = 50)
      ..painterPath = (Path()..addOval(const Rect.fromLTWH(0, 0, 80, 50)));
    final rectGroupElement = ElementGroupPainter()
      ..resetChildren(
          [element1, element2],
          canvasDelegate.canvasElementManager.canvasElementControlManager
              .enableResetElementAngle);
    canvasDelegate.canvasElementManager.addElement(rectGroupElement);

    final ovalElement = PathElementPainter()
      ..paintProperty = (PaintProperty()
        ..left = 50
        ..top = 50
        ..width = 50
        ..height = 50)
      ..painterPath = (Path()..addOval(const Rect.fromLTWH(0, 0, 50, 50)));
    canvasDelegate.canvasElementManager.addElement(ovalElement);

    final rectElement = PathElementPainter()
      ..paintProperty = (PaintProperty()
        ..angle = 0.hd
        ..left = 10
        ..top = 10
        ..width = 50
        ..height = 50)
      ..painterPath = (Path()..addRect(const Rect.fromLTWH(0, 0, 50, 50)));
    canvasDelegate.canvasElementManager.addElement(rectElement);

    final flipRectElement = PathElementPainter()
      ..paintProperty = (PaintProperty()
        ..angle = 15.hd
        ..left = 0
        ..top = 0
        ..flipX = true
        ..flipY = false
        ..width = 50
        ..height = 50)
      ..painterPath = (Path()..addRect(const Rect.fromLTWH(0, 0, 50, 50)));
    canvasDelegate.canvasElementManager.addElement(flipRectElement);

    //const text = "测";
    const text = "测试文本\nangcyo\nمرحبا بالعالم Hello World";
    final textElement = TextElementPainter()
      ..initFromText(text)
      ..paintProperty?.let((it) => it
        ..angle = 0.hd
        ..left = 100
        ..top = 100
        ..skewX = 0.hd
        ..flipX = false
        ..flipY = false);
    canvasDelegate.canvasElementManager.addElement(textElement);

    Offset startPoint = const Offset(100, 100);
    Offset endPoint = const Offset(300, 100);
    Offset curvePoint = const Offset(120, 80);

    List<Offset> controlPoints =
        calculateControlPoints(startPoint, endPoint, curvePoint);

    l.d(buildString((builder) {
      builder.addText('M ${startPoint.dx},${startPoint.dy}');
      builder.addText(
          'C ${controlPoints[0].dx},${controlPoints[0].dy} ${controlPoints[1].dx},${controlPoints[1].dy} ${endPoint.dx},${endPoint.dy}');
    }));

    canvasDelegate.canvasElementManager.clearElements();
  }

  @override
  void dispose() {
    super.dispose();
    canvasDelegate.removeCanvasListener(canvasListener);
  }

  @override
  Widget buildAbc(BuildContext context) {
    //return super.buildAbc(context);
    l.d('build canvas abc');
    return GestureHitInterceptScope(
      child: PinchGestureWidget(
        onPinchAction: () {
          assert(() {
            l.i("onPinchAction...捏合");
            return true;
          }());
          context.pushWidget(const DebugPage());
        },
        child: super.buildAbc(context),
      ),
    );
  }

  @override
  List<Widget> buildBodyList(BuildContext context) {
    const height = 35.0;
    const origin = Offset(0, 0);

    const rect = Rect.fromLTWH(10, 10, 20, 20);
    final scaleMatrix = Matrix4.identity()..scaleBy(sx: 1, sy: 1);
    final flipMatrix = Matrix4.identity()
      ..scaleBy(sx: -1, sy: -1, anchor: rect.center);

    final r1 = scaleMatrix.mapRect(rect);
    final r2 = flipMatrix.mapRect(rect);

    //final bean = ElementBean().toJsonString();

    //debugger();

    /*const rect = Rect.fromLTWH(10, 10, 20, 20);
    final matrix = Matrix4.identity()..rotateBy(180.hd, anchor: rect.center);
    final rect2 = matrix.mapRect(rect);
    debugger();*/

    /*final rotateMatrix1 = Matrix4.identity();
    rotateMatrix1.translateBy(x: 100, y: 100);

    final rotateMatrix2 = Matrix4.identity()..rotateBy(180.hd);
    rotateMatrix2.translateBy(x: 100, y: 100);

    final rotateMatrix3 = Matrix4.identity()..rotateBy(180.hd);
    rotateMatrix3.postTranslateBy(x: 100, y: 100);

    final rotateMatrix4 = Matrix4.identity()..rotateBy(180.hd);
    final translateMatrix = Matrix4.identity()..translateTo(x: 100, y: 100);
    rotateMatrix4.postConcat(translateMatrix);

    final testMatrix = rotateMatrix2 * translateMatrix;
    final testMatrix2 = translateMatrix * rotateMatrix2;

    debugger();*/

    /*final list = [1, 2, 3, 4];
    final list2 = list.clone();
    list.remove(2);
    debugger();*/

    return [
      [
        CanvasWidget(canvasDelegate),
        CanvasUndoWidget(canvasDelegate)
            .radiusShadow(color: Colors.white, radius: kCanvasIcoItemRadiusSize)
            .position(right: 10, bottom: 10),
      ].stack()!,
      [
        GradientButton.normal(
          onTap: () => {
            canvasDelegate.canvasViewBox.scaleBy(sx: 1.5, sy: 1.5),
          },
          child: "缩放画布".text(),
        ),
        GradientButton.normal(
          onTap: () => {
            canvasDelegate.canvasViewBox
                .scaleBy(sx: 1.5, sy: 1.5, pivot: const Offset(100, 100)),
          },
          child: "定点缩放".text(),
        ),
        GradientButton.normal(
          onTap: () {
            canvasDelegate.showRect(enableZoomIn: false, enableZoomOut: false);
            LpConfigHelper.fetchDeviceSettingConfig(
                LpConfigHelper.DEVICE_SETTING_CONFIG_URL,
                LpConfigHelper.DEVICE_SETTING_CONFIG_FILE_NAME);
            //context.showDialog(TooLargeWarnDialog())
          },
          child: "test".text(),
        ),
        /*GradientButton.normal(
          onTap: () {
            Matrix4 matrix = Matrix4.identity();
            matrix.translateTo(x: 50, y: 50);
            canvasDelegate.canvasElementManager.canvasElementControlManager
                .elementSelectComponent
                .scaleElementWithCenter(matrix);
          },
          child: "移动元素".text(),
        ),
        GradientButton.normal(
          onTap: () {
            canvasDelegate.canvasElementManager.canvasElementControlManager
                .elementSelectComponent
                .rotateBy(15.toRadians);
          },
          child: "旋转元素".text(),
        ),
        GradientButton.normal(
          onTap: () {
            final matrix = Matrix4.identity();
            final anchor = canvasDelegate
                .canvasElementManager
                .canvasElementControlManager
                .elementSelectComponent
                .paintProperty
                ?.anchor;
            const sx = 1.2;
            const sy = 1.2;
            matrix.scaleBy(
              sx: sx,
              sy: sy,
              anchor: anchor,
            );
            canvasDelegate.canvasElementManager.canvasElementControlManager
                .elementSelectComponent
                .scaleElement(sx: sx, sy: sy, anchor: anchor);
          },
          child: "等比缩放元素".text(),
        ),
        GradientButton.normal(
          onTap: () {
            l.d(canvasDelegate.canvasElementManager.canvasElementControlManager
                .elementSelectComponent.paintProperty?.paintScaleRotateBounds);
            final matrix = Matrix4.identity();
            final anchor = canvasDelegate
                .canvasElementManager
                .canvasElementControlManager
                .elementSelectComponent
                .paintProperty
                ?.anchor;
            const sx = 1.2;
            const sy = 1.5;
            matrix.scaleBy(
              sx: sx,
              sy: sy,
              anchor: anchor,
            );
            canvasDelegate.canvasElementManager.canvasElementControlManager
                .elementSelectComponent
                .scaleElement(sx: sx, sy: sy, anchor: anchor);
          },
          child: "不等比缩放元素".text(),
        ),*/
      ].wrap()!,
      [
        textSpanBuilder((builder) {
          /*builder.addText("绘制:");
          builder.addTextStyle("${canvasDelegate.paintCount}",
              color: Colors.red);
          builder.addText(" 刷新请求:");
          builder.addTextStyle("${canvasDelegate.refreshCount}\n",
              color: Colors.red);

          builder.addText("画布原点:");
          builder.addTextStyle(
              "$origin->${canvasDelegate.canvasViewBox.toViewPoint(origin)}\n",
              color: Colors.red);

          builder.addText("可见区域:");
          builder.addTextStyle(
              "${canvasDelegate.canvasViewBox.canvasBounds.log}->${canvasDelegate.canvasViewBox.canvasVisibleBounds.log}\n",
              color: Colors.red);

          final pointerMap = canvasDelegate.canvasEventManager.pointerMap;
          if (pointerMap.isNotEmpty) {
            builder.addText("指针:");
            pointerMap.forEach((key, value) {
              builder.addTextStyle(
                  "$key:${value.localPosition}->${canvasDelegate.canvasViewBox.toScenePoint(value.localPosition)}\n",
                  color: Colors.red);
            });
          }
          final selectBounds = canvasDelegate.canvasElementManager
              .canvasElementControlManager.elementSelectComponent.selectBounds;
          if (selectBounds != null) {
            builder.addText("选择框:");
            builder.addTextStyle("$selectBounds\n", color: Colors.red);
          }
          final selectElement = canvasDelegate.canvasElementManager
              .canvasElementControlManager.elementSelectComponent;
          if (selectElement.isSelectedElement) {
            builder.addText("选择[${selectElement.children?.length}]:");
            builder.addTextStyle(
                "${selectElement.paintProperty?.paintRectBounds}\n",
                color: Colors.red);
          }*/
        }),
      ].wrap()!,
      SliverFillRemaining(
        hasScrollBody: false,
        fillOverscroll: true,
        child: CanvasDesignLayoutWidget(
          canvasDelegate: canvasDelegate,
        ).align(Alignment.bottomCenter),
      ),
    ];
  }
}
