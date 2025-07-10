library;

import 'package:flutter/material.dart';
import 'package:flutter3_abc/abc_test.dart';
import 'package:flutter3_abc/flutter3_abc.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:lp_module/lp_module.dart';

import 'abc/lifecycle_abc.dart';
import 'humming_bird/humming_bird_abc.dart';

///
/// 主页, 包含所有Abc学习样例入口
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/10/21
///

/// 是否执行第一个/否则执行最后一个
const goFirst = false;

/// abc页面路由
final flutter3MobileAbcRoutes = <AbcRouteConfig>[
  ...flutter3AbcRoutes,
  ("/lifecycle", 'LifecycleAbc', (context) => const LifecycleAbc()),
  ("/LaserPeckerApp", 'LaserPeckerApp', (context) => LpSplashPage()),
  ("/HummingBird", 'HummingBirdAbc', (context) => const HummingBirdAbc()),
];

class MainAbc extends StatefulWidget {
  const MainAbc({super.key});

  @override
  State<MainAbc> createState() => _MainAbcState();
}

class _MainAbcState extends State<MainAbc> with StateLogMixin<MainAbc> {
  /// abc 标题 列表
  List<String> get _abcTitleList => abcRouteList.map((e) => e.$2!).toList();

  /// abc列表
  List<String> get _abcKeyList => abcRouteList.map((e) => e.$1).toList();

  List<AbcRouteConfig> get abcRouteList => flutter3MobileAbcRoutes;

  List<AbcRouteConfig> get routeList =>
      abcRouteList.filter((e) => !isNil(e.$2));

  late final searchRouteConfig = TextFieldConfig(
    labelText: "跳转路由",
    hintText: "搜索过滤",
    autoOptionsMaxHeight: isDesktopOrWeb ? screenHeight / 2 : screenHeight / 3,
    autoDisplayStringForOption: (option) =>
        (option as AbcRouteConfig?)?.$2 ?? "",
    autoOptionsBuilder: (
      TextFieldConfig config,
      TextEditingValue textEditingValue,
    ) {
      final text = textEditingValue.text;
      if (isNil(text)) {
        return routeList;
      }
      //过滤路由
      final result = routeList
          .filter(
              (e) => e.$2?.toLowerCase().contains(text.toLowerCase()) == true)
          .toList();
      return result;
    },
    onAutoOptionSelected: (value) {
      if (value is AbcRouteConfig) {
        //debugger();
        _jumpToTarget(value.$1);
      }
    },
  );

  _MainAbcState() {
    logTag = 'MainAbc';
  }

  @override
  void initState() {
    super.initState();
    _jumpToTarget();
  }

  /// 跳转到目标页面
  void _jumpToTarget([String? routePath]) {
    String? goKey = routePath;
    if (goKey != null) {
      //指定跳转
    } else if (lastJumpRoutePath != null) {
      goKey = lastJumpRoutePath;
    } else {
      for (AbcRouteConfig abc in abcRouteList) {
        if (abc.$2?.contains(kGo) == true) {
          goKey = abc.$1;
          if (goFirst) {
            break;
          }
        }
      }
    }
    //goKey ??= _abcKeyList.lastOrNull;
    //debugger();
    if (goKey?.isNotEmpty == true) {
      lastJumpRoutePath = goKey;
      postDelayCallback(() {
        final config = flutter3MobileAbcRoutes.findFirst((e) => e.$1 == goKey);
        if (config != null) {
          context.pushWidget(config.$3.call(context));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    const title = 'Flutter3MobileAbc';

    final globalTheme = GlobalTheme.of(context);
    final themeData = Theme.of(context);

    final abcKeyList = _abcKeyList;
    final abcTitleList = _abcTitleList;

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
            bottom: SingleInputWidget(
              config: searchRouteConfig,
              textStyle:
                  globalTheme.textBodyStyle.copyWith(color: Colors.white),
              labelStyle:
                  globalTheme.textDesStyle.copyWith(color: Colors.white),
              floatingLabelStyle:
                  globalTheme.textDesStyle.copyWith(color: Colors.white),
              hintStyle: globalTheme.textDesStyle.copyWith(color: Colors.white),
              borderColor: globalTheme.lineDarkColor,
            ).paddingOnly(horizontal: kX, vertical: kH).sizePreferred(),
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
            if (index > abcTitleList.length) {
              return null;
            } else if (index == abcTitleList.length) {
              //最后一个item
              return null;
            }
            final key = abcKeyList[index];
            final title = abcTitleList[index];
            l.d("build abc [$index]:$title");
            const size = 24.0;
            Widget? result = ListTile(
                leading: SizedBox(
                    width: size,
                    height: size,
                    child: loadAssetImageWidget("assets/png/flutter.png")),
                /*title: Text('${index + 1}.$key'),*/
                title: textSpanBuilder((builder) {
                  builder.addText("${index + 1}.$title");
                  //debugger();
                  if (key == lastJumpRoutePath) {
                    builder.addText(" last",
                        style: globalTheme.textDesStyle.copyWith(
                          color: globalTheme.successColor,
                        ));
                  }
                }, style: globalTheme.textTitleStyle),
                onTap: () {
                  //l.d("...$index");
                  //Navigator.pushNamed(context, '/abc/$index');
                  //Navigator.push(context, '/abc/$index');
                  _jumpToTarget(key);
                });
            if (index == abcTitleList.length - 1) {
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
              child: AppTest.buildBottomWidget(context).click(() {
                testAbc();
              }),
            ).safeBottomArea(),
          ),
        ],
      ),
    );
  }
}
