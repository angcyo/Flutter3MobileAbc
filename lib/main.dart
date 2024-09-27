import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter3_abc/src/routes/abc/canvas_abc2.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_web/flutter3_web.dart';
import 'package:lp_module/lp_module.dart';

import 'l10n/generated/l10n.dart';
import 'l10n/intl_merge.dart';
import 'src/routes/app_config.dart';
import 'src/routes/main_route.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/10/20
///
@pragma("vm:entry-point", "call")
void main() {
  GlobalConfig.def.openUrlFn = (context, url) {
    context?.openSingleWebView(url);
    return Future.value(true);
  };
  $compliance.wait((context, agree) async {
    if (agree) {
      //合规后
      //debugger();
      //await futureDelay(10.seconds);

      /* //2024-9-27 gitcode服务异常
      await AppSettingBean.fetchAppConfig(
          "https://gitcode.net/angcyo/file/-/raw/master/Flutter3Abc/app_setting.json");
      AppVersionBean.fetchConfig(
          "https://gitcode.net/angcyo/file/-/raw/master/Flutter3Abc/app_version.json");*/

      await AppSettingBean.fetchAppConfig(
          "https://gitlab.com/angcyo/file/-/raw/master/Flutter3Abc/app_setting.json");
      AppVersionBean.fetchConfig(
          "https://gitlab.com/angcyo/file/-/raw/master/Flutter3Abc/app_version.json");

      //init

      // 监听平台文件分享流
      $receiveIntent.fileStream.listen((files) {
        if (!isNil(files)) {
          //监听到有需要处理的打开文件
          if (files!.length == 1 &&
              (files.first.path.endsWith("lpbin") ||
                  files.first.path.endsWith("bin"))) {
            //打开固件文件
            GlobalConfig.def.getNavigatorState(context)?.pushWidget(
                FirmwareUpgradePage(firmwareUrl: files.first.path));
          } else {
            GlobalConfig.def
                .getNavigatorState(context)
                ?.pushWidget(CanvasPreviewPage(files));
          }
          //处理完之后, 清空
          $receiveIntent.fileStream.add(null);
        }
      });

      // 监听打开工程
      lpCanvasDesignOpenPageFn = (context, projectBean) async {
        if (projectBean != null) {
          if (projectBean.projectPath?.isFileSync() == true) {
            context.pushWidget(CanvasAbc2(
              openProjectBean: projectBean,
            ));
          }
        }
      };
    }
  });
  runGlobalApp(const Flutter3App(), beforeAction: () {
    //合并国际化资源
    mergeIntl();
    //初始化模块
    initLpModule();
    //--
    UriTransform.addUrlTransformAction((url) {
      //https://gitcode.net/angcyo/file/-/raw/master/Flutter3Abc/app_setting.json
      //l.d("请求资源:$url");
      return url;
    });
    UriTransform.addKeyTransformAction((key) {
      //packages/lp_canvas/assets/svg/canvas_undo.svg
      //l.v("加载资源:$key");
      return key;
    });
  });
}

class Flutter3App extends StatelessWidget {
  const Flutter3App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //l.d(Theme.of(context));
    final Brightness platformBrightness =
        MediaQuery.platformBrightnessOf(context);

    final appColor =
        platformBrightness == Brightness.light ? AppColor() : AppColorDark();
    //种子颜色
    dynamic colorPrimary = appColor.primaryColor;
    dynamic colorPrimaryDark = appColor.primaryColorDark;
    var colorScheme = ColorScheme.fromSeed(
      seedColor: colorPrimary,
      primary: colorPrimary,
      secondary: colorPrimaryDark,
      brightness: platformBrightness,
      surface: appColor.themeWhiteColor, //所有主题样式的背景色
      //surface: Colors.yellow,
    );
    var themeData = ThemeData(
      // This is the theme of your application.
      //
      // TRY THIS: Try running your application with "flutter run". You'll see
      // the application has a blue toolbar. Then, without quitting the app,
      // try changing the seedColor in the colorScheme below to Colors.green
      // and then invoke "hot reload" (save your changes or press the "hot
      // reload" button in a Flutter-supported IDE, or press "r" if you used
      // the command line to start the app).
      //
      // Notice that the counter didn't reset back to zero; the application
      // state is not lost during the reload. To reset the state, use hot
      // restart instead.
      //
      // This works for code too, not just values: Most code changes can be
      // tested with just a hot reload.
      colorScheme: colorScheme,
      useMaterial3: true,
      //platform: TargetPlatform.android,//强行指定平台
      brightness: platformBrightness,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.inversePrimary,
        foregroundColor: Colors.white,
        elevation: kDefaultElevation,
        shadowColor: appColor.shadowColor,
        centerTitle: true,
        //toolbarHeight: kToolbarHeight,
      ),
      //scaffoldBackgroundColor: Colors.indigoAccent,//脚手架的背景颜色
    );
    GlobalConfig.def.globalThemeData = themeData;
    GlobalConfig.def.globalTheme = appColor;
    //平板适配
    GlobalConfig.def.enableTabletAdaptive = true;
    GlobalConfig.def.isAdaptiveTablet = isTabletDevice;
    const locale = Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN');
    return MaterialApp(
      title: 'Flutter3AbcApp',
      onGenerateTitle: (context) {
        // 初始化1;
        // [Title] 优先使用此方法
        final local = Localizations.localeOf(context);
        return 'Flutter3AbcApp'; //S.of(context).appTitle;
      },
      debugShowMaterialGrid: false,
      //ThemeMode.system, //ThemeMode.light, //ThemeMode.dark,
      themeMode: ThemeMode.system,
      theme: themeData,
      //darkTheme: themeData,
      //highContrastTheme: ,
      //highContrastDarkTheme: ,
      localizationsDelegates: const [
        S.delegate,
        LPRes.delegate, // 必须
        LibRes.delegate, // 必须
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      //http://www.lingoes.net/en/translator/langcode.htm
      supportedLocales: [
        ...LPRes.delegate.supportedLocales,
        ...S.delegate.supportedLocales,
        /*...LibRes.delegate.supportedLocales,*/ //可以不需要
        const Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      ],
      // [WidgetsBinding.instance.platformDispatcher.locales]
      localeListResolutionCallback: (locales, supportedLocales) {
        assert(() {
          //debugger();
          l.i(locales);
          return true;
        }());
        return;
      },
      //locale
      /*locale: "en".toLocale(),*/
      navigatorObservers: [
        lifecycleNavigatorObserver,
        navigatorObserverDispatcher,
        NavigatorObserverLog(),
      ],
      onGenerateRoute: (settings) {
        debugger();
        return MaterialPageRoute(builder: (context) {
          return const Text("!404!");
        });
      },
      home: builder((context) {
        // 初始化3;
        initGlobalAppAtContext(context);
        $compliance.checkIfNeed(context, () async {
          //合规检查
          //debugger();
          if ($coreKeys.complianceAgree.isNotEmpty) {
            return Future.value(true);
          }
          $coreKeys.complianceAgree = "true";
          return Future.value(true);
        });
        return const MainAbc();
      }),
      builder: (context, child) {
        // 初始化2;
        l.d('TransitionBuilder:$child');
        return child ?? const Text("null");
      },
    ).systemUiOverlay(
      statusBarColor: appColor.systemStatusBarColor,
      systemNavigationBarColor: appColor.systemNavigationBarColor,
    );
  }
}
