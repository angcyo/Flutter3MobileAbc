import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';

import 'base_abc.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/09
///

class OverlayAbc extends StatefulWidget {
  const OverlayAbc({super.key});

  @override
  State<OverlayAbc> createState() => _OverlayAbcState();
}

class _OverlayAbcState extends State<OverlayAbc> with BaseAbcStateMixin {
  onPressed() {}

  @override
  List<Widget> buildBodyList(BuildContext context) {
    WidgetList buttonList = [
      GradientButton(
        onPressed: () {
          showLoading(context: context);
          delayCallback(
            () => hideLoading(),
            const Duration(seconds: 2),
          );
        },
        child: const Text('显示加载'),
      ),
      GradientButton(
        onPressed: () {
          hideLoading();
        },
        child: const Text('关闭加载'),
      ),
      GradientButton(
        onPressed: () {
          showOverlay((context, progress) => randomTextWidget());
        },
        child: const Text('显示一个Overlay'),
      ),
      GradientButton(
        onPressed: () {
          showNotification((context) => randomTextWidget(),
              alignment: Alignment.topCenter);
        },
        child: const Text('显示一个Overlay(顶部)'),
      ),
      GradientButton(
        onPressed: () {
          showNotification((context) => randomTextWidget(),
              alignment: Alignment.bottomCenter);
        },
        child: const Text('显示一个Overlay(底部)'),
      ),
      GradientButton(
        onPressed: () {
          showNotification((context) => randomTextWidget(),
              alignment: Alignment.center);
        },
        child: const Text('显示一个Overlay(居中)'),
      ),
      GradientButton(
        onPressed: () {
          //Loader.show(context);
        },
        child: const Text('Test1'),
      ),
      GradientButton(
        onPressed: () {
          //Loader.hide();
        },
        child: const Text('Test2'),
      ),
    ];

    return [
      buttonList.wrap().paddingAll(8),
    ];
  }
}
