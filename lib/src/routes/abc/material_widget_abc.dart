import 'package:flutter/material.dart';
import 'package:flutter3_basics/flutter3_basics.dart';

import 'base_abc.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2023/11/05
///

class MaterialWidgetAbc extends StatefulWidget {
  const MaterialWidgetAbc({super.key});

  @override
  State<MaterialWidgetAbc> createState() => _MaterialWidgetAbcState();
}

class _MaterialWidgetAbcState extends State<MaterialWidgetAbc>
    with BaseAbcStateMixin {
  var sliderValue = 0.5;

  @override
  List<Widget> buildBodyList(BuildContext context) {
    return [
      const Text("LinearProgressIndicator 进度条↓"),
      const LinearProgressIndicator(),
      const Text("CircularProgressIndicator 进度条↓"),
      const CircularProgressIndicator(),
      const Text("LinearProgressIndicator Value 进度条↓"),
      const LinearProgressIndicator(
        value: 0.33,
      ),
      const Text("CircularProgressIndicator Value 进度条↓"),
      const CircularProgressIndicator(
        value: 0.60,
      ),
      //--
      const Text("Slider 离散↓"),
      Slider(
        value: sliderValue,
        min: 0,
        max: 1.0,
        divisions: 10,
        label: '!!!$sliderValue!!!',
        onChanged: (newValue) {
          setState(() {
            sliderValue = newValue;
          });
        },
        onChangeStart: (startValue) {
          l.d("Started change on:$startValue");
        },
        onChangeEnd: (newValue) {
          l.d("Ended change on:$newValue");
        },
      ),
      const Text("Slider 离散2↓"),
      Slider(
        value: sliderValue,
        min: 0,
        max: 1.0,
        divisions: 100,
        label: '$sliderValue',
        onChanged: (newValue) {
          setState(() {
            sliderValue = newValue;
          });
        },
        onChangeStart: (startValue) {
          l.d("Started change on:$startValue");
        },
        onChangeEnd: (newValue) {
          l.d("Ended change on:$newValue");
        },
      ),
      const Text("Slider 连续↓"),
      Slider(
        value: sliderValue,
        min: 0,
        max: 1,
        divisions: null,
        label: '$sliderValue',
        onChanged: (newValue) {
          setState(() {
            sliderValue = newValue;
          });
        },
        onChangeStart: (startValue) {
          l.d("Started change on:$startValue");
        },
        onChangeEnd: (newValue) {
          l.d("Ended change on:$newValue");
        },
      ),
      const Text("Slider secondaryTrackValue 连续↓"),
      Slider(
        value: sliderValue,
        secondaryTrackValue: 0.8,
        min: 0,
        max: 1,
        divisions: null,
        label: '$sliderValue',
        onChanged: (newValue) {
          setState(() {
            sliderValue = newValue;
          });
        },
        onChangeStart: (startValue) {
          l.d("Started change on:$startValue");
        },
        onChangeEnd: (newValue) {
          l.d("Ended change on:$newValue");
        },
      ),
    ];
  }
}
