import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/10/21
/// 参数矩阵数据输出脚本
void main() async {
  final currentPath = Directory.current.path;
  print(currentPath);

  // 数据开始的x偏移px
  final gridDataOffsetX = 86;
  final gridDataOffsetY = 75;

  // 格子数据宽高px
  final gridDataWidth = 47;
  final gridDataHeight = gridDataWidth;

  // 格子数据间隔px
  final gridDataGap = 9;

  // 功率列表%
  final powerList = fillIntList(10, 100, 4);
  // 深度列表%
  final depthList = powerList;

  final gridDataList = [];

  powerList.forEachIndexed((pIndex, power) {
    depthList.forEachIndexed((dIndex, depth) {
      gridDataList.add({
        "power": power,
        "depth": depth,
        "x": gridDataOffsetX + pIndex * (gridDataWidth + gridDataGap),
        "y": gridDataOffsetY + dIndex * (gridDataHeight + gridDataGap),
        "width": gridDataWidth,
        "height": gridDataHeight,
      });
    });
  });

  final json = {
    "optionName": "材质名",
    "originWidth": 358, //原始图片的宽度, px
    "originHeight": 358, //原始图片的高度, px
    "gridDataOffsetX": gridDataOffsetX, //数据开始的x偏移px
    "gridDataOffsetY": gridDataOffsetY, //数据开始的y偏移px
    "gridDataList": gridDataList, //格子数据
  };

  print(jsonEncode(json));

  outputImage(json);
  test('...test', () => true);
}

/// 输出图片
void outputImage(json) {
  final currentPath = Directory.current.path;
  final outputPath = "$currentPath/test/.output";
  ensureOutputDir(outputPath);

  final outputImagePath = "$outputPath/${json["optionName"]}.png";
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
        x2: gridData["x"] + gridData["width"],
        y2: gridData["y"] + gridData["height"],
        color: img.ColorUint8.rgb(0, 0, 0));*/

    img.drawRect(image,
        x1: gridData["x"],
        y1: gridData["y"],
        x2: gridData["x"] + gridData["width"],
        y2: gridData["y"] + gridData["height"],
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
