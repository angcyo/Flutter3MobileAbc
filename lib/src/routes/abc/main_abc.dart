import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 4,
        shadowColor: Theme.of(context).colorScheme.primary,
        title: const Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: CustomScrollView(
        scrollBehavior: const MaterialScrollBehavior(),
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              color: Theme.of(context).colorScheme.secondary,
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
                      Navigator.pushNamed(context, '/abc/$index');
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
