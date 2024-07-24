import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_code/flutter3_code.dart';
import 'package:flutter3_shelf/flutter3_shelf.dart' as shelf;

import '../main_route.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/07/17
///
class WebSocketAbc extends StatefulWidget {
  const WebSocketAbc({super.key});

  @override
  State<WebSocketAbc> createState() => _WebSocketAbcState();
}

class _WebSocketAbcState extends State<WebSocketAbc>
    with BaseAbcStateMixin, StreamSubscriptionMixin {
  late final shelf.Flutter3ShelfWebSocketServer _webSocketServer =
      shelf.Flutter3ShelfWebSocketServer();

  /// 消息
  final messageList = <String>[];

  late final _messageFieldConfig = TextFieldConfig(
    text: "lastWebSocketMessage".hiveGet<String>(),
    hintText: "发送的内容",
    onChanged: (text) {
      "lastWebSocketMessage".hivePut(text);
    },
  );

  @override
  bool get resizeToAvoidBottomInset => true;

  @override
  void initState() {
    shelf.$debugLogWebSocketServer; //init
    hookStreamSubscription(_webSocketServer.clientStreamOnce.listen((client) {
      if (client != null) {
        messageList.add("${client.clientId}状态->${client.state}");
        updateState();
      }
    }));
    hookStreamSubscription(
        _webSocketServer.clientMessageStreamOnce.listen((message) {
      if (message != null) {
        messageList.add("${message.client.clientId}消息->${message.message}");
        updateState();
      }
    }));
    super.initState();
  }

  @override
  void dispose() {
    _webSocketServer.stop();
    super.dispose();
  }

  @override
  WidgetList buildBodyList(BuildContext context) {
    return [
      [
        GradientButton.normal(() async {
          await _webSocketServer.start();
          updateState();
        }, child: "启动ws服务".text()),
        GradientButton.normal(() {
          _webSocketServer.stop();
        }, child: "停止ws服务".text()),
      ].flowLayout(childGap: kX, padding: const EdgeInsets.all(kX))!,
      if (!isNil(_webSocketServer.address))
        [
          "服务地址:".text(),
          _webSocketServer.address?.text(textColor: Colors.blue).ink(() {
            _webSocketServer.address?.openUrl();
          }).paddingSymmetric(vertical: kX),
          _webSocketServer.address
              ?.toQrCodeImage()
              .toWidget((context, image) => image!.toImageWidget()),
        ].column(crossAxisAlignment: CrossAxisAlignment.start)!.paddingAll(kX),
      if (!isNil(shelf.$debugLogWebSocketServer.address))
        [
          "Debug服务地址:".text(),
          shelf.$debugLogWebSocketServer.address!
              .text(textColor: Colors.blue)
              .ink(() {
            shelf.$debugLogWebSocketServer.address!.openUrl();
          }).paddingSymmetric(vertical: kX),
          shelf.$debugLogWebSocketServer.address!
              .toQrCodeImage()
              .toWidget((context, image) => image!.toImageWidget()),
          SingleInputWidget(config: _messageFieldConfig).paddingOnly(top: kX),
          [
            GradientButton.normal(() {
              _webSocketServer.send(_messageFieldConfig.text);
              shelf.$debugLogWebSocketServer.send(_messageFieldConfig.text);
            }, child: "发送消息".text()),
          ].flowLayout(
              childGap: kX, padding: const EdgeInsets.symmetric(vertical: kX))!,
        ].column(crossAxisAlignment: CrossAxisAlignment.start)!.paddingAll(kX),
      for (final msg in messageList)
        msg.text().paddingOnly(left: kX, right: kX, top: kM),
    ];
  }
}
