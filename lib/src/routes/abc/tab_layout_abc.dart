import 'package:flutter/material.dart';
import 'package:flutter3_abc/src/routes/main_route.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/05/11
///

class TabLayoutAbc extends StatefulWidget {
  const TabLayoutAbc({super.key});

  @override
  State<TabLayoutAbc> createState() => _TabLayoutAbcState();
}

class _TabLayoutAbcState extends State<TabLayoutAbc> with BaseAbcStateMixin {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  List<Widget> buildBodyList(BuildContext context) {
    return [
      TabLayout(
        controller: controller,
        children: [
          DecoratedBox(decoration: fillDecoration(color: randomColor()))
              .click(() {
            l.d('click 1');
            controller.jumpTo(100);
          }).wh(300, 40),
          DecoratedBox(decoration: fillDecoration(color: randomColor()))
              .click(() {
            l.d('click 2');
            controller.animateTo(
              100,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          }).wh(300, 40),
          DecoratedBox(decoration: fillDecoration(color: randomColor()))
              .click(() {
            l.d('click 3');
            controller.animateTo(
              600,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          }).wh(300, 40),
        ],
      ).container(
        padding: const EdgeInsets.all(16),
        color: Colors.purpleAccent,
      ),
    ];
  }
}
