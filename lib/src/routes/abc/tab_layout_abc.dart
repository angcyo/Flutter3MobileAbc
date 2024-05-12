import 'dart:developer';

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

class _TabLayoutAbcState extends State<TabLayoutAbc>
    with BaseAbcStateMixin, TickerProviderStateMixin {
  int pageCount = 6;

  late TabLayoutController tabLayoutController = TabLayoutController(
    vsync: this,
    scrollController: scrollController,
    length: pageCount,
  );
  ScrollContainerController scrollController = ScrollContainerController();

  late TabLayoutController tabLayoutController2 = TabLayoutController(
    vsync: this,
    scrollController: ScrollContainerController(),
    length: pageCount,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  List<Widget> buildBodyList(BuildContext context) {
    return [
      TabLayout(
        tabLayoutController: tabLayoutController,
        gap: kX,
        padding: const EdgeInsets.all(kX),
        children: [
          ...buildItemList(context, tabLayoutController),
          DecoratedBox(decoration: fillDecoration(color: Colors.black12))
              .tabLayoutItemData(
            itemType: TabItemType.scrollDecoration,
            itemPaintType: TabItemPaintType.background,
            /*padding: const EdgeInsets.all(kH),*/
          ),
          DecoratedBox(decoration: fillDecoration(color: Colors.purpleAccent))
              .tabLayoutItemData(
            itemType: TabItemType.indicator,
            itemPaintType: TabItemPaintType.background,
            /*padding: const EdgeInsets.all(kH),*/
          )
        ],
      ).container(
        padding: const EdgeInsets.all(16),
        color: Colors.black26,
      ),
      TabLayout(
        tabLayoutController: tabLayoutController2,
        gap: kX,
        padding: const EdgeInsets.all(kX),
        children: [
          ...buildItemList(context, tabLayoutController2),
          DecoratedBox(decoration: fillDecoration(color: Colors.black12))
              .tabLayoutItemData(
            itemType: TabItemType.bgDecoration,
            itemPaintType: TabItemPaintType.background,
            /*padding: const EdgeInsets.all(kH),*/
          ),
          DecoratedBox(decoration: fillDecoration(color: Colors.purpleAccent))
              .tabLayoutItemData(
            itemType: TabItemType.indicator,
            itemPaintType: TabItemPaintType.background,
            /*padding: const EdgeInsets.all(kH),*/
          )
        ],
      ).container(
        padding: const EdgeInsets.all(16),
        color: Colors.black26,
      ),
      TabLayoutPageViewWrap(
        controller: tabLayoutController,
        children: [
          for (var i = 0; i < pageCount; i++)
            "Page $i".text().center().container(color: randomColor()),
        ],
      ).container(
        padding: const EdgeInsets.all(16),
        height: 100,
        color: Colors.black12,
      ),
      TabBarView(
        controller: tabLayoutController,
        children: [
          for (var i = 0; i < pageCount; i++)
            "Page $i".text().center().container(color: randomColor()),
        ],
      ).container(
        padding: const EdgeInsets.all(16),
        height: 100,
        color: Colors.black12,
      ),
    ];
  }

  WidgetList buildItemList(
    BuildContext content,
    TabLayoutController controller,
  ) {
    return [
      "R".text().click(() {
        //debugger();
        controller.selectedItem(0);
      }),
      "angcyo".text().click(() {
        controller.selectedItem(1);
      }),
      const Icon(Icons.dark_mode).click(() {
        controller.selectedItem(2);
      }),
      "中文示例".text().click(() {
        controller.selectedItem(3);
      }),
      [
        "中文示例".text(),
        const Icon(Icons.abc_outlined),
      ].column()!.click(() {
        controller.selectedItem(4);
      }),
      [
        const Icon(Icons.abc_outlined),
        "中文示例中文示例".text(),
      ].row()!.click(() {
        //debugger();
        controller.selectedItem(5);
      }),
    ];
  }
}
