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
    final gridCount = nextInt(100, min: 10);
    final listCount = nextInt(100, min: 10);
    final countStr = "gridCount:$gridCount listCount:$listCount";
    l.i(countStr);

    const textStyle = TextStyle(fontSize: 40);
    final itemTileList = itemTileBuilder((builder) {
      builder.add(RItemTile(
        isSliverItem: true,
        child: SliverPersistentHeader(
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
        builder.add(RItemTile(
          crossAxisCount: nextInt(4, min: 1),
          child: StateLogWidget(
            logTag: 'Grid:$i',
            child: Container(
              color: randomColor(),
              alignment: Alignment.center,
              child: Text(
                'Grid$i',
                style: textStyle,
              ),
            ),
          ),
        ));
      }
      for (var i = 0; i < listCount; i++) {
        builder.add(RItemTile(
          child: StateLogWidget(
            logTag: 'List:$i',
            child: Container(
              color: randomColor(),
              alignment: Alignment.center,
              child: Text(
                'List:$i',
                style: textStyle,
              ),
            ),
          ),
        ));
      }
    });
    return RScrollView(itemTileList);
  }
}
