import 'dart:io';

import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter_test/flutter_test.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/05/30
///

void main() {
  test('get float', () {
    const string = "-1ri-1.0gh+9tshift1.00mm.dat";
    final floatResult = string.getFloatList();
    final intResult = string.getIntList();
    consoleLog(floatResult);
    consoleLog(intResult);
  });

  test('test rename', () {
    const path = r'E:\hingin\振镜校准\160x160角点补偿';
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

      newName = newName.replaceAll("topshift", "y-");
      newName = newName.replaceAll("downshift", "y+");
      newName = newName.replaceAll("leftshift", "x-");
      newName = newName.replaceAll("rightshift", "x+");

      /*newName = newName.replaceAll(r"0.25mm", "25");
      newName = newName.replaceAll(r"0.5mm", "50");
      newName = newName.replaceAll(r"0.75mm", "75");
      newName = newName.replaceAll(r"1.00mm", "100");
      newName = newName.replaceAll(r"1.5mm", "150");
      newName = newName.replaceAll(r"2.0mm", "200");*/

      newName = newName.replaceAll(r"x-25", "x-12");
      newName = newName.replaceAll(r"x-50", "x-24");
      newName = newName.replaceAll(r"x-75", "x-37");
      newName = newName.replaceAll(r"x-100", "x-49");
      newName = newName.replaceAll(r"x-150", "x-74");
      newName = newName.replaceAll(r"x-200", "x-99");

      newName = newName.replaceAll(r"x+25", "x+12");
      newName = newName.replaceAll(r"x+50", "x+24");
      newName = newName.replaceAll(r"x+75", "x+37");
      newName = newName.replaceAll(r"x+100", "x+49");
      newName = newName.replaceAll(r"x+150", "x+74");
      newName = newName.replaceAll(r"x+200", "x+99");

      newName = newName.replaceAll(r"y-25", "y-10");
      newName = newName.replaceAll(r"y-50", "y-20");
      newName = newName.replaceAll(r"y-75", "y-30");
      newName = newName.replaceAll(r"y-100", "y-40");
      newName = newName.replaceAll(r"y-150", "y-60");
      newName = newName.replaceAll(r"y-200", "y-80");

      newName = newName.replaceAll(r"y+25", "y+10");
      newName = newName.replaceAll(r"y+50", "y+20");
      newName = newName.replaceAll(r"y+75", "y+30");
      newName = newName.replaceAll(r"y+100", "y+40");
      newName = newName.replaceAll(r"y+150", "y+60");
      newName = newName.replaceAll(r"y+200", "y+80");


      file.renameTo(newName);
    }

    consoleLog('...end');
    return true;
  });
}
