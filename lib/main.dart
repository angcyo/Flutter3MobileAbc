import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_web/flutter3_web.dart';
import 'package:laser_pecker/l10n/generated/l10n.dart';

import 'l10n/generated/l10n.dart';
import 'src/routes/app_config.dart';
import 'src/routes/main_route.dart';

@pragma("vm:entry-point", "call")
void main() {
  GlobalConfig.def.openUrlFn = (context, url) {
    context?.openSingleWebView(url);
    return Future.value(true);
  };
  runGlobalApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //l.d(Theme.of(context));
    final Brightness platformBrightness =
        MediaQuery.platformBrightnessOf(context);

    final appColor = AppColor();
    //种子颜色
    dynamic colorPrimary = appColor.primaryColor;
    dynamic colorPrimaryDark = appColor.primaryColorDark;
    var colorScheme = ColorScheme.fromSeed(
      seedColor: colorPrimary,
      primary: colorPrimary,
      secondary: colorPrimaryDark,
      brightness: platformBrightness,
      background: appColor.themeWhiteColor, //所有主题样式的背景色
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
    GlobalConfig.def.themeData = themeData;
    GlobalConfig.def.globalTheme = appColor;
    const locale = Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN');
    return MaterialApp(
      title: 'Flutter3AbcApp',
      onGenerateTitle: (context) {
        // [Title] 优先使用此方法
        return 'Flutter3AbcApp'; //S.of(context).appTitle;
      },
      debugShowMaterialGrid: false,
      //themeMode: ,
      theme: themeData,
      //darkTheme: ,
      //highContrastTheme: ,
      //highContrastDarkTheme: ,
      //localeListResolutionCallback: ,
      localizationsDelegates: const [
        S.delegate,
        LPS.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      //http://www.lingoes.net/en/translator/langcode.htm
      supportedLocales: [
        const Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
        ...S.delegate.supportedLocales,
        ...LPS.delegate.supportedLocales,
      ],
      //locale
      locale: null,
      navigatorObservers: [
        lifecycleNavigatorObserver,
        NavigatorObserverLog(),
      ],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return const Text("!404!");
        });
      },
      home: const MainAbc(),
      builder: (context, child) {
        //debugger();
        l.d('TransitionBuilder:$child');
        return child ?? const Text("null");
      },
    );
  }
}
