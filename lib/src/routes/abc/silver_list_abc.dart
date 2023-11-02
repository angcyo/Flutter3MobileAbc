import 'package:flutter/material.dart';
import 'package:flutter3_basics/flutter3_basics.dart';

import 'base_abc.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/02
///

class SilverListAbc extends StatefulWidget {
  const SilverListAbc({super.key});

  @override
  State<SilverListAbc> createState() => _SilverListAbcState();
}

class _SilverListAbcState extends State<SilverListAbc> with BaseAbcStateMixin {
  @override
  buildBody(BuildContext context) {
    return CustomScrollView(
      scrollBehavior: const MaterialScrollBehavior(),
      physics:
          const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      slivers: [
        SliverList.list(
          children: [
            for (var i = 0; i < nextInt(100, min: 10); i++)
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
      ],
    );
  }
}
