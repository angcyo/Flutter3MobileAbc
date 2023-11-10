import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_web/flutter3_web.dart';

import 'src/routes/main_route.dart';

@pragma('vm:entry-point')
void main() {
  lTime.tick();
  GlobalConfig.def.openUrlFn = (context, url) {
    context?.openSingleWebView(url);
    return Future.value(true);
  };

  runZonedGuarded(() {
    AppLifecycleLog.install();
    runApp(const GlobalApp(app: MyApp()));
    l.i("启动完成:${lTime.time()}");
  }, (error, stack) {
    l.e("未捕捉的异常:↓");
    l.e(error);
    l.e(stack.toString());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    l.d(Theme.of(context));
    final Brightness platformBrightness =
        MediaQuery.platformBrightnessOf(context);

    //种子颜色
    dynamic colorPrimary = "#2febff".toColor();
    dynamic colorPrimaryDark = "#0cabea".toColor();
    var colorScheme = ColorScheme.fromSeed(
      seedColor: colorPrimary,
      primary: colorPrimary,
      secondary: colorPrimaryDark,
      brightness: platformBrightness,
    );

    return MaterialApp(
      title: 'Flutter3AbcApp',
      debugShowMaterialGrid: false,
      theme: ThemeData(
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
        ),
      ),
      navigatorObservers: [
        NavigatorObserverLog(),
      ],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return const Text("no data!");
        });
      },
      home: const MainAbc(),
    );
  }
}
