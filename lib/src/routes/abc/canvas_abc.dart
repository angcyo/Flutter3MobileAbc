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

  @override
  Widget buildAbc(BuildContext context) {
    //return super.buildAbc(context);
    return GestureHitInterceptScope(
      child: super.buildAbc(context),
    );
  }

  @override
  List<Widget> buildBodyList(BuildContext context) {
    const height = 30.0;
    return [
      CanvasWidget(canvasDelegate: canvasDelegate),
      [
        GradientButton(
          onTap: () => {
            canvasDelegate.canvasViewBox.scaleBy(scaleX: 1.5, scaleY: 1.5),
          },
          minHeight: height,
          child: "test".text(),
        ),
      ].wrap()!,
    ];
  }
}
