import 'package:flutter/material.dart';
import 'package:flutter3_abc/src/routes/abc/basics_abc.dart';
import 'package:flutter3_basics/flutter3_basics.dart';
import 'package:flutter3_widgets/flutter3_widgets.dart';

///
/// 主页, 包含所有Abc学习样例入口
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/10/21
///

class MainAbc extends StatefulWidget {
  const MainAbc({Key? key}) : super(key: key);

  @override
  State<MainAbc> createState() => _MainAbcState();
}

class _MainAbcState extends State<MainAbc> {
  @override
  Widget build(BuildContext context) {
    const title = 'Flutter3 Abc';
    var themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
        flexibleSpace: linearGradientWidget(
            listOf(themeData.primaryColor, themeData.primaryColorDark)),
      ),
      body: CustomScrollView(
        scrollBehavior: const MaterialScrollBehavior(),
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
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
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                const size = 24.0;
                return ListTile(
                    leading: SizedBox(
                        width: size,
                        height: size,
                        child: loadAssetImageWidget("assets/png/flutter.png")),
                    title:
                        ChildBackgroundWidget(child: Text('${index + 1}.Item')),
                    onTap: () {
                      l.d("...$index");
                      //Navigator.pushNamed(context, '/abc/$index');
                      //Navigator.push(context, '/abc/$index');
                      context.pushWidget(const BasicsAbc());
                    });
              },
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}
