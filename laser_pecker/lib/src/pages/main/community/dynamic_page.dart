import 'package:flutter/widgets.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/01/01
///
/// 动态界面
class DynamicPage extends StatefulWidget {
  const DynamicPage({super.key});

  @override
  State<DynamicPage> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage>
    with RScrollPage, LifecycleAware, LifecycleMixin {
  @override
  void onLifecycleEvent(LifecycleEvent event) {
    //debugger();
    l.i("${toRuntimeString()} $event");
    if (event == LifecycleEvent.visible) {
      firstLoad(WidgetState.loading);
    }
  }

  @override
  void onLoadData() {
    //debugger();
    l.d('准备加载动态数据...');
  }
}
