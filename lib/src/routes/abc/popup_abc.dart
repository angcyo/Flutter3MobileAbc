import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';

import '../main_route.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/05/15
///

class PopupAbc extends StatefulWidget {
  const PopupAbc({super.key});

  @override
  State<PopupAbc> createState() => _PopupAbcState();
}

class _PopupAbcState extends State<PopupAbc> with BaseAbcStateMixin {
  @override
  List<Widget> buildBodyList(BuildContext context) {
    return [
      "ArrowLayout↓".text(
        textAlign: TextAlign.center,
      ),
      [
        ArrowLayout(
          arrowDirection: AxisDirection.left,
          arrowDirectionOffset: 35,
          child: "text\nangcyo".text(),
        ),
        ArrowLayout(
          arrowDirection: AxisDirection.up,
          arrowDirectionOffset: 35,
          child: "text\nangcyo".text(),
        ),
        ArrowLayout(
          arrowDirection: AxisDirection.right,
          arrowDirectionOffset: 35,
          child: "text\nangcyo".text(),
        ),
        ArrowLayout(
          arrowDirection: AxisDirection.down,
          arrowDirectionOffset: 35,
          child: "text\nangcyo".text(),
        ),
      ].flowLayout()!,
      "Popup↓".text(
        textAlign: TextAlign.center,
      ),
      [
        GradientButton.normal(() {}, onContextTap: (context) {
          context.showArrowPopup(
            "text\nangcyo".text(),
            anchorChild: context,
          );
        }, child: "showPopup".text())
      ].flowLayout()!,
      [
        GradientButton.normal(() {}, onContextTap: (context) {
          context.showArrowPopup(
            "text\nangcyo".text(),
            anchorChild: context,
          );
        }, child: "showPopup".text()),
        GradientButton.normal(() {}, onContextTap: (context) {
          context.showArrowPopup(
            "text\nangcyo".text(),
            arrowDirection: AxisDirection.down,
            anchorChild: context,
          );
        }, child: "showPopup".text())
      ].flowLayout()!.rFill(),
    ];
  }
}
