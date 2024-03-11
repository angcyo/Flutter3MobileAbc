// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:flutter3_app/flutter3_app.dart';
import 'package:yaml/yaml.dart';

@pragma("vm:entry-point")
void main() async {
  //testTime();
  /*testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });*/

  await testReadFile();
}

/// 测试循环100w次的耗时
@pragma("vm:entry-point")
void testTime() {
  assert(() {
    var c = 0;
    while (c++ < 10) {
      lTime.tick();
      int count = 10000000 * 10 * (c + 1);
      var sum = 0;
      for (int i = 0; i < count; i++) {
        sum += i;
      }
      l.i('循环$count次:$sum, 耗时:${lTime.time()}');
    }
    return true;
  }());
}

/// 测试读取文件
@testPoint
Future testReadFile() async {
  print(Directory.current);
  print(Directory.systemTemp);
  print(currentDirPath);

  final result = <FileSystemEntity>[];
  await getFlutterProject(currentDirPath, 1, result, 3);
  //print('result.length:${result.length} $result');
  final dependMap = <String, List<String>?>{};
  for (var file in result) {
    //print('${file}↓');
    final map = await getFlutterProjectDependence(file.path);
    dependMap[file.path.basename()] =
        map?.keys.filter((key) => key.startsWith("flutter3_")).cast();
  }
  //print('dependMap:$dependMap');
  print(dependMap.toJsonString());
  print('...end');
}

/// 递归获取指定目录下的所有Flutter工程目录
@testPoint
Future getFlutterProject(
  String path,
  int depth,
  List<FileSystemEntity> result,
  int maxDepth,
) async {
  final folder = path.file();
  final list = await folder.listFiles();
  for (var file in list ?? <FileSystemEntity>[]) {
    if (file.path.isDirectorySync()) {
      final pubspec = file.path.file('pubspec.yaml');
      if (pubspec.existsSync()) {
        result.add(file);
      }
      if (depth < maxDepth) {
        await getFlutterProject(file.path, depth + 1, result, maxDepth);
      }
    }
  }
}

/// 获取Flutter工程中yaml文件的依赖
@testPoint
Future<YamlMap?> getFlutterProjectDependence(String path) async {
  final pubspec = path.file('pubspec.yaml');
  if (pubspec.existsSync()) {
    final content = await pubspec.readAsString();
    final yaml = loadYaml(content);
    final dependencies = yaml['dependencies']; //YamlMap
    //print('dependencies:$dependencies');
    /*final devDependencies = yaml['dev_dependencies'];
    print('devDependencies:$devDependencies');*/
    //print(dependencies.runtimeType);
    return dependencies;
  }
  return null;
}
