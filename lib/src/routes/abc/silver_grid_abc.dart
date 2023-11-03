import 'package:flutter/material.dart';
import 'package:flutter3_basics/flutter3_basics.dart';

import 'base_abc.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/02
///

class SilverGridAbc extends StatefulWidget {
  const SilverGridAbc({super.key});

  @override
  State<SilverGridAbc> createState() => _SilverGridAbcState();
}

class _SilverGridAbcState extends State<SilverGridAbc> with BaseAbcStateMixin {
  @override
  buildBody(BuildContext context) {
    /*return GridView.count(
      crossAxisCount: 2,
      children: [
        Container(color: Colors.red),
        Container(color: Colors.green),
        Container(color: Colors.blue),
        Container(color: Colors.yellow),
      ],
    );*/
    return CustomScrollView(
      scrollBehavior: const MaterialScrollBehavior(),
      physics:
          const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      slivers: [
        SliverGrid.count(
          crossAxisCount: 2 /*nextInt(10, min: 1)*/,
          children: [
            for (var i = 0; i < 3 /*nextInt(100)*/; i++)
              Container(
                color: randomColor(),
                alignment: Alignment.center,
                child: Text(
                  '$i',
                  style: const TextStyle(fontSize: 40),
                ),
              ),
          ],
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            color: Colors.grey,
            alignment: Alignment.center,
            child: Text(
              'SliverFillRemaining',
              style: const TextStyle(fontSize: 40),
            ),
          ),
        ),
      ],
    );
  }
}
