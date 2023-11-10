import 'package:flutter/material.dart';
import 'package:flutter3_abc/src/routes/abc/basics_abc.dart';
import 'package:flutter3_basics/flutter3_basics.dart';

import 'abc/box_shadow_abc.dart';
import 'abc/button_abc.dart';
import 'abc/custom_scroll_abc.dart';
import 'abc/html_css_abc.dart';
import 'abc/material_widget_abc.dart';
import 'abc/overlay_abc.dart';
import 'abc/page_abc.dart';
import 'abc/r_scroll_view_abc.dart';
import 'abc/segmented_abc.dart';
import 'abc/silver_grid_abc.dart';
import 'abc/silver_list_abc.dart';
import 'abc/widget_abc.dart';

///
/// 主页, 包含所有Abc学习样例入口
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/10/21
///

const _kGo = '√';
const _goFirst = true;

final _flutter3AbcMap = <String, WidgetBuilder>{
  'BasicsAbc': (context) => const BasicsAbc(),
  'SilverListAbc': (context) => const SilverListAbc(),
  'SilverGridAbc': (context) => const SilverGridAbc(),
  'CustomScrollAbc': (context) => const CustomScrollAbc(),
  'RScrollViewAbc': (context) => const RScrollViewAbc(),
  'WidgetAbc': (context) => const WidgetAbc(),
  'SegmentedAbc': (context) => const SegmentedAbc(),
  'ButtonAbc': (context) => const ButtonAbc(),
  'MaterialWidgetAbc': (context) => const MaterialWidgetAbc(),
  'BoxShadowAbc $_kGo': (context) => const BoxShadowAbc(),
  'PageAbc': (context) => const PageAbc(),
  'HtmlCssAbc $_kGo': (context) => const HtmlCssAbc(),
  'OverlayAbc $_kGo': (context) => const OverlayAbc(),
};

class MainAbc extends StatefulWidget {
  const MainAbc({Key? key}) : super(key: key);

  @override
  State<MainAbc> createState() => _MainAbcState();
}

class _MainAbcState extends State<MainAbc> with StateLogMixin<MainAbc> {
  /// abc列表
  List<String> get _abcKeyList => _flutter3AbcMap.keys.toList();

  _MainAbcState() {
    logTag = 'MainAbc';
  }

  @override
  void initState() {
    super.initState();
    _jumpToTarget();
  }

  /// 上一次跳转的key
  String? _lastJumpKey;

  /// 跳转到目标页面
  void _jumpToTarget([String? targetKey]) {
    String? goKey = targetKey;
    if (goKey != null) {
      //指定跳转
    } else if (_lastJumpKey != null) {
      goKey = _lastJumpKey;
    } else {
      for (String abc in _abcKeyList) {
        if (abc.contains(_kGo)) {
          goKey = abc;
          if (_goFirst) {
            break;
          }
        }
      }
    }
    //goKey ??= _abcKeyList.lastOrNull;
    if (goKey?.isNotEmpty == true) {
      _lastJumpKey = goKey;
      postDelayCallback(() {
        context.pushWidget(_flutter3AbcMap[goKey!]!(context));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    const title = 'Flutter3Abc';
    final themeData = Theme.of(context);
    final mediaData = MediaQuery.of(context);
    final Brightness platformBrightness =
        MediaQuery.platformBrightnessOf(context);

    final abcKeyList = _abcKeyList;

    /*Text(
      StringBuilder()
          .append(
          '种子颜色:${themeData.colorScheme.primary.toHexColor()} ${themeData.colorScheme.secondary.toHexColor()}')
          .newLine()
          .append(
          '主题颜色:${themeData.primaryColor.toHexColor()} ${themeData.primaryColorDark.toHexColor()}')
          .newLine()
          .append(
          '${themeData.platform} ${themeData.colorScheme.brightness} $platformBrightness')
          .toString(),
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 9, color: Colors.grey),
    ),*/

    final bottomTextWidget = textSpanBuilder(
      (builder) {
        builder
          ..addText("种子颜色:")
          ..addTextColor(themeData.colorScheme.primary.toHexColor(),
              themeData.colorScheme.primary)
          ..addText(" ")
          ..addTextColor(themeData.colorScheme.secondary.toHexColor(),
              themeData.colorScheme.secondary)
          ..newLine()
          ..addText("主题颜色:")
          ..addTextBackgroundColor(
              themeData.primaryColor.toHexColor(), themeData.primaryColor)
          ..addText(" ")
          ..addTextBackgroundColor(
              themeData.indicatorColor.toHexColor(), themeData.indicatorColor)
          ..addText(" ")
          ..addTextBackgroundColor(themeData.primaryColorDark.toHexColor(),
              themeData.primaryColorDark)
          ..newLine()
          ..addText(
              'w:${mediaData.size.width.toDigits()} h:${mediaData.size.height.toDigits()}')
          ..addText(
              ' s:${mediaData.devicePixelRatio} sf:${mediaData.textScaleFactor}')
          ..newLine()
          ..addText('M3:${themeData.useMaterial3} ')
          ..addText(
              '${themeData.platform} ${themeData.colorScheme.brightness} $platformBrightness');
      },
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 9, color: Colors.grey),
    );

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onDoubleTap: () {
            _jumpToTarget();
          },
          child: const Text(title),
        ),
        flexibleSpace: linearGradientWidget(
            listOf(themeData.primaryColor, themeData.primaryColorDark)),
      ),
      body: CustomScrollView(
        scrollBehavior: const MaterialScrollBehavior(),
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        slivers: [
          /*SliverToBoxAdapter(
            child: Container(
              height: 200,
              color: themeData.colorScheme.secondary,
              alignment: Alignment.center,
              child: const Text(
                'Abc',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),*/
          //SliverGrid(delegate: delegate, gridDelegate: gridDelegate),
          SliverList.builder(itemBuilder: (context, index) {
            if (index > abcKeyList.length) {
              return null;
            } else if (index == abcKeyList.length) {
              //最后一个item
              return null;
            }
            final key = abcKeyList[index];
            l.d("build abc [$index]:$key");
            const size = 24.0;
            Widget? result = ListTile(
                leading: SizedBox(
                    width: size,
                    height: size,
                    child: loadAssetImageWidget("assets/png/flutter.png")),
                title: Text('${index + 1}.$key'),
                onTap: () {
                  //l.d("...$index");
                  //Navigator.pushNamed(context, '/abc/$index');
                  //Navigator.push(context, '/abc/$index');
                  _jumpToTarget(key);
                });
            if (index == abcKeyList.length - 1) {
              //最后一个item
            } else {
              result = Column(
                children: [
                  result,
                  const Divider(
                    height: 0.5,
                    thickness: 0.5,
                  ),
                ],
              );
            }
            return result;
          }),
          //底部显示
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: false,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: bottomTextWidget,
            ),
          ),
        ],
      ),
    );
  }
}
