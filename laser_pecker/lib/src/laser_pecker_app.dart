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

  @override
  Color get appBarForegroundColor =>
      textTitleStyle.color ?? super.appBarForegroundColor;
}

///[LaserPeckerAppState]全局配置
final GlobalKey<LaserPeckerAppState> laserPeckerApp = GlobalKey();
final NavigatorObserver laserPeckerLifecycleNavigatorObserver =
    LifecycleObserver();

class LaserPeckerApp extends StatefulWidget {
  LaserPeckerApp() : super(key: laserPeckerApp);

  @override
  State<LaserPeckerApp> createState() => LaserPeckerAppState();
}

class LaserPeckerAppState extends State<LaserPeckerApp> {
  late UserModel userModel;
  var appGlobalConfig = GlobalConfig.def; //.copyWith()

  LaserPeckerAppState() {
    _initLaserPeckerApp();
  }

  void _initLaserPeckerApp() {
    //debugger();
    var laserPeckerAppColor = LaserPeckerAppColor();
    appGlobalConfig.globalTheme = laserPeckerAppColor;
    appGlobalConfig.appBarLeadingBuilder = (context, state) {
      //debugger();
      return lpSvgWidget(
        Assets.svg.back,
        tintColor: laserPeckerAppColor.appBarForegroundColor,
      )
          .size(
            width: 24,
            height: 24,
          )
          .wrapContent()
          .ink(
              radius: 999,
              onTap: () {
                context.pop();
              });
    };
    GlobalConfig.app = appGlobalConfig;
  }

  late TokenInterceptor tokenInterceptor =
      TokenInterceptor(configToken: (options) {
    options.headers['token'] = userModel.userBeanData.value?.token;
    options.headers['language'] = context.locale.languageCode;
    options.headers['bundleId'] = "com.hingin.lp1.hiprint";
  }, refreshToken: (response) async {
    if (!mounted) {
      return Future.value(null);
    }
    return await userModel.wrapLoginPage(context);
  });

  @override
  void initState() {
    //debugger();
    super.initState();

    Http.getBaseUrl = () => "https://server.hingin.com";
    //isDebug ? "https://alternate.hingin.com" : "https://server.hingin.com";

    registerGlobalViewModel<UserModel>(() => UserModel());
    rDio.addInterceptor(tokenInterceptor);

    userModel = context.getViewModel();
    userModel.restoreLogin();
  }

  @override
  void dispose() {
    //debugger();
    GlobalConfig.app = null;
    rDio.removeInterceptor(tokenInterceptor);
    super.dispose();
  }

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    var globalConfig = GlobalConfig.of(context);
    //globalConfig.globalTheme = appGlobalConfig.globalTheme;
    //globalConfig.appBarLeadingBuilder = appGlobalConfig.appBarLeadingBuilder;
    return GlobalConfigScope(
      globalConfig: globalConfig,
      child: GlobalThemeScope(
        globalTheme: LaserPeckerAppColor(),
        child: WillPopScope(
          child: Navigator(
            key: _navigatorKey,
            observers: [
              laserPeckerLifecycleNavigatorObserver,
              NavigatorObserverLog(),
            ],
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                  builder: (context) {
                    return const MainPage();
                  },
                  settings: settings);
            },
          ),
          onWillPop: () async {
            return (await _navigatorKey.currentState?.maybePop()) == false;
          },
        ),
      ),
    );
  }

  @override
  void activate() {
    //debugger();
    super.activate();
  }

  @override
  void deactivate() {
    //debugger();
    super.deactivate();
  }

  @override
  void reassemble() {
    //debugger();
    _initLaserPeckerApp();
    super.reassemble();
  }
}
