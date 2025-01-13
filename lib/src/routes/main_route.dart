library;

import 'package:flutter/material.dart';
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
  ("/LaserPeckerApp", 'LaserPeckerApp $kGo', (context) => LpSplashPage()),
  ("/HummingBird", 'HummingBirdAbc', (context) => const HummingBirdAbc()),
];

class MainAbc extends StatefulWidget {
  const MainAbc({super.key});

  @override
  State<MainAbc> createState() => _MainAbcState();
}

class _MainAbcState extends State<MainAbc> with StateLogMixin<MainAbc> {
  /// abc列表
  List<String> get _abcKeyList =>
      flutter3MobileAbcRoutes.map((e) => e.$2!).toList();

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
        final config = flutter3MobileAbcRoutes.findFirst((e) => e.$2 == goKey);
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
    final themeData = Theme.of(context);

    final abcKeyList = _abcKeyList;

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
              child: AppTest.buildBottomWidget(context),
            ),
          ),
        ],
      ),
    );
  }
}
