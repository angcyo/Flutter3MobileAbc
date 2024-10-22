import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:lp_module/lp_module.dart';

import '../main_route.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/10/22
///

class LayoutAbc extends StatefulWidget {
  const LayoutAbc({super.key});

  @override
  State<LayoutAbc> createState() => _LayoutAbcState();
}

class _LayoutAbcState extends State<LayoutAbc> with BaseAbcStateMixin {
  @override
  WidgetList buildBodyList(BuildContext context) {
    return [
      /* DynamicLayoutBuilder(
        builder: (context, constraints, condition) {
          if (condition is String) {
            return Text(condition);
          }
          return Row(
            children: [Text("$condition")],
          );
        },
        initCondition: "--init--",
      ).size(height: 200),*/
      DynamicContainerLayoutBuilder(
        builder: (context, constraints, condition) {
          //debugger();
          if (condition is String) {
            return Text(condition);
          }
          return Row(
            children: [
              Text("$condition"),
              GradientButton.normal(() {
                toastBlur(text: "click");
              }, child: "Button".text()),
            ],
          ).center();
        },
        initCondition: "--init--",
        children: [
          paintWidget(
            (canvas, size) {
              //debugger();
              canvas.drawCircle(
                  size.center(Offset.zero), 20, Paint()..color = Colors.red);
            },
          ),
          GradientButton.normal(() {
            toastBlur(text: "click");
          }, child: "Button".text()),
        ],
      ).size(height: 200),
      GridOptionWidget().ratio(1 / 1),
    ];
  }
}
