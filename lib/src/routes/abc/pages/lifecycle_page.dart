import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/08/08
///
class LifecyclePage extends StatefulWidget {
  final String? title;
  final String? content;
  final DeviceOrientation? orientation;

  const LifecyclePage({
    super.key,
    this.title,
    this.content,
    this.orientation,
  });

  @override
  State<LifecyclePage> createState() => _LifecyclePageState();
}

class _LifecyclePageState extends BaseLifecycleState<LifecyclePage> {
  ///
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    l.v("[${classHash()}]->${widget.title} didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void onLifecycleVisible(BuildContext context) {
    setScreenOrientation(widget.orientation);
  }

  SystemUiMode? _systemUiModeValue;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "--"),
      ),
      body: [
        Text("LifecyclePage ${widget.content ?? "--"}\n"
                "屏幕方向[$orientation]: ${orientation == Orientation.portrait ? "纵向" : "横向"}")
            .click(() {
          context.pushWidget(LifecyclePage(
            title: "Title ${DateTime.now().millisecondsSinceEpoch}",
            content: "Content ${DateTime.now().millisecondsSinceEpoch}",
          ));
        }),
        GradientButton.normal(() {
          context.pushWidget(LifecyclePage(
            title: "Title ${DateTime.now().millisecondsSinceEpoch}",
            content: "Content ${DateTime.now().millisecondsSinceEpoch}",
            orientation: null,
          ));
        }, child: "启动默认".text()),
        GradientButton.normal(() {
          context.pushWidget(LifecyclePage(
            title: "Title ${DateTime.now().millisecondsSinceEpoch}",
            content: "Content ${DateTime.now().millisecondsSinceEpoch}",
            orientation: DeviceOrientation.landscapeLeft,
          ));
        }, child: "启动横向".text()),
        GradientButton.normal(() {
          context.pushWidget(LifecyclePage(
            title: "Title ${DateTime.now().millisecondsSinceEpoch}",
            content: "Content ${DateTime.now().millisecondsSinceEpoch}",
            orientation: DeviceOrientation.portraitUp,
          ));
        }, child: "启动纵向".text()),
        DropdownButton<SystemUiMode>(
            items: [
              DropdownMenuItem(
                  value: SystemUiMode.leanBack, child: "leanBack".text()),
              DropdownMenuItem(
                  value: SystemUiMode.immersive, child: "immersive".text()),
              DropdownMenuItem(
                  value: SystemUiMode.immersiveSticky,
                  child: "immersiveSticky".text()),
              DropdownMenuItem(
                  value: SystemUiMode.edgeToEdge, child: "edgeToEdge".text()),
              DropdownMenuItem(
                  value: SystemUiMode.manual, child: "manual".text()),
            ],
            value: _systemUiModeValue,
            onChanged: (value) {
              _systemUiModeValue = value ?? SystemUiMode.manual;
              SystemChrome.setEnabledSystemUIMode(_systemUiModeValue!,
                  overlays: [
                    SystemUiOverlay.top,
                    SystemUiOverlay.bottom,
                  ]);
              updateState();
            }),
      ].column(gap: kX)!.center().safeArea(),
    );
  }
}
