import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_web/flutter3_web.dart';
import 'package:laser_pecker/l10n/generated/l10n.dart';

import 'l10n/generated/l10n.dart';
import 'src/routes/app_config.dart';
import 'src/routes/main_route.dart';

@pragma("vm:entry-point", "call")
void main() {
  lTime.tick();
  GlobalConfig.def.openUrlFn = (context, url) {
    context?.openSingleWebView(url);
    return Future.value(true);
  };

  runZonedGuarded(() async {
    ensureInitialized();
    "开始启动[main]".toLogSync();
    if (isDebug) {
      await testProcess();
    }
    await initFlutter3Core();
    if (isDebug) {
      await testApp();
      //await testFile();
    }
    AppLifecycleLog.install();
    var app = const GlobalApp(app: MyApp());
    runApp(app);
    l.i("启动完成:${lTime.time()}"..toLogSync());
  }, (error, stack) {
    l.e("未捕捉的异常:↓"..toErrorLogSync());
    l.e(error..toErrorLogSync());
    l.e(stack.toString()..toErrorLogSync());
  });
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
      //background: Colors.redAccent, //所有主题样式的背景色
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
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.inversePrimary,
        foregroundColor: Colors.white,
        elevation: 4,
        shadowColor: colorScheme.primary,
        centerTitle: true,
        //toolbarHeight: kToolbarHeight,
      ),
      //scaffoldBackgroundColor: Colors.indigoAccent,//脚手架的背景颜色
    );
    GlobalConfig.def.themeData = themeData;
    GlobalConfig.def.globalThemeConfig = appColor;
    return MaterialApp(
      title: 'Flutter3AbcApp',
      debugShowMaterialGrid: false,
      theme: themeData,
      //localeListResolutionCallback: ,
      localizationsDelegates: const [
        S.delegate,
        LPS.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale("zh"),
      navigatorObservers: [
        NavigatorObserverLog(),
      ],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return const Text("!404!");
        });
      },
      home: const MainAbc(),
    );
  }
}

class TestBean {
  String? name = "name";
  int? age = 99;
}

@testPoint
Future<void> testApp() async {
  await "key-int".hivePut(1);
  await "key-bool".hivePut(true);
  await "key-string".hivePut("~false~");
  await "key-list".hivePut([1, 2, 3]);
  await "key-map".hivePut({"a": 1, "b": 2, "c": "c"});
  //await "key-bean".hivePut(TestBean());
}

@testPoint
Future<void> testProcess() async {
  // List all files in the current directory in UNIX-like systems.
  var result = await Process.run('ls', ['-l']);
  l.i("Process[${result.pid}]:${result.exitCode}");
  l.i("Process Result->${result.stdout}");
}

@testPoint
Future<void> testFile() async {
  (await cacheFilePath("cache.log", "f1", "f2"))
      .writeString("${nowTimeString()}\nangcyo~", mode: FileMode.append);
  (await filePath("file.log", "f1", "f2"))
      .writeString("${nowTimeString()}\nangcyo~", mode: FileMode.append);
  delayCallback(() async => await saveScreenCapture());
}
