import 'package:flutter/widgets.dart';
import 'package:flutter3_basics/flutter3_basics.dart';

///
/// App的声明周期
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/10/23
///

class AppLifecycle extends AppLifecycleListener with AppLifecycleLog {
  /// 注册一个全局的生命周期监听
  static AppLifecycle install() {
    WidgetsFlutterBinding.ensureInitialized();
    return AppLifecycle();
  }
}
