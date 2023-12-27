import 'package:flutter/widgets.dart';
import 'package:flutter3_abc/src/routes/main_route.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/25
///

class WheelAbc extends StatefulWidget {
  const WheelAbc({super.key});

  @override
  State<WheelAbc> createState() => _WheelAbcState();
}

class _WheelAbcState extends State<WheelAbc> with BaseAbcStateMixin {
  WidgetList buildItems() {
    return [
      Text('1'),
      Text('2'),
      Text('3'),
      Text('4'),
      Text('5'),
      Text('6'),
      Text('7'),
      Text('8'),
      Text('9'),
      Text('10'),
    ];
  }

  @override
  List<Widget> buildBodyList(BuildContext context) {
    return [
      "WheelPicker↓".text(textAlign: TextAlign.center),
      Wheel(
        children: buildItems(),
      ).container(color: randomColor()),
      Wheel(
        looping: true,
        height: 300,
        children: buildItems(),
      ).container(color: randomColor()),
      "ListWheelScrollView↓".text(textAlign: TextAlign.center),
      ListWheelScrollView(
        itemExtent: 30,
        overAndUnderCenterOpacity: 0.5,
        diameterRatio: 0.8,
        children: buildItems(),
      ).size(height: 200).container(color: randomColor()),
      "ListWheelScrollViewX↓".text(textAlign: TextAlign.center),
      ListWheelScrollViewX(
        itemExtent: 30,
        overAndUnderCenterOpacity: 0.5,
        diameterRatio: 0.8,
        scrollDirection: Axis.horizontal,
        children: buildItems(),
      ).size(height: 200).container(color: randomColor()),
      ListWheelScrollViewX(
        itemExtent: 30,
        overAndUnderCenterOpacity: 0.5,
        diameterRatio: 0.8,
        scrollDirection: Axis.vertical,
        children: buildItems(),
      ).size(height: 200).container(color: randomColor()),
    ];
  }
}
