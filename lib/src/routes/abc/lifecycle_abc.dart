import 'package:flutter/material.dart';
import 'package:flutter3_abc/src/routes/abc/pages/lifecycle_page.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/08/08
///
/// 生命周期测试
class LifecycleAbc extends StatefulWidget {
  const LifecycleAbc({super.key});

  @override
  State<LifecycleAbc> createState() => _LifecycleAbcState();
}

class _LifecycleAbcState extends BaseLifecycleState<LifecycleAbc> {
  final List<String> _messageList = [];

  int count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final globalTheme = GlobalTheme.of(context);
    return RScrollView(
      children: [
        SliverAppBar(title: widget.runtimeType.toString().text()),
        [
          GradientButton.normal(() {
            _messageList.clear();
            updateState();
          }, child: "清空".text()),
          GradientButton.normal(() {
            context.pushWidget(LifecyclePage(
              title: "Title ${count++}",
              content: "Content ${count++}",
            ));
          }, child: "启动路由".text()),
          GradientButton.normal(() {
            context.pushReplacementWidget(LifecyclePage(
              title: "Title ${count++}",
              content: "Content ${count++}",
            ));
          }, child: "启动替换路由".text())
        ].flowLayout(childGap: kX, padding: const EdgeInsets.all(kX))!,
        for (final item in _messageList)
          item
              .text(textColor: globalTheme.whiteColor)
              .container(
                color: randomColor(),
                padding: const EdgeInsets.all(kX),
              )
              .rListTile(),
      ],
    ).scaffold(backgroundColor: globalTheme.themeWhiteColor);
  }

  @override
  void onLifecycleEvent(LifecycleEvent event) {
    super.onLifecycleEvent(event);
    l.v("[${classHash()}]->$event");
    _messageList.add("${nowTimeString()}->$event");
    updateState();
    debounce(() {
      _messageList.add('========================================');
      updateState();
    }, 1000);
  }

  @override
  void onLifecycleFirstVisible(BuildContext context) {
    _messageList.add("${nowTimeString()}->页面首次可见");
  }

  @override
  void onLifecycleVisible(BuildContext context) {
    _messageList.add("${nowTimeString()}->页面可见");
  }

  @override
  void onLifecycleInvisible(BuildContext context) {
    _messageList.add("${nowTimeString()}->页面不可见");
  }
}
