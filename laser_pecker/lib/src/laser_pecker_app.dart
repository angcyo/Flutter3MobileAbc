part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/20
///

class LaserPeckerAppColor extends GlobalTheme {
  /// 颜色配置
  @override
  Color get primaryColor => "#fce04a".toColor();

  @override
  Color get primaryColorDark => "#fbcb38".toColor();
}

class LaserPeckerApp extends StatefulWidget {
  const LaserPeckerApp({super.key});

  @override
  State<LaserPeckerApp> createState() => _LaserPeckerAppState();
}

class _LaserPeckerAppState extends State<LaserPeckerApp> {
  @override
  Widget build(BuildContext context) {
    return GlobalThemeConfig(
      globalTheme: LaserPeckerAppColor(),
      child: const MainPage(),
    );
  }
}
