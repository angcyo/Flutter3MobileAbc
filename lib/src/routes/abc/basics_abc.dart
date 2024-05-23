part of '../main_route.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/10/23
///

/// 基础信息
class BasicsAbc extends StatefulWidget {
  const BasicsAbc({super.key});

  @override
  State<BasicsAbc> createState() => _BasicsAbcState();
}

class _BasicsAbcState extends State<BasicsAbc> with BaseAbcStateMixin {
  BaseDeviceInfo? _deviceInfo;

  @override
  void initState() {
    platformDeviceInfo.getValue((info, error) {
      _deviceInfo = info;
      updateState();
    });
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final EdgeInsets padding = MediaQuery.paddingOf(context);
    final viewPadding = MediaQuery.viewPaddingOf(context);
    final flutterView = View.of(context);
    //WidgetsBinding.instance.window.locale
    final locale = flutterView.platformDispatcher.locale;
    final renderView = RendererBinding.instance.renderView;
    //当前语言
    final globalCurrentLocale =
        Localizations.localeOf(GlobalConfig.def.globalAppContext ?? context);
    final currentLocale = Localizations.localeOf(context);

    const textStyle = TextStyle(color: Colors.red);
    dynamic textWidget = textSpanBuilder((builder) {
      builder
        ..addText("当前平台->", style: textStyle)
        ..addText("${themeData.platform}")
        ..addText(lineSeparator)
        ..addText("设备平台->", style: textStyle)
        ..addText(
            "$defaultTargetPlatform ${Platform.pathSeparator} ${Platform.numberOfProcessors} ${Platform.localeName} | ${Platform.operatingSystem} ")
        ..addText(lineSeparator)
        ..addText("设备平台版本->", style: textStyle)
        ..addText(
            '${Platform.operatingSystemVersion} | ${Platform.version} | ${Platform.localHostname}')
        ..addText(lineSeparator)
        ..addText(
            '${Platform.resolvedExecutable} | ${Platform.script} | ${Platform.executable} | ${Platform.resolvedExecutable}')
        ..addText(lineSeparator)
        ..addText(
            '${Platform.packageConfig} | ${Platform.executableArguments} | ${Platform.lineTerminator}')
        ..addText(lineSeparator)
        ..addText("deviceInfo->", style: textStyle)
        ..addText(_deviceInfo.toString())
        ..addText(lineSeparator)
        ..addText(lineSeparator)
        ..addText("设备/平台信息->", style: textStyle)
        ..addText("文本缩放比例:${flutterView.platformDispatcher.textScaleFactor}")
        ..addText(lineSeparator)
        ..addText("显示屏信息->", style: textStyle)
        ..addText("${flutterView.display}")
        ..addText(lineSeparator)
        ..addText("显示屏特性->", style: textStyle)
        ..addText("${flutterView.displayFeatures}")
        ..addText(lineSeparator)
        ..addText("设备区域列表->", style: textStyle)
        ..addText("${flutterView.platformDispatcher.locales}")
        ..addText(lineSeparator)
        ..addText("设备区域/语言->", style: textStyle)
        ..addText("$locale")
        ..addText(" language:${locale.languageCode}")
        ..addText(" country:${locale.countryCode}")
        ..addText(" script:${locale.scriptCode}")
        ..addText(lineSeparator)
        ..addText("当前区域/语言->", style: textStyle)
        ..addText("$currentLocale/$globalCurrentLocale |")
        ..addText(" language:${currentLocale.languageCode}")
        ..addText(" country:${currentLocale.countryCode}")
        ..addText(" script:${currentLocale.scriptCode}")
        ..addText(lineSeparator)
        ..addText("手势配置->", style: textStyle)
        ..addText("${flutterView.gestureSettings}")
        ..addText(lineSeparator * 2);

      renderViews.forEachIndexed((index, rv) {
        var fv = rv.flutterView;
        builder
          ..addText("renderView[${index + 1}]->", style: textStyle)
          ..addText(
              "$rv | ${rv.size} | ${rv.configuration} | ${rv.automaticSystemUiAdjustment}")
          ..addText(" | ${rv.paintBounds} | ${rv.semanticBounds}")
          ..addText(lineSeparator)
          ..addText("flutterView->", style: textStyle)
          ..addText(
              "$fv | ${fv.display.size / fv.devicePixelRatio} | ${fv.display}")
          ..addText(
              /*| physicalGeometry:${fv.physicalGeometry}*/
              ' | physicalSize:${fv.physicalSize} | systemGestureInsets:${fv.systemGestureInsets}')
          ..addText(
              ' | padding:${fv.padding} | viewInsets:${fv.viewInsets} | viewPadding:${fv.viewPadding}')
          ..addText(lineSeparator * 2);
      });

      builder
            ..addText("平台媒体查询信息->", style: textStyle)
            ..addText("$platformMediaQueryData")
            ..addText(lineSeparator)
            ..addText("上下文媒体查询信息->", style: textStyle)
            ..addText("$mediaQueryData")
            ..addText(lineSeparator * 2)
            ..addText("viewInsets:", style: textStyle)
            ..addText("${mediaQueryData.viewInsets}")
            ..addText(lineSeparator)
            ..addText("viewPadding1:", style: textStyle)
            ..addText("${mediaQueryData.viewPadding}")
            ..addText(lineSeparator)
            ..addText("viewPadding2:", style: textStyle)
            ..addText("$viewPadding")
            ..addText(lineSeparator)
            ..addText("padding1:", style: textStyle)
            ..addText("${mediaQueryData.padding}")
            ..addText(lineSeparator)
            ..addText("padding2:", style: textStyle)
            ..addText("$padding")
            ..addText(lineSeparator * 2)
            ..addWidget(GestureDetector(
              onTap: () {
                //debugger();
                final home = LPRes.of(context).home;
                final iKnown = LPRes.of(context).iKnown;
                final creation = "creation".intlMessage;
                final account = "account".intlMessage;
                toastInfo("click it\n"
                    "$intlSystemLocaleName|$intlCurrentLocaleName|$intlDefaultLocaleName"
                    "findLocale:${GlobalConfig.def.findLocale()}\n"
                    "$home\n$iKnown\n$creation\n$account");
              },
              child: const Text(
                "click me test",
                style: TextStyle(color: Colors.blue),
              ),
            ))
            ..addText("\nsize = ${platformMediaQueryData.size}\n1 dp = $dpr px")
            ..addText(
                "\n1 px= ${1 / (dpi * INCHES_PER_MM)} mm : ${1.toMmFromPx().formatMm()}")
            ..addText("\n1 dp= $dpr px : ${1.toPixel(IUnit.dp).formatPixel()}")
            ..addText(
                "\n1 pt= ${dpi * INCHES_PER_PT} px : ${1.toPixel(IUnit.pt).formatPixel()}")
            ..addText(
                "\n1 mm= ${dpi * INCHES_PER_MM} px : ${1.toPixel().formatPixel()} dp : ${1.toDpFromMm().formatDp()}")
            ..addText(
                "\n1 in= $dpi px : ${1.toPixel(IUnit.inch).formatPixel()}\n1 in= 25.4 mm = 72 pt")
            ..addText(lineSeparator * 2)
            ..addText("环境变量->", style: textStyle)
            ..addText("${Platform.environment}")
            ..addText(lineSeparator)
          /*..addText("...test..." * 1000)*/
          ;
    });
    return Container(padding: const EdgeInsets.all(10), child: textWidget);
  }
}
