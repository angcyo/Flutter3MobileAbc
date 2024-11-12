import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter3_abc/src/routes/main_route.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/11/11
///
class ServerAbc extends StatefulWidget {
  const ServerAbc({super.key});

  @override
  State<ServerAbc> createState() => _ServerAbcState();
}

class _ServerAbcState extends State<ServerAbc> with BaseAbcStateMixin {
  final resultUpdateSignal = createUpdateSignal();

  @override
  WidgetList buildBodyList(BuildContext context) {
    return [
      [
        GradientButton(
          child: "网络接口信息".text(),
          onTap: () {
            _logNetworkInterface();
          },
        ),
        GradientButton(
          child: "启动服务".text(),
          onTap: () {
            _startServer();
          },
        ),
      ].flowLayout(childGap: kL)!.matchParentWidth().paddingAll(kL),
      rebuild(resultUpdateSignal, (context, data) {
        return "${data ?? "--"}".text();
      }).paddingAll(kL),
    ];
  }

  @override
  void dispose() {
    _httpServer?.close(force: true);
    super.dispose();
  }

  void _logNetworkInterface() async {
    final list = await NetworkInterface.list(
      includeLinkLocal: true,
      type: InternetAddressType.any,
      includeLoopback: true,
    );
    final ipv4 = InternetAddress.anyIPv4.address; //0.0.0.0
    final ipv6 = InternetAddress.anyIPv6.address; //::
    resultUpdateSignal.updateValue(
        "网络接口信息(网关)↓\n${list.join("\n")}\n默认ipv4->$ipv4, 默认ipv6->$ipv6");
  }

  final serverPort = 8090;

  HttpServer? _httpServer;

  /// ```
  /// SocketException: Failed to create server socket (OS Error: Permission denied, errno = 13), address = 0.0.0.0, port = 80
  /// ```
  void _startServer() async {
    //debugger();
    if (_httpServer != null) {
      _httpServer?.close(force: true);
    }
    /*final server = await HttpServer.bind(
        InternetAddress("192.168.42.129", type: InternetAddressType.any),
        serverPort);*/
    final server = await HttpServer.bind(InternetAddress.anyIPv4, serverPort);
    resultUpdateSignal.updateValue(
        "${nowTimeString()}\nhttp server started->${InternetAddress.anyIPv4}:$serverPort");
    _httpServer = server;
    await for (final request in server) {
      lTime.tick();
      resultUpdateSignal.updateValue(
          "${nowTimeString()}\nrequest:${request.uri} ${request.uri.query}");
      final size = request.uri.queryParameters["size"]?.toIntOrNull() ?? 100;
      final text = _buildString(size);
      request.response
        ..statusCode = HttpStatus.ok
        ..writeAll([
          "hello world:${nowTimeString()}[${text.bytes.size().toSizeStr()}]\n$text",
          "\n",
          lTime.time()
        ])
        ..close();
    }
  }

  /// 创建指定字节大小的字符串
  String _buildString(int size) {
    const String chars =
        '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final StringBuffer buffer = StringBuffer();
    for (int i = 0; i < size; i++) {
      buffer.write(chars[i % chars.length]);
    }
    return buffer.toString();
  }
}
