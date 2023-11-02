import 'package:flutter/material.dart';
import 'package:flutter3_basics/flutter3_basics.dart';

import 'base_abc.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/02
///

class CustomScrollAbc extends StatefulWidget {
  const CustomScrollAbc({super.key});

  @override
  State<CustomScrollAbc> createState() => _CustomScrollAbcState();
}

class _CustomScrollAbcState extends State<CustomScrollAbc>
    with BaseAbcStateMixin {
  @override
  buildBody(BuildContext context) {
    final gridCount = nextInt(1000, min: 100);
    final listCount = nextInt(1000, min: 100);
    l.i("gridCount:$gridCount listCount:$listCount");
    return CustomScrollView(
      scrollBehavior: const MaterialScrollBehavior(),
      physics:
          const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      slivers: [
        SliverPersistentHeader(
          delegate: _CustomScrollAbcHeader(
            child: Text("gridCount:$gridCount listCount:$listCount"),
          ),
          pinned: true,
        ),
        SliverGrid.count(
          crossAxisCount: nextInt(4, min: 1),
          children: [
            for (var i = 0; i < gridCount; i++)
              StateLogWidget(
                logTag: 'SliverGrid:$i',
                child: Container(
                  color: randomColor(),
                  alignment: Alignment.center,
                  child: Text(
                    '$i',
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
              )
          ],
        ),
        SliverList.list(
          children: [
            for (var i = 0; i < listCount; i++)
              StateLogWidget(
                logTag: 'SliverList:$i',
                child: Container(
                  color: randomColor(),
                  alignment: Alignment.center,
                  child: Text(
                    '$i',
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _CustomScrollAbcHeader extends SliverPersistentHeaderDelegate {
  _CustomScrollAbcHeader({required this.child});

  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      alignment: Alignment.center,
      color: randomColor(),
      child: child,
    );
  }

  @override
  double get maxExtent => minExtent * 2;

  @override
  double get minExtent => 20;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
