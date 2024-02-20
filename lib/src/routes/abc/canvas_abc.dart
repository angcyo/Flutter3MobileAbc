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
  });

  @override
  void initState() {
    super.initState();
    canvasDelegate.addCanvasListener(canvasListener);
    canvasDelegate.canvasEventManager.canvasBoundsEventComponent
        .addBoundsEventActionMap(
            Rect.fromLTRB(
                0,
                0,
                canvasDelegate.canvasPaintManager.axisManager.yAxisWidth,
                canvasDelegate.canvasPaintManager.axisManager.xAxisHeight),
            (event, touchType) {
      if (touchType == TouchDetectorMixin.TOUCH_TYPE_CLICK) {
        //在坐标轴左上角点击
        canvasDelegate.canvasViewBox.changeMatrix(Matrix4.identity());
      }
      return true;
    });
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
    return [
      CanvasWidget(canvasDelegate: canvasDelegate),
      [
        GradientButton(
          onTap: () => {
            canvasDelegate.canvasViewBox.scaleBy(sx: 1.5, sy: 1.5),
          },
          minHeight: height,
          child: "test".text(),
        ),
        GradientButton(
          onTap: () => {
            canvasDelegate.canvasViewBox
                .scaleBy(sx: 1.5, sy: 1.5, pivot: const Offset(100, 100)),
          },
          minHeight: height,
          child: "定点缩放".text(),
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
          var pointerMap = canvasDelegate.canvasEventManager.pointerMap;
          if (pointerMap.isNotEmpty) {
            builder.addText("指针:");
            pointerMap.forEach((key, value) {
              builder.addTextStyle(
                  "$key:${value.localPosition}->${canvasDelegate.canvasViewBox.toScenePoint(value.localPosition)}\n",
                  color: Colors.red);
            });
          }
        }),
      ].wrap()!,
    ];
  }
}
