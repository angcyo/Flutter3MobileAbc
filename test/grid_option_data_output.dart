import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/10/21
/// 参数矩阵数据输出脚本
void main() async {
  //E:\FlutterProjects\Flutter3Abc2
  final currentPath = Directory.current.path;
  final outputPath = "$currentPath/test/.output";
  print(currentPath);
  /*print(fillIntList(1000, 15000, 4));
  assert(false, 'quit');*/

  final inputImagePath = "/test/页岩石板.png";
  final inputImageName = inputImagePath.split("/").last.split(".").first;
  final inputJsonPath =
      "${(File(currentPath + inputImagePath)).parent.path}/$inputImageName.json";
  /*print(inputImageName);
  print(inputJsonPath);
  assert(false);*/

  //json文件内容对应的json对象, 是个map
  final inputJson = jsonDecode(File(inputJsonPath).readAsStringSync());
  /*print(inputJson.runtimeType);
  print(inputJson);
  assert(false);*/

  // 数据开始的x偏移px
  final gridDataOffsetX = inputJson["gridDataOffsetX"];
  final gridDataOffsetY = inputJson["gridDataOffsetY"];

  // 格子数据宽高px
  final gridDataWidth = inputJson["gridDataWidth"];
  final gridDataHeight = inputJson["gridDataHeight"];

  // 格子数据间隔px
  final gridDataGap = inputJson["gridDataGap"];

  List? horizontalList = inputJson["horizontalValueList"];
  if (horizontalList == null || horizontalList.isEmpty) {
    horizontalList = fillIntList(inputJson["horizontalMinValue"],
        inputJson["horizontalMaxValue"], inputJson["horizontalValueCount"]);
  }

  List? verticalList = inputJson["verticalValueList"];
  if (verticalList == null || verticalList.isEmpty) {
    verticalList = fillIntList(inputJson["verticalMinValue"],
        inputJson["verticalMaxValue"], inputJson["verticalValueCount"]);
  }

  //格子数据生成
  final gridDataList = [];
  horizontalList.forEachIndexed((hIndex, hValue) {
    verticalList?.forEachIndexed((vIndex, vValue) {
      gridDataList.add({
        inputJson["horizontalValueKey"]: hValue,
        inputJson["verticalValueKey"]: vValue,
        "x": gridDataOffsetX + hIndex * (gridDataWidth + gridDataGap),
        "y": gridDataOffsetY + vIndex * (gridDataHeight + gridDataGap),
        "w": gridDataWidth,
        "h": gridDataHeight,
      });
    });
  });
  inputJson["gridDataList"] = gridDataList;

  //json字符串输出
  print(jsonEncode(inputJson));

  //图片渲染输出/json输出
  outputImage(outputPath, inputJson);
  test('...test', () => true);
}

/// 输出图片
void outputImage(outputPath, json) {
  ensureOutputDir(outputPath);

  final outputImagePath = "$outputPath/${json["optionName"]}.png";
  final outputJsonPath = "$outputPath/${json["optionName"]}.json";
  // Create a 256x256 8-bit (default) rgb (default) image.
  final image = img.Image(
    width: json["originWidth"],
    height: json["originHeight"],
    numChannels: 4,
  );
  //debugger();

  img.fillRect(
    image,
    x1: 0,
    y1: 0,
    x2: image.width - 1,
    y2: image.height - 1,
    alphaBlend: false,
    color: img.ColorUint8.rgba(0, 0, 0, 30),
  ) /*img.ColorUint8.rgb(255, 255, 255)*/;

  img.drawRect(image,
      x1: 0,
      y1: 0,
      x2: image.width - 1,
      y2: image.height - 1,
      color: img.ColorUint8.rgb(255, 0, 0));

  for (final gridData in json["gridDataList"]) {
    /*img.fillRect(image,
        x1: gridData["x"],
        y1: gridData["y"],
        x2: gridData["x"] + gridData["w"],
        y2: gridData["y"] + gridData["h"],
        color: img.ColorUint8.rgb(0, 0, 0));*/

    img.drawRect(image,
        x1: gridData["x"],
        y1: gridData["y"],
        x2: gridData["x"] + gridData["w"],
        y2: gridData["y"] + gridData["h"],
        color: img.ColorUint8.rgb(255, 0, 0));
  }

  //img.fillRect(image, color: color)
  // Iterate over its pixels
  /*for (final pixel in image) {
    // Set the pixels red value to its x position value, creating a gradient.
    pixel
      ..r = pixel.x
      // Set the pixels green value to its y position value.
      ..g = pixel.y;
  }*/
  // Encode the resulting image to the PNG image format.
  final png = img.encodePng(image);

  // Write the PNG formatted data to a file.
  File(outputImagePath).writeAsBytesSync(png);
  //输出json字符串数据
  File(outputJsonPath).writeAsBytesSync(utf8.encoder.convert(jsonEncode(json)));
}

/// 确保输出目录存在
void ensureOutputDir(String path) {
  final dir = Directory(path);
  if (!dir.existsSync()) {
    dir.createSync();
  }
}

/// 10 ~ 100 , 补齐数值
/// [start] 开始值
/// [end] 结束值
/// [count] 总共输出的数量
List<int> fillIntList(int start, int end, int count) {
  List<int> result = [start];
  final step = (end - start) / (count - 1);
  while (result.length < count - 1) {
    result.add((result.last + step).round());
  }
  if (result.length < count) {
    result.add(end);
  }
  return result;
}

extension ListExtensions<E> on List<E> {
  void forEachIndexed(void Function(int index, E element) action) {
    for (var index = 0; index < length; index++) {
      action(index, this[index]);
    }
  }
}
