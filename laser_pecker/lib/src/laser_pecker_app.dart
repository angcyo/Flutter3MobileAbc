part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/20
///

/// 是否要显示社区相关控制
const kShowCommunityControl = true;
const kProductPrefix = "LaserPecker";

class LaserPeckerAppColor extends GlobalTheme {
  /// 颜色配置
  @override
  Color get primaryColor => "#fce04a".toColor();

  @override
  Color get primaryColorDark => "#fbcb38".toColor();
}

///[LaserPeckerAppState]全局配置
GlobalKey<LaserPeckerAppState> laserPeckerApp = GlobalKey();

class LaserPeckerApp extends StatefulWidget {
  LaserPeckerApp() : super(key: laserPeckerApp);

  @override
  State<LaserPeckerApp> createState() => LaserPeckerAppState();
}

class LaserPeckerAppState extends State<LaserPeckerApp> {
  late UserModel userModel;
  var globalConfig = GlobalConfig();

  LaserPeckerAppState() {
    globalConfig.globalTheme = LaserPeckerAppColor();
  }

  @override
  void initState() {
    super.initState();
    Http.getBaseUrl = () =>
    isDebug ? "https://alternate.hingin.com" : "https://server.hingin.com";
    registerGlobalViewModel<UserModel>(() => UserModel());

    rDio.dio.interceptors.add(TokenInterceptor(configToken: (options) {
      options.headers['token'] = userModel.userBeanData.value?.token;
    }));

    userModel = context.getViewModel();
    userModel.restoreLogin();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalConfigScope(
      globalConfig: globalConfig,
      child: const MainPage(),
    );
  }
}
