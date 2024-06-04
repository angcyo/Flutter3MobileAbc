import 'dart:io';

import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter_test/flutter_test.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/05/30
///

void main() {
  test('test', () {
    final List<List<int>> list = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ];
    consoleLog(list.runtimeType);
    consoleLog(list);
    consoleLog(list[1][1]);
    return true;
  });

  test('get float', () {
    const string = "-1ri-1.0gh+9tshift1.00mm.dat";
    final floatResult = string.getFloatList();
    final intResult = string.getIntList();
    consoleLog(floatResult);
    consoleLog(intResult);
  });

  test('test rename', () {
    //const path = r'E:\hingin\振镜校准\160x160角点补偿';
    const path = r'E:\hingin\振镜校准\201x201角点补偿改良版';
    final files = path.listFilesSync(recursive: true) ?? [];

    for (final file in files) {
      /*final name = file.name;
      final newName = name.replaceAll('lb', 'rb');
      file.renameToSync(newName);*/
      if (file is File) {
        //consoleLog('${file.runtimeType}:${file.path}:${file.fileName()}');
      }
      final fileName = file.fileName();
      String newName = fileName;

      final xList = [12, 25, 37, 50, 75, 100];
      final yList = [10, 20, 30, 40, 61, 81];

      newName = newName.replaceAll("topshift0.25mm", "y-${yList[0]}");
      newName = newName.replaceAll("topshift0.5mm", "y-${yList[1]}");
      newName = newName.replaceAll("topshift0.75mm", "y-${yList[2]}");
      newName = newName.replaceAll("topshift1.00mm", "y-${yList[3]}");
      newName = newName.replaceAll("topshift1.5mm", "y-${yList[4]}");
      newName = newName.replaceAll("topshift2.0mm", "y-${yList[5]}");

      newName = newName.replaceAll("downshift0.25mm", "y+${yList[0]}");
      newName = newName.replaceAll("downshift0.5mm", "y+${yList[1]}");
      newName = newName.replaceAll("downshift0.75mm", "y+${yList[2]}");
      newName = newName.replaceAll("downshift1.00mm", "y+${yList[3]}");
      newName = newName.replaceAll("downshift1.5mm", "y+${yList[4]}");
      newName = newName.replaceAll("downshift2.0mm", "y+${yList[5]}");

      newName = newName.replaceAll("leftshift0.25mm", "x-${xList[0]}");
      newName = newName.replaceAll("leftshift0.5mm", "x-${xList[1]}");
      newName = newName.replaceAll("leftshift0.75mm", "x-${xList[2]}");
      newName = newName.replaceAll("leftshift1.00mm", "x-${xList[3]}");
      newName = newName.replaceAll("leftshift1.5mm", "x-${xList[4]}");
      newName = newName.replaceAll("leftshift2.0mm", "x-${xList[5]}");

      newName = newName.replaceAll("rightshift0.25mm", "x+${xList[0]}");
      newName = newName.replaceAll("rightshift0.5mm", "x+${xList[1]}");
      newName = newName.replaceAll("rightshift0.75mm", "x+${xList[2]}");
      newName = newName.replaceAll("rightshift1.00mm", "x+${xList[3]}");
      newName = newName.replaceAll("rightshift1.5mm", "x+${xList[4]}");
      newName = newName.replaceAll("rightshift2.0mm", "x+${xList[5]}");

      /*newName = newName.replaceAll("topshift", "y-");
      newName = newName.replaceAll("downshift", "y+");
      newName = newName.replaceAll("leftshift", "x-");
      newName = newName.replaceAll("rightshift", "x+");*/

      /*newName = newName.replaceAll(r"0.25mm", "25");
      newName = newName.replaceAll(r"0.5mm", "50");
      newName = newName.replaceAll(r"0.75mm", "75");
      newName = newName.replaceAll(r"1.00mm", "100");
      newName = newName.replaceAll(r"1.5mm", "150");
      newName = newName.replaceAll(r"2.0mm", "200");*/

      /*newName = newName.replaceAll(r"x-25", "x-${xList[0]}");
      newName = newName.replaceAll(r"x-50", "x-${xList[1]}");
      newName = newName.replaceAll(r"x-75", "x-${xList[2]}");
      newName = newName.replaceAll(r"x-100", "x-${xList[3]}");
      newName = newName.replaceAll(r"x-150", "x-${xList[4]}");
      newName = newName.replaceAll(r"x-200", "x-${xList[5]}");

      newName = newName.replaceAll(r"x+25", "x+${xList[0]}");
      newName = newName.replaceAll(r"x+50", "x+${xList[1]}");
      newName = newName.replaceAll(r"x+75", "x+${xList[2]}");
      newName = newName.replaceAll(r"x+100", "x+${xList[3]}");
      newName = newName.replaceAll(r"x+150", "x+${xList[4]}");
      newName = newName.replaceAll(r"x+200", "x+${xList[5]}");

      newName = newName.replaceAll(r"y-25", "y-${yList[0]}");
      newName = newName.replaceAll(r"y-50", "y-${yList[1]}");
      newName = newName.replaceAll(r"y-75", "y-${yList[2]}");
      newName = newName.replaceAll(r"y-100", "y-${yList[3]}");
      newName = newName.replaceAll(r"y-150", "y-${yList[4]}");
      newName = newName.replaceAll(r"y-200", "y-${yList[5]}");

      newName = newName.replaceAll(r"y+25", "y+${yList[0]}");
      newName = newName.replaceAll(r"y+50", "y+${yList[1]}");
      newName = newName.replaceAll(r"y+75", "y+${yList[2]}");
      newName = newName.replaceAll(r"y+100", "y+${yList[3]}");
      newName = newName.replaceAll(r"y+150", "y+${yList[4]}");
      newName = newName.replaceAll(r"y+200", "y+${yList[5]}");*/

      file.renameTo(newName);
    }

    consoleLog('...end');
    return true;
  });
}
