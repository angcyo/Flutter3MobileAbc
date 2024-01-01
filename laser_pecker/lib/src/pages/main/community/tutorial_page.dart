import 'package:flutter/widgets.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/01/01
///
/// 教程界面
class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage>
    with RScrollPage, LifecycleAware, LifecycleMixin {
  @override
  void onLifecycleEvent(LifecycleEvent event) {
    l.i("${toRuntimeString()} $event");
    if(event == LifecycleEvent.visible) {
      firstLoad(WidgetState.loading);
    }
  }

  @override
  void onLoadData() {
    l.d('准备加载教程数据...');
  }
}
