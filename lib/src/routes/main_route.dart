library flutter_abc;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter3_abc/src/routes/abc/bean/http_test_bean.dart';
import 'package:flutter3_abc/src/routes/abc/model/path_model.dart';
import 'package:flutter3_abc/src/utils/abc_config.dart';
import 'package:flutter3_abc/src/utils/abc_debug.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:laser_pecker/laser_pecker.dart';

part 'abc/app_bar_abc.dart';

part 'abc/base_abc.dart';

part 'abc/basics_abc.dart';

part 'abc/box_shadow_abc.dart';

part 'abc/button_abc.dart';

part 'abc/custom_scroll_abc.dart';

part 'abc/dialog_abc.dart';

part 'abc/html_css_abc.dart';

part 'abc/http_abc.dart';

part 'abc/material_widget_abc.dart';

part 'abc/navigation_bar_abc.dart';

part 'abc/overlay_abc.dart';

part 'abc/page_abc.dart';

part 'abc/path_provider_abc.dart';

part 'abc/r_scroll_view_abc.dart';

part 'abc/segmented_abc.dart';

part 'abc/silver_grid_abc.dart';

part 'abc/silver_list_abc.dart';

part 'abc/sliver_tools_abc.dart';

part 'abc/svg_abc.dart';

part 'abc/tab_bar_abc.dart';

part 'abc/text_field_abc.dart';

part 'abc/widget_abc.dart';

///
/// 主页, 包含所有Abc学习样例入口
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/10/21
///

const _kGo = '√';
const _goFirst = false;

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
  'AppBarAbc $_kGo': (context) => const AppBarAbc(),
  'NavigationBarAbc $_kGo': (context) => const NavigationBarAbc(),
  'TabBarAbc $_kGo': (context) => const TabBarAbc(),
  'DialogAbc': (context) => const DialogAbc(),
  'TextFieldAbc': (context) => const TextFieldAbc(),
  'PathProviderAbc $_kGo': (context) => const PathProviderAbc(),
  'HttpAbc $_kGo': (context) => const HttpAbc(),
  'SvgAbc': (context) => const SvgAbc(),
  'LaserPeckerApp $_kGo': (context) => LaserPeckerApp(),
  'SliverToolsAbc $_kGo': (context) => SliverToolsAbc(),
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

    //当前语言
    final currentLocale = Localizations.localeOf(context);

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
          ..addText('${themeData.colorScheme.brightness} $currentLocale')
          ..newLine()
          ..addText('${themeData.platform} $platformBrightness $platformLocale')
          ..newLine()
          ..addText('$platformLocales');
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
