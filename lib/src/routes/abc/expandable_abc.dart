import 'package:flutter/material.dart';
import 'package:flutter3_abc/src/routes/main_route.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/22
///

class ExpandableAbc extends StatefulWidget {
  const ExpandableAbc({super.key});

  @override
  State<ExpandableAbc> createState() => _ExpandableAbcState();
}

class _ExpandableAbcState extends State<ExpandableAbc> with BaseAbcStateMixin {
  final ExpandableController controller1 =
      ExpandableController(initialExpanded: false);

  final ExpandableController controller2 =
      ExpandableController(initialExpanded: false);

  final ExpandableController controller3 =
      ExpandableController(initialExpanded: true);

  final ExpandableController controller4 =
      ExpandableController(initialExpanded: true);

  final ExpandableController controller5 =
      ExpandableController(initialExpanded: true);

  final ExpandableController controller6 =
      ExpandableController(initialExpanded: true);

  final ExpandableController controller7 =
      ExpandableController(initialExpanded: false);

  Widget header(
      BuildContext context, String title, ExpandableController controller,
      [bool? expandableIcon]) {
    return Container(
      color: Colors.redAccent,
      child: [
        Text(title).paddingAll(kX).expanded(),
        if (expandableIcon == true) ExpandableIcon(),
        Text(controller.expanded ? "收起" : "展开").paddingAll(kX).inkWellCircle(
            onTap: () {
          controller.toggle();
          updateState();
        }).material()
      ].row(),
    );
  }

  Widget itemList(BuildContext context) {
    return List.generate(5, (index) => "Item $index".text().paddingAll(kH))
        .column();
  }

  @override
  List<Widget> buildBodyList(BuildContext context) {
    return [
      //---
      header(context, "header1", controller1),
      const Empty.zero()
          .expanding(expanded: itemList(context), controller: controller1),
      header(context, "header2", controller2),
      const Empty.zero()
          .expanding(expanded: itemList(context), controller: controller2),
      //---
      [
        header(context, "header3", controller3),
        const Empty.zero()
            .expanding(expanded: itemList(context), controller: controller3),
      ].column().card().paddingAll(kX),
      [
        header(context, "header4", controller4),
        const Empty.zero()
            .expanding(expanded: itemList(context), controller: controller4),
      ]
          .column(crossAxisAlignment: CrossAxisAlignment.start)
          .card()
          .paddingAll(kX),
      //---
      header(context, "header5", controller5, true)
          .expanding(expanded: itemList(context), controller: controller5),
      header(context, "header6", controller6, true)
          .expanding(expanded: itemList(context), controller: controller6),
      //---
      [
        ("angcyo" * 100)
            .text(maxLines: 2, overflow: TextOverflow.ellipsis)
            .orExpanded(
              expanded: ("angcyo" * 100).text(),
              controller: controller7,
            )
            .paddingAll(kX),
        (controller7.expanded ? "收起" : "展开").text().paddingAll(kX).inkWell(
            onTap: () {
          controller7.toggle();
          updateState();
        }).material()
      ].stack(alignment: AlignmentDirectional.bottomEnd),
      //---
      ("angcyo" * 100).toRichReadMore(),
    ];
  }
}
