import 'package:flutter/material.dart';
import 'package:flutter3_abc/src/routes/main_route.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_web/flutter3_web.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/06/27
///
class WebviewAbc extends StatefulWidget {
  const WebviewAbc({super.key});

  @override
  State<WebviewAbc> createState() => _WebviewAbcState();
}

class _WebviewAbcState extends State<WebviewAbc>
    with BaseAbcStateMixin, InAppWebViewStateMixin {
  late TextFieldConfig urlFieldConfig = TextFieldConfig(
    text: "lastUrlField".hiveGet("http://www.baidu.com"),
    hintText: "url",
    notifyDefaultTextChange: true,
    onChanged: (value) {
      //debugger();
      "lastUrlField".hivePut(value);
    },
  );

  @override
  String? get title => webviewTile ?? "...";

  @override
  bool get useScroll => false;

  @override
  bool get resizeToAvoidBottomInset => true;

  WebviewConfig config = WebviewConfig(
      /*url: "https://www.baidu.com",*/
      );

  @override
  WidgetList buildBodyList(BuildContext context) {
    //debugger();
    config.url = urlFieldConfig.text;
    return [
      SingleInputWidget(config: urlFieldConfig).paddingAll(kH),
      [
        GradientButton.normal(() {
          loadWebviewUrl(urlFieldConfig.text);
        }, child: "Go".text())
      ].flowLayout(
        selfConstraints:
            const LayoutBoxConstraints(widthType: ConstraintsType.matchParent),
        padding: const EdgeInsets.all(kH),
        childGap: kX,
      )!,
      buildInAppWebView(context, config)
          /*.repaintBoundary()
          .animatedOpacity(opacity: 0.1)*/
          .interceptPopResult(() async {
        if (await onBackPress() == true) {
          buildContext?.pop();
        }
      }).expanded(),
    ];
  }
}
