import 'dart:ui';

import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/20
///

class AppColor extends GlobalTheme {
  /// 颜色配置
  @override
  Color get primaryColor => "#2febff".toColor();

  @override
  Color get accentColor => "#2febff".toColor();

  @override
  Color get primaryColorDark => "#0cabea".toColor();

  @override
  Color get icoSelectedColor => primaryColor;
}

class AppColorDark extends GlobalThemeDark {
  @override
  Color get accentColor => "#2febff".toColor();
}
