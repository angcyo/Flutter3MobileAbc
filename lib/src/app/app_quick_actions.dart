import 'package:flutter3_abc/flutter3_abc.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:quick_actions/quick_actions.dart';


///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/12/21
///
/// https://pub.dev/packages/quick_actions
/// https://pub.dev/packages/flutter_shortcuts
/// https://pub.dev/packages/flutter_shortcut_plus
///
/// 在应用程序图标上添加快捷方式。
class AppQuickActions {
  AppQuickActions._();

  /// 初始化
  @Initialize()
  static void initialize() {
    final QuickActions quickActions = const QuickActions();
    quickActions.initialize((shortcutType) {
      //debugger();
      if (shortcutType == 'action_scan') {
        GlobalConfig.def.globalContext?.pushWidget(const CodeAbc(
          autoScan: true,
        ));
      } else if (shortcutType == 'action_angcyo') {
        "https://github.com/angcyo".launch();
      }
    });
    //--
    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
          type: 'action_scan', localizedTitle: '扫一扫', icon: "scan_icon"),
      const ShortcutItem(
          type: 'action_angcyo',
          localizedTitle: 'angcyo',
          icon: 'flutter_dash_255') //R.drawable.xxx -> R.mipmap.xxx
    ]);
  }
}
