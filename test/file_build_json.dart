import 'dart:io';

import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/08/06
///
/// 将文件名收集之后, 保存到json数据中
void main() async {
  //工作目录
  const workPath = "E:/AndroidProjects/angcyo/file/AutoCalibrate/TestData";
  const outputPath = workPath;
  const baseUrl =
      "https://gitcode.net/angcyo/file/-/raw/master/AutoCalibrate/TestData/";

  //load
  final data = loadDataList(workPath, baseUrl);

  //output
  final outputFile = "$outputPath/data.json".file();
  await outputFile.writeAsString(data.toJsonString());
  consoleLog('...$outputFile');
  consoleLog('...end');
}

/// 从指定的路径中读取数据, 获取到的是资源相对路径
List<Map<String, dynamic>> loadDataList(String path, String baseUrl) {
  //忽略的后缀名
  final ignoreExtensions = [".json", ".bat", ".command"];
  final List<Map<String, dynamic>> result = [];
  final list = path.folder.listSync();
  list.sortBy((e) => e.path.fileName());
  for (final element in list) {
    if (element is File) {
      var fileName = element.fileName();
      if (!ignoreExtensions.any((e) => fileName.endsWith(e))) {
        double? width;
        double? height;
        String? layoutId;

        //正则匹配文件名中的123x123
        final reg = RegExp(r"(\d+)x(\d+)");
        if (reg.hasMatch(fileName)) {
          final match = reg.firstMatch(fileName);
          if (match != null) {
            width = double.tryParse(match.group(1) ?? "");
            height = double.tryParse(match.group(2) ?? "");
            consoleLog('$fileName->$width x $height');
          }
        }

        if (fileName.isImage) {
          width ??= 100;
          height ??= 100;
          if (fileName.contains("黑白")) {
            layoutId = "layerFill";
          }
        }
        result.add({
          "fileName": fileName,
          "url": baseUrl + fileName,
          "width": width,
          "height": height,
          "layoutId": layoutId,
          "md5": element.md5Sync(),
          "createTime": nowTimeString(),
        });
      }
    }
  }
  return result;
}
