library;

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter3_abc/src/app/app_test.dart';
import 'package:flutter3_abc/src/routes/abc/bean/http_test_bean.dart';
import 'package:flutter3_abc/src/routes/abc/model/path_model.dart';
import 'package:flutter3_abc/src/utils/abc_config.dart';
import 'package:flutter3_abc/src/utils/abc_debug.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:lp_module/lp_module.dart';

import 'abc/animated_abc.dart';
import 'abc/app_update_abc.dart';
import 'abc/bluetooth_abc.dart';
import 'abc/canvas_abc.dart';
import 'abc/canvas_abc2.dart';
import 'abc/code_abc.dart';
import 'abc/cover_camera_abc.dart';
import 'abc/dismissible_abc.dart';
import 'abc/draggable_abc.dart';
import 'abc/excel_abc.dart';
import 'abc/expandable_abc.dart';
import 'abc/flow_layout_abc.dart';
import 'abc/font_abc.dart';
import 'abc/gesture_abc.dart';
import 'abc/image_abc.dart';
import 'abc/layout_abc.dart';
import 'abc/lifecycle_abc.dart';
import 'abc/loading_widget_abc.dart';
import 'abc/matrix_abc.dart';
import 'abc/matrix_gesture_abc.dart';
import 'abc/mdns_abc.dart';
import 'abc/menu_abc.dart';
import 'abc/nested_scroll_view_abc.dart';
import 'abc/nine_grid_abc.dart';
import 'abc/notification_abc.dart';
import 'abc/notification_listener_abc.dart';
import 'abc/nsd_abc.dart';
import 'abc/page_lifecycle_abc.dart';
import 'abc/page_view_abc.dart';
import 'abc/painter_abc.dart';
import 'abc/painter_abc2.dart';
import 'abc/path_abc.dart';
import 'abc/plugin_abc.dart';
import 'abc/popup_abc.dart';
import 'abc/r_item_tile_abc.dart';
import 'abc/reorderable_list_abc.dart';
import 'abc/scroll_behavior_abc.dart';
import 'abc/scroll_listener_abc.dart';
import 'abc/server_abc.dart';
import 'abc/shelf_abc.dart';
import 'abc/simulation_abc.dart';
import 'abc/slide_abc.dart';
import 'abc/sliver_scroll_coordinate_abc.dart';
import 'abc/stick_app_bar_abc.dart';
import 'abc/tab_layout_abc.dart';
import 'abc/url_launcher_abc.dart';
import 'abc/verify_code_abc.dart';
import 'abc/web_socket_abc.dart';
import 'abc/webview_abc.dart';
import 'abc/wheel_abc.dart';
import 'humming_bird/humming_bird_abc.dart';

part 'abc/app_bar_abc.dart';
part 'abc/base_abc.dart';
part 'abc/basics_abc.dart';
part 'abc/box_shadow_abc.dart';
part 'abc/button_abc.dart';
part 'abc/custom_scroll_abc.dart';
part 'abc/dialog_abc.dart';
part 'abc/html_css_abc.dart';
part 'abc/http_abc.dart';
part 'abc/markdown_abc.dart';
part 'abc/material_widget_abc.dart';
part 'abc/navigation_bar_abc.dart';
part 'abc/overlay_abc.dart';
part 'abc/page_abc.dart';
part 'abc/path_provider_abc.dart';
part 'abc/r_load_more_abc.dart';
part 'abc/r_scroll_view_abc.dart';
part 'abc/segmented_abc.dart';
part 'abc/silver_grid_abc.dart';
part 'abc/silver_list_abc.dart';
part 'abc/sliver_abc.dart';
part 'abc/sliver_tools_abc.dart';
part 'abc/stick_header_abc.dart';
part 'abc/svg_abc.dart';
part 'abc/tab_bar_abc.dart';
part 'abc/text_field_abc.dart';
part 'abc/widget_abc.dart';

///
/// 主页, 包含所有Abc学习样例入口
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/10/21
///
/// 标识需要执行的abc
const kGo = '√';

/// 是否执行第一个/否则执行最后一个
const goFirst = false;

/// abc页面路由
final flutter3AbcRoutes = <String, WidgetBuilder>{
  'BasicsAbc': (context) => const BasicsAbc(),
  'SilverListAbc': (context) => const SilverListAbc(),
  'SilverGridAbc': (context) => const SilverGridAbc(),
  'SliverAbc': (context) => const SliverAbc(),
  'CustomScrollAbc': (context) => const CustomScrollAbc(),
  'RScrollViewAbc': (context) => const RScrollViewAbc(),
  'RItemTileAbc': (context) => const RItemTileAbc(),
  'RLoadMoreAbc': (context) => const RLoadMoreAbc(),
  'NotificationListenerAbc': (context) => const NotificationListenerAbc(),
  'WidgetAbc': (context) => const WidgetAbc(),
  'LayoutAbc': (context) => const LayoutAbc(),
  'PainterAbc': (context) => const PainterAbc(),
  'PainterAbc2': (context) => const PainterAbc2(),
  'LoadingWidgetAbc': (context) => const LoadingWidgetAbc(),
  'AnimatedAbc': (context) => const AnimatedAbc(),
  'SegmentedAbc': (context) => const SegmentedAbc(),
  'MenuAbc': (context) => const MenuAbc(),
  'ButtonAbc': (context) => const ButtonAbc(),
  'MaterialWidgetAbc': (context) => const MaterialWidgetAbc(),
  'LifecycleAbc': (context) => const LifecycleAbc(),
  'PageLifecycleAbc': (context) => const PageLifecycleAbc(),
  'BoxShadowAbc ': (context) => const BoxShadowAbc(),
  'PageAbc': (context) => const PageAbc(),
  'HtmlCssAbc ': (context) => const HtmlCssAbc(),
  'MarkdownAbc ': (context) => const MarkdownAbc(),
  'OverlayAbc ': (context) => const OverlayAbc(),
  'AppBarAbc ': (context) => const AppBarAbc(),
  'NavigationBarAbc ': (context) => const NavigationBarAbc(),
  'TabBarAbc ': (context) => const TabBarAbc(),
  'DialogAbc': (context) => const DialogAbc(),
  'PopupAbc': (context) => const PopupAbc(),
  'TextFieldAbc': (context) => const TextFieldAbc(),
  'PathProviderAbc': (context) => const PathProviderAbc(),
  'HttpAbc ': (context) => const HttpAbc(),
  'ServerAbc ': (context) => const ServerAbc(),
  'SvgAbc': (context) => const SvgAbc(),
  'AppUpdateAbc': (context) => const AppUpdateAbc(),
  'SliverToolsAbc': (context) => const SliverToolsAbc(),
  'StickHeaderAbc ': (context) => const StickHeaderAbc(),
  'StickAppBarAbc ': (context) => const StickAppBarAbc(),
  'ExpandableAbc ': (context) => const ExpandableAbc(),
  'SlideAbc ': (context) => const SlideAbc(),
  'DismissibleAbc ': (context) => const DismissibleAbc(),
  'VerifyCodeAbc ': (context) => const VerifyCodeAbc(),
  'WheelAbc ': (context) => const WheelAbc(),
  'NineGridAbc ': (context) => const NineGridAbc(),
  'NotificationAbc ': (context) => const NotificationAbc(),
  'GestureAbc ': (context) => const GestureAbc(),
  'ImageAbc ': (context) => const ImageAbc(),
  'CanvasAbc': (context) => const CanvasAbc(),
  'CanvasAbc2 $kGo': (context) => const CanvasAbc2(),
  'LaserPeckerApp $kGo': (context) => LpSplashPage(),
  'LpCreationPage': (context) => const LpCreationPage(),
  'LpCreationPage2': (context) => const LpCreationPage2(),
  'MatrixAbc': (context) => const MatrixAbc(),
  'MatrixGestureAbc': (context) => const MatrixGestureAbc(),
  'ScrollBehaviorAbc': (context) => const ScrollBehaviorAbc(),
  'NestedScrollViewAbc': (context) => const NestedScrollViewAbc(),
  'SliverScrollCoordinateAbc': (context) => const SliverScrollCoordinateAbc(),
  'ScrollListenerAbc': (context) => const ScrollListenerAbc(),
  'BluetoothAbc': (context) => const BluetoothAbc(),
  'NsdAbc': (context) => const NsdAbc(),
  'mDnsAbc': (context) => const MdnsAbc(),
  'FlowLayoutAbc': (context) => const FlowLayoutAbc(),
  'PluginAbc': (context) => const PluginAbc(),
  'TabLayoutAbc': (context) => const TabLayoutAbc(),
  'PageViewAbc': (context) => const PageViewAbc(),
  'ReorderableListAbc': (context) => const ReorderableListAbc(),
  'DraggableAbc': (context) => const DraggableAbc(),
  'CodeAbc': (context) => const CodeAbc(),
  'FontAbc': (context) => const FontAbc(),
  'WebviewAbc': (context) => const WebviewAbc(),
  'ExcelAbc': (context) => const ExcelAbc(),
  'HummingBirdAbc': (context) => const HummingBirdAbc(),
  'UrlLauncherAbc': (context) => const UrlLauncherAbc(),
  'FirmwareUpgradePage': (context) => const FirmwareUpgradePage(),
  'ShelfAbc': (context) => const ShelfAbc(),
  'WebSocketAbc': (context) => const WebSocketAbc(),
  'CoverCameraUpgradeAbc': (context) => const CoverCameraAbc(),
  'SimulationAbc': (context) => const SimulationAbc(),
  'PathAbc $kGo': (context) => const PathAbc(),
};

class MainAbc extends StatefulWidget {
  const MainAbc({super.key});

  @override
  State<MainAbc> createState() => _MainAbcState();
}

class _MainAbcState extends State<MainAbc> with StateLogMixin<MainAbc> {
  /// abc列表
  List<String> get _abcKeyList => flutter3AbcRoutes.keys.toList();

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
        if (abc.contains(kGo)) {
          goKey = abc;
          if (goFirst) {
            break;
          }
        }
      }
    }
    //goKey ??= _abcKeyList.lastOrNull;
    if (goKey?.isNotEmpty == true) {
      _lastJumpKey = goKey;
      postDelayCallback(() {
        context.pushWidget(flutter3AbcRoutes[goKey!]!(context));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    const title = 'Flutter3Abc';
    final themeData = Theme.of(context);
    final mediaData = context.mediaQueryData;
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
              'w:${mediaData.size.width.toDigits()}/${(mediaData.size.width * mediaData.devicePixelRatio).toInt()}/${deviceWidthPixel.toInt()}')
          ..addText(
              ' h:${mediaData.size.height.toDigits()}/${(mediaData.size.height * mediaData.devicePixelRatio).toInt()}/${deviceHeightPixel.toInt()}') //高度没有包含导航栏
          ..addText(
              ' s:${mediaData.devicePixelRatio} sf:${mediaData.textScaleFactor}')
          ..newLine()
          ..addText(
              '$appFlavor ${$buildFlavor} M3:${themeData.useMaterial3} ${themeData.colorScheme.brightness}')
          ..newLine()
          ..addText(
              '主题:${themeData.platform} ${themeData.brightness} $currentLocale')
          ..newLine()
          ..addText('系统:$platformBrightness $platformLocale $platformLocales');
      },
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 9, color: Colors.grey),
    );

    //test
    AppTest.testOnMainBuild(this);

    return Scaffold(
      /*appBar: AppBar(
        title: GestureDetector(
          onDoubleTap: () {
            _jumpToTarget();
          },
          child: const Text(title),
        ),
        flexibleSpace: linearGradientWidget(
            listOf(themeData.primaryColor, themeData.primaryColorDark)),
      ),*/
      body: CustomScrollView(
        scrollBehavior: const MaterialScrollBehavior(),
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          SliverAppBar(
            title: GestureDetector(
              onDoubleTap: () {
                _jumpToTarget();
              },
              child: const Text(title),
            ),
            floating: true,
            flexibleSpace: linearGradientWidget(
                listOf(themeData.primaryColor, themeData.primaryColorDark)),
          ),
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
          //SliverList.list(children: children),
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
