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
      builder.add(RItemTile(
        isSliverItem: true,
        child: SliverPersistentHeader(
          delegate: SingleSliverPersistentHeaderDelegate(
            child: Container(
              alignment: Alignment.center,
              color: randomColor(),
              child: Text("H1:gridCount:$gridCount listCount:$listCount"),
            ),
          ),
          pinned: false,
          floating: false,
        ),
      ));
      for (var i = 0; i < littleGridCount; i++) {
        builder.add(
          RItemTile(
              crossAxisCount: nextInt(4, min: 1),
              child: randomLogWidget("LG:$i")),
        );
      }
      builder.add(RItemTile(
        isSliverItem: true,
        child: SliverToBoxAdapter(
          child: randomLogWidget('SliverToBoxAdapter'),
        ),
      ));
      builder.add(RItemTile(
        isSliverItem: true,
        child: SliverPersistentHeader(
          delegate: SingleSliverPersistentHeaderDelegate(
            child: Container(
              alignment: Alignment.center,
              color: randomColor(),
              child: Text("H2:gridCount:$gridCount listCount:$listCount"),
            ),
          ),
          pinned: true,
          floating: false,
        ),
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
      for (var i = 0; i < gridCount; i++) {
        builder.add(
          RItemTile(
              crossAxisCount: nextInt(4, min: 1),
              child: randomLogWidget("G:$i")),
        );
      }
      builder.add(RItemTile(
        isSliverItem: false,
        child: SliverPersistentHeader(
          delegate: SingleSliverPersistentHeaderDelegate(
            child: Container(
              alignment: Alignment.center,
              color: randomColor(),
              child: Text("H3:gridCount:$gridCount listCount:$listCount"),
            ),
          ),
          pinned: true,
          floating: false,
        ),
      ));
      for (var i = 0; i < listCount; i++) {
        builder.add(RItemTile(
          child: randomLogWidget("L:$i"),
        ));
      }
      builder.add(RItemTile(
        isSliverItem: true,
        child: SliverFillRemaining(
          hasScrollBody: false /*影响高度*/,
          child: randomLogWidget('SliverFillRemaining'),
        ),
      ));
    });
    return RScrollView(itemTileList);
  }
}
