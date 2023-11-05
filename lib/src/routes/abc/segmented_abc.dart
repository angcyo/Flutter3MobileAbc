import 'package:flutter/material.dart';
import 'package:flutter3_abc/src/routes/abc/base_abc.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2023/11/05
///

class SegmentedAbc extends StatefulWidget {
  const SegmentedAbc({super.key});

  @override
  State<SegmentedAbc> createState() => _SegmentedAbcState();
}

class _SegmentedAbcState extends State<SegmentedAbc> with BaseAbcStateMixin {
  var segments = [
    const ButtonSegment(value: "Value1", label: Text("Label1")),
    const ButtonSegment(value: "Value2", label: Text("Label2")),
    const ButtonSegment(value: "Value3", label: Text("Label3")),
    const ButtonSegment(value: "Value4", label: Text("Label4")),
  ];
  var selectedSingle = {
    "Value1",
  };
  var selectedSingleEmpty = {
    "Value1",
  };
  var selectedMulti = {
    "Value1",
    "Value2",
  };
  var selectedMultiEmpty = {
    "Value1",
    "Value2",
  };

  @override
  List<Widget> buildBodyList(BuildContext context) {
    return [
      const Text("单选-不可为空↓"),
      SegmentedButton<String>(
        segments: segments,
        selected: selectedSingle,
        onSelectionChanged: (value) {
          setState(() {
            selectedSingle = value;
          });
        },
        selectedIcon: const Icon(Icons.ac_unit),
        multiSelectionEnabled: false,
        emptySelectionAllowed: false,
      ),
      const Text("单选-可为空↓"),
      SegmentedButton<String>(
        segments: segments,
        selected: selectedSingleEmpty,
        onSelectionChanged: (value) {
          setState(() {
            selectedSingleEmpty = value;
          });
        },
        multiSelectionEnabled: false,
        emptySelectionAllowed: true,
        selectedIcon: const Icon(Icons.access_alarm),
      ),
      const Text("多选-不可为空↓"),
      SegmentedButton<String>(
        segments: segments,
        selected: selectedMulti,
        onSelectionChanged: (value) {
          setState(() {
            selectedMulti = value;
          });
        },
        multiSelectionEnabled: true,
        emptySelectionAllowed: false,
      ),
      const Text("多选-可为空↓"),
      SegmentedButton<String>(
        segments: segments,
        selected: selectedMultiEmpty,
        onSelectionChanged: (value) {
          setState(() {
            selectedMultiEmpty = value;
          });
        },
        multiSelectionEnabled: true,
        emptySelectionAllowed: true,
        selectedIcon: const Icon(Icons.accessibility),
      ),
    ];
  }
}
