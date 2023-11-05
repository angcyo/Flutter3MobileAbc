import 'package:flutter/widgets.dart';
import 'package:flutter3_basics/flutter3_basics.dart';
import 'package:flutter3_widgets/flutter3_widgets.dart';

import 'base_abc.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/03
///

class RScrollViewAbc extends BaseAbc {
  const RScrollViewAbc({super.key});

  @override
  buildBody(BuildContext context) {
    final gridCount = nextInt(20, min: 10);
    final littleGridCount = nextInt(5, min: 2);
    final listCount = nextInt(20, min: 10);
    final countStr = "gridCount:$gridCount listCount:$listCount";
    l.i(countStr);

    final itemTileList = itemTileBuilder((builder) {
      //SliverPersistentHeader 头部测试
      builder.add(RItemTile(
        pinned: false,
        floating: true,
        child: randomWidget("H1:gridCount:$gridCount listCount:$listCount"),
      ));

      //小量 SliverGrid 测试
      for (var i = 0; i < littleGridCount; i++) {
        builder.add(
          RItemTile(
              crossAxisCount: nextInt(4, min: 1),
              child: randomLogWidget("LG:$i")),
        );
      }

      //normal 基础测试
      builder.add(RItemTile(
        isSliverItem: true,
        child: SliverToBoxAdapter(
          child: randomLogWidget('SliverToBoxAdapter'),
        ),
      ));

      // SliverPersistentHeader 居中测试
      builder.add(RItemTile(
        pinned: true,
        floating: true,
        child: randomWidget("H2:gridCount:$gridCount listCount:$listCount"),
      ));

      /*builder.add(
        SliverPersistentHeader(
          delegate: SingleSliverPersistentHeaderDelegate(
            child: Container(
              alignment: Alignment.center,
              color: randomColor(),
              child: Text("gridCount:$gridCount listCount:$listCount"),
            ),
          ),
          pinned: true,
          floating: false,
        ),
      );
      builder.add(
        SliverPersistentHeader(
          delegate: SingleSliverPersistentHeaderDelegate(
            child: Container(
              alignment: Alignment.center,
              color: randomColor(),
              child: Text("gridCount:$gridCount listCount:$listCount"),
            ),
          ),
          pinned: true,
          floating: true,
        ),
      );*/

      //大量 SliverGrid 测试
      for (var i = 0; i < gridCount; i++) {
        builder.add(
          RItemTile(
              crossAxisCount: nextInt(4, min: 1),
              child: randomLogWidget("G:$i")),
        );
      }

      // SliverPersistentHeader 居中测试
      builder.add(RItemTile(
        pinned: true,
        child: randomWidget("H3:gridCount:$gridCount listCount:$listCount"),
      ));

      //大量 SliverList 测试
      for (var i = 0; i < listCount; i++) {
        builder.add(RItemTile(
          child: randomLogWidget("L:$i"),
        ));
      }

      // SliverFillRemaining 测试
      builder.add(RItemTile(
        fillRemaining: true,
        fillOverscroll: true,
        fillExpand: true,
        child: randomLogWidget('SliverFillRemaining'),
      ));
    });
    return RScrollView(
      itemTileList,
      enableFrameLoad: true,
      frameSplitCount: 1,
      frameSplitDuration: const Duration(milliseconds: 16),
    );
  }
}
