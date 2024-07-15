import 'package:flutter/material.dart';
import 'package:flutter3_abc/src/routes/main_route.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_shelf/flutter3_shelf.dart' as shelf;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/07/15
///
class ShelfAbc extends StatefulWidget {
  const ShelfAbc({super.key});

  @override
  State<ShelfAbc> createState() => _ShelfAbcState();
}

class _ShelfAbcState extends State<ShelfAbc> with BaseAbcStateMixin {
  late final shelf.Flutter3Shelf _shelf = shelf.Flutter3Shelf()
    ..get("/", (shelf.Request request) {
      //debugger();
      return shelf.Response.ok("Hello World!");
    })
    ..upload(onSaveFile: (filePath) {
      _uploadFilePath = filePath;
      updateState();
    });

  String? _uploadFilePath;

  @override
  void dispose() {
    _shelf.stop();
    super.dispose();
  }

  @override
  WidgetList buildBodyList(BuildContext context) {
    return [
      [
        GradientButton.normal(() async {
          await _shelf.start();
          updateState();
        }, child: "启动服务".text()),
        GradientButton.normal(() {
          _shelf.stop();
        }, child: "停止服务".text()),
      ].flowLayout(childGap: kX, padding: const EdgeInsets.all(kX))!,
      if (!isNil(_shelf.address))
        [
          "服务地址:".text(),
          _shelf.address?.text(textColor: Colors.blue).ink(() {
            _shelf.address?.openUrl();
          }),
        ].column(crossAxisAlignment: CrossAxisAlignment.start)!.paddingAll(kX),
      if (!isNil(_uploadFilePath))
        [
          "收到上传文件:${nowTimeString()}:${_uploadFilePath!.fileSize.toSizeStr()}"
              .text(),
          _uploadFilePath?.text(textColor: Colors.blue).ink(() {
            //_uploadFilePath?.openFile();
          }),
        ].column(crossAxisAlignment: CrossAxisAlignment.start)!.paddingAll(kX),
    ];
  }
}
