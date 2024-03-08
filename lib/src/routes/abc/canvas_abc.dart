import 'package:flutter/material.dart';
import 'package:flutter3_abc/src/routes/main_route.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_canvas/flutter3_canvas.dart';

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
  final CanvasDelegate canvasDelegate = CanvasDelegate();
  late CanvasListener canvasListener = CanvasListener(
    onCanvasViewBoxChangedAction: (canvasViewBox, isCompleted) {
      updateState();
    },
    onCanvasSelectBoundsChangedAction: (bounds) {
      updateState();
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
      if (touchType == TouchDetectorMixin.TOUCH_TYPE_CLICK) {
        //在坐标轴左上角点击
        canvasDelegate.canvasViewBox.changeMatrix(Matrix4.identity());
      }
      return true;
    });

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

    canvasDelegate.canvasElementManager.addElement(PathElementPainter()
      ..paintProperty = (PaintProperty()
        ..left = 100
        ..top = 100
        ..width = 50
        ..height = 50)
      ..path = (Path()..addOval(const Rect.fromLTWH(0, 0, 50, 50))));

    Offset startPoint = Offset(100, 100);
    Offset endPoint = Offset(300, 100);
    Offset curvePoint = Offset(120, 80);

    List<Offset> controlPoints =
        calculateControlPoints(startPoint, endPoint, curvePoint);

    l.d(buildString((builder) {
      builder.addText('M ${startPoint.dx},${startPoint.dy}');
      builder.addText(
          'C ${controlPoints[0].dx},${controlPoints[0].dy} ${controlPoints[1].dx},${controlPoints[1].dy} ${endPoint.dx},${endPoint.dy}');
    }));
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
  void dispose() {
    super.dispose();
    canvasDelegate.removeCanvasListener(canvasListener);
  }

  @override
  Widget buildAbc(BuildContext context) {
    //return super.buildAbc(context);
    return GestureHitInterceptScope(
      child: PinchGestureWidget(
        onPinchAction: () {
          l.i("onPinchAction...捏合");
        },
        child: super.buildAbc(context),
      ),
    );
  }

  @override
  List<Widget> buildBodyList(BuildContext context) {
    const height = 35.0;
    const origin = Offset(0, 0);

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

    return [
      CanvasWidget(canvasDelegate: canvasDelegate),
      [
        GradientButton(
          onTap: () => {
            canvasDelegate.canvasViewBox.scaleBy(sx: 1.5, sy: 1.5),
          },
          minHeight: height,
          child: "缩放画布".text(),
        ),
        GradientButton(
          onTap: () => {
            canvasDelegate.canvasViewBox
                .scaleBy(sx: 1.5, sy: 1.5, pivot: const Offset(100, 100)),
          },
          minHeight: height,
          child: "定点缩放".text(),
        ),
        GradientButton(
          onTap: () {
            Matrix4 matrix = Matrix4.identity();
            matrix.translateTo(x: 50, y: 50);
            canvasDelegate.canvasElementManager.elementSelectComponent
                .applyMatrixWithCenter(matrix);
          },
          minHeight: height,
          child: "移动元素".text(),
        ),
        GradientButton(
          onTap: () {
            canvasDelegate.canvasElementManager.elementSelectComponent
                .rotateBy(15.toRadians);
          },
          minHeight: height,
          child: "旋转元素".text(),
        ),
      ].wrap()!,
      [
        textSpanBuilder((builder) {
          builder.addText("画布原点:");
          builder.addTextStyle("$origin\n", color: Colors.red);
          builder.addText("画布原点(View坐标):");
          builder.addTextStyle(
              "${canvasDelegate.canvasViewBox.toViewPoint(origin)}\n",
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
          final selectBounds = canvasDelegate
              .canvasElementManager.elementSelectComponent.selectBounds;
          if (selectBounds != null) {
            builder.addText("选择框:");
            builder.addTextStyle("$selectBounds\n", color: Colors.red);
          }
        }),
      ].wrap()!,
    ];
  }
}
