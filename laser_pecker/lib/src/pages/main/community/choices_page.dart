import 'package:flutter/widgets.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/01/01
///
/// 精选界面
class ChoicesPage extends StatefulWidget {
  const ChoicesPage({super.key});

  @override
  State<ChoicesPage> createState() => _ChoicesPageState();
}

class _ChoicesPageState extends State<ChoicesPage>
    with RScrollPage, LifecycleAware, LifecycleMixin {
  @override
  void onLifecycleEvent(LifecycleEvent event) {
    l.i("${toRuntimeString()} $event");
    if (event == LifecycleEvent.visible) {
      firstLoad(WidgetState.loading);
    }
  }

  @override
  void onLoadData() {
    l.d('准备加载精选数据...');
  }
}
