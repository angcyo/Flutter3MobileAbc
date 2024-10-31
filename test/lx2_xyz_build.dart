import 'dart:io';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/10/30
///
@pragma("vm:entry-point")
void main() async {
  final currentPath = Directory.current.path;
  final outputPath = "$currentPath/test/.output/";
  final outputFileName = "测试lx2_xyz轴.gcode";
  final outputFilePath = outputPath + outputFileName;

  var minX = 0;
  var minY = 0;
  var maxX = 500;
  var maxY = 310;
  final f = 300; // mm/s; * 60 = 18000mm/min;
  final step = 10;

  final maxZ = 30;
  final zF = 30; //mm/s; * 60 = 1800mm/min;

  final loop = 100;

  StringBuffer buffer = StringBuffer();
  buffer.writeln("G90");
  buffer.writeln("G21");
  buffer.writeln("M98 P10 L$loop");
  buffer.writeln("G0 S0 F${f * 60}");

  while (maxX > minX && maxY > minY) {
    buffer.writeln("G0 X$minX Y$minY");
    buffer.writeln("G0 X$maxX Y$minY");
    buffer.writeln("G0 X$maxX Y$maxY");
    buffer.writeln("G0 X$minX Y$maxY");
    buffer.writeln("G0 X$minX Y$minY");

    minX += step;
    minY += step;

    maxX -= step;
    maxY -= step;
  }
  buffer.writeln("G0 Z$maxZ F${zF * 60}");
  buffer.writeln("M99");
  buffer.writeln("M5");
  buffer.writeln("M2");

  File(outputFilePath).writeAsStringSync(buffer.toString());
  print("输出->$outputFilePath");
}

/// 确保输出目录存在
void ensureOutputDir(String path) {
  final dir = Directory(path);
  if (!dir.existsSync()) {
    dir.createSync();
  }
}
