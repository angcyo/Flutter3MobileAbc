import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
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

  late List<TabLayoutController> tabLayoutControllerList = [
    for (var i = 0; i < pageCount; i++)
      TabLayoutController(
        vsync: this,
        scrollController: ScrollContainerController(),
        length: pageCount,
      ),
  ];

  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 1,
  );

  /// 指示器对齐方式
  Alignment _alignment = Alignment.center;
  final List<Alignment> _alignmentList = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ];

  /// 指示器绘制方式
  TabItemPaintType _itemPaintType = TabItemPaintType.background;
  final List<TabItemPaintType> _indicatorPaintTypeList = [
    TabItemPaintType.background,
    TabItemPaintType.foreground,
  ];

  bool enableIndicatorFlow = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  List<Widget> buildBodyList(BuildContext context) {
    return [
      DropdownButtonTile(
        label: "指示器对齐方式",
        icon: const Icon(Icons.water_drop),
        dropdownValue: _alignment,
        dropdownValueList: _alignmentList,
        onChanged: (value) {
          Feedback.forLongPress(context);
          _alignment = value;
          updateState();
        },
      ),
      DropdownMenuTile(
        label: "指示器绘制方式",
        dropdownValue: _itemPaintType,
        dropdownValueList: _indicatorPaintTypeList,
        onChanged: (value) {
          Feedback.forLongPress(context);
          _itemPaintType = value;
          updateState();
        },
      ),
      SwitchTile(
        label: "激活流式过度",
        value: enableIndicatorFlow,
        onChanged: (value) {
          Feedback.forLongPress(context);
          enableIndicatorFlow = value;
          updateState();
        },
      ),

      //顶部包裹宽度/固定高度指示器
      TabLayout(
        tabLayoutController: tabLayoutControllerList[0],
        gap: kX,
        padding: const EdgeInsets.all(kX),
        children: [
          ...buildItemList(context, tabLayoutControllerList[0]),
          DecoratedBox(decoration: fillDecoration(color: Colors.black12))
              .tabLayoutItemData(
            itemType: TabItemType.scrollDecoration,
            itemPaintType: TabItemPaintType.background,
            /*padding: const EdgeInsets.all(kH),*/
          ),
          DecoratedBox(decoration: fillDecoration(color: Colors.purpleAccent))
              .tabLayoutItemData(
            itemType: TabItemType.indicator,
            alignment: _alignment,
            itemPaintType: _itemPaintType,
            itemConstraints: const LayoutBoxConstraints(
              widthType: ConstraintsType.wrapContent,
              heightType: ConstraintsType.fixedSize,
              maxHeight: 4,
            ),
            enableIndicatorFlow: enableIndicatorFlow,
            /*padding: const EdgeInsets.all(kH),*/
          )
        ],
      ).container(
        padding: const EdgeInsets.all(16),
        color: Colors.black26,
      ),
      //顶部包裹宽度/固定高度指示器
      /*TabLayout(
        tabLayoutController: tabLayoutControllerList[1],
        gap: kX,
        padding: const EdgeInsets.all(kX),
        children: [
          ...buildItemList(context, tabLayoutControllerList[1]),
          DecoratedBox(decoration: fillDecoration(color: Colors.black12))
              .tabLayoutItemData(
            itemType: TabItemType.scrollDecoration,
            itemPaintType: TabItemPaintType.background,
          ),
          DecoratedBox(decoration: fillDecoration(color: Colors.purpleAccent))
              .tabLayoutItemData(
            itemType: TabItemType.indicator,
            alignment: Alignment.topCenter,
            alignmentParent: false,
            itemPaintType: TabItemPaintType.background,
            itemConstraints: const LayoutBoxConstraints(
              widthType: ConstraintsType.wrapContent,
              heightType: ConstraintsType.fixedSize,
              maxHeight: 4,
            ),
            enableIndicatorFlow: true,
          )
        ],
      ).container(
        padding: const EdgeInsets.all(16),
        color: Colors.black26,
      ),
      //居中包裹宽度/固定高度指示器
      TabLayout(
        tabLayoutController: tabLayoutControllerList[2],
        gap: kX,
        padding: const EdgeInsets.all(kX),
        children: [
          ...buildItemList(context, tabLayoutControllerList[2]),
          DecoratedBox(decoration: fillDecoration(color: Colors.black12))
              .tabLayoutItemData(
            itemType: TabItemType.bgDecoration,
            itemPaintType: TabItemPaintType.background,
          ),
          DecoratedBox(decoration: fillDecoration(color: Colors.purpleAccent))
              .tabLayoutItemData(
            itemType: TabItemType.indicator,
            alignment: Alignment.center,
            alignmentParent: false,
            itemPaintType: TabItemPaintType.background,
            itemConstraints: const LayoutBoxConstraints(
              widthType: ConstraintsType.fixedSize,
              maxWidth: 8,
              heightType: ConstraintsType.fixedSize,
              maxHeight: 4,
            ),
            enableIndicatorFlow: true,
          )
        ],
      ).container(
        padding: const EdgeInsets.all(16),
        color: Colors.black26,
      ),
      //底部包裹宽度/固定高度指示器
      TabLayout(
        tabLayoutController: tabLayoutControllerList[3],
        gap: kX,
        padding: const EdgeInsets.all(kX),
        children: [
          ...buildItemList(context, tabLayoutControllerList[3]),
          DecoratedBox(decoration: fillDecoration(color: Colors.black12))
              .tabLayoutItemData(
            itemType: TabItemType.bgDecoration,
            itemPaintType: TabItemPaintType.background,
          ),
          DecoratedBox(decoration: fillDecoration(color: Colors.purpleAccent))
              .tabLayoutItemData(
            itemType: TabItemType.indicator,
            alignment: Alignment.bottomLeft,
            alignmentParent: false,
            itemPaintType: TabItemPaintType.background,
            itemConstraints: const LayoutBoxConstraints(
              widthType: ConstraintsType.fixedSize,
              maxWidth: 8,
              heightType: ConstraintsType.fixedSize,
              maxHeight: 4,
            ),
            enableIndicatorFlow: true,
          )
        ],
      ).container(
        padding: const EdgeInsets.all(16),
        color: Colors.black26,
      ),*/
      /*TabLayout(
        tabLayoutController: tabLayoutController2,
        gap: kX,
        padding: const EdgeInsets.all(kX),
        children: [
          ...buildItemList(context, tabLayoutController2),
          DecoratedBox(decoration: fillDecoration(color: Colors.black12))
              .tabLayoutItemData(
            itemType: TabItemType.bgDecoration,
            itemPaintType: TabItemPaintType.background,
            */ /*padding: const EdgeInsets.all(kH),*/ /*
          ),
          DecoratedBox(decoration: fillDecoration(color: Colors.purpleAccent))
              .tabLayoutItemData(
            itemType: TabItemType.indicator,
            itemPaintType: TabItemPaintType.background,
            itemConstraints: const LayoutBoxConstraints(
              widthType: ConstraintsType.wrapContent,
              heightType: ConstraintsType.fixedSize,
              maxHeight: 10,
            ),
            */ /*padding: const EdgeInsets.all(kH),*/ /*
          )
        ],
      ).container(
        padding: const EdgeInsets.all(16),
        color: Colors.black26,
      ),*/
      buildPageView(context),
      /*TabLayoutPageViewWrap(
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
      ),*/
    ];
  }

  Widget buildPageView(BuildContext content) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        //l.d(_pageController.page);

        for (var i = 0; i < tabLayoutControllerList.length; i++) {
          final tabLayoutController = tabLayoutControllerList[i];
          final double page = _pageController.page!;
          if (notification is ScrollUpdateNotification &&
              !tabLayoutController.indexIsChanging) {
            final bool pageChanged =
                (page - tabLayoutController.index).abs() > 1.0;
            if (pageChanged) {
              tabLayoutController.index = page.round();
            }
            tabLayoutController.offset = clampDouble(
                _pageController.page! - tabLayoutController.index, -1.0, 1.0);
          } else if (notification is ScrollEndNotification) {
            tabLayoutController.index = page.round();
            if (!tabLayoutController.indexIsChanging) {
              tabLayoutController.offset = clampDouble(
                  _pageController.page! - tabLayoutController.index, -1.0, 1.0);
            }
          }
        }
        return true;
      },
      child: PageView(
        dragStartBehavior: DragStartBehavior.start,
        clipBehavior: Clip.hardEdge,
        controller: _pageController,
        physics:
            const PageScrollPhysics().applyTo(const ClampingScrollPhysics()),
        children: [
          for (var i = 0; i < pageCount; i++)
            "Page $i".text().center().container(color: randomColor()),
        ],
      ),
    ).container(
      padding: const EdgeInsets.all(16),
      height: 100,
      color: Colors.black12,
    );
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
