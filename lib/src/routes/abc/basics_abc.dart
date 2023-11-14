part of flutter_abc;

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

    const textStyle = TextStyle(color: Colors.red);
    dynamic textWidget = textSpanBuilder((builder) {
      builder
            ..addText("device:", style: textStyle)
            ..addText("${flutterView.platformDispatcher.textScaleFactor}")
            ..addText("\n")
            ..addText("display:", style: textStyle)
            ..addText("${flutterView.display}")
            ..addText("\n")
            ..addText("displayFeatures:", style: textStyle)
            ..addText("${flutterView.displayFeatures}")
            ..addText("\n")
            ..addText("locales:", style: textStyle)
            ..addText("${flutterView.platformDispatcher.locales}")
            ..addText("\n")
            ..addText("locale:", style: textStyle)
            ..addText("$locale")
            ..addText(" language:${locale.languageCode}")
            ..addText(" country:${locale.countryCode}")
            ..addText(" script:${locale.scriptCode}")
            ..addText("\n")
            ..addText("gestureSettings:", style: textStyle)
            ..addText("${flutterView.gestureSettings}")
            ..addText("\n")
            ..addText("themeData:", style: textStyle)
            ..addText("${themeData.platform}")
            ..addText("\n" * 2)
            ..addText("mediaQueryData:", style: textStyle)
            ..addText("$mediaQueryData")
            ..addText("\n" * 2)
            ..addText("viewInsets:", style: textStyle)
            ..addText("${mediaQueryData.viewInsets}")
            ..addText("\n")
            ..addText("viewPadding1:", style: textStyle)
            ..addText("${mediaQueryData.viewPadding}")
            ..addText("\n")
            ..addText("viewPadding2:", style: textStyle)
            ..addText("$viewPadding")
            ..addText("\n")
            ..addText("padding1:", style: textStyle)
            ..addText("${mediaQueryData.padding}")
            ..addText("\n")
            ..addText("padding2:", style: textStyle)
            ..addText("$padding")
            ..addText("\n" * 2)
            ..addText("renderView:", style: textStyle)
            ..addText("$renderView ${renderView.automaticSystemUiAdjustment}")
            ..addText("\n")
            ..addText("size:${renderView.size}")
            ..addText(" configuration:${renderView.configuration}")
            ..addText("\n")
            ..addWidget(GestureDetector(
              onTap: () {
                toastInfo("click it");
              },
              child: const Text(
                "click me",
                style: TextStyle(color: Colors.blue),
              ),
            ))
          /*..addText("...test..." * 1000)*/
          ;
    });
    return Container(padding: const EdgeInsets.all(10), child: textWidget);
  }
}
