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
  Widget buildAbc(BuildContext context) {
    return ProgressStateWidget(childBuilder: (ctx) => super.buildAbc(ctx));
  }

  @override
  WidgetList buildBodyList(BuildContext context) {
    return [
      [
        GradientButton(
          child: "所有网络接口信息".text(),
          onTap: () {
            _logNetworkInterface();
          },
        ),
        GradientButton(
          child: "启动Http服务".text(),
          onTap: () {
            _startHttpServer();
          },
        ),
        GradientButton(
          child: "启动Socket服务".text(),
          onTap: () {
            _startSocketServer();
          },
        ),
        if (!isNil(_socketList)) ...[
          GradientButton(
            child: "发送Socket数据(1MB)".text(),
            onTap: () {
              _sendAllSocket(context, 1024 * 1024);
            },
          ),
          GradientButton(
            child: "(2MB)".text(),
            onTap: () {
              _sendAllSocket(context, 1024 * 1024 * 2);
            },
          ),
          GradientButton(
            child: "(5MB)".text(),
            onTap: () {
              _sendAllSocket(context, 1024 * 1024 * 5);
            },
          ),
          GradientButton(
            child: "(10MB)".text(),
            onTap: () {
              _sendAllSocket(context, 1024 * 1024 * 10);
            },
          ),
          GradientButton(
            child: "(20MB)".text(),
            onTap: () {
              _sendAllSocket(context, 1024 * 1024 * 20);
            },
          ),
          GradientButton(
            child: "(50MB)".text(),
            onTap: () {
              _sendAllSocket(context, 1024 * 1024 * 50);
            },
          ),
          GradientButton(
            child: "(100MB)".text(),
            onTap: () {
              _sendAllSocket(context, 1024 * 1024 * 100);
            },
          ),
          GradientButton(
            child: "关闭所有Socket".text(),
            onTap: () {
              _closeAllSocket();
            },
          ),
        ],
      ].flowLayout(childGap: kL)!.matchParentWidth().paddingAll(kL),
      rebuild(resultUpdateSignal, (context, data) {
        return "${data ?? "--"}".text();
      }).paddingAll(kL),
    ];
  }

  @override
  void dispose() {
    _closeAllSocket();
    _httpServer?.close(force: true);
    _socketServer?.close();
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

  final _httpServerPort = 1970;
  HttpServer? _httpServer;

  /// ```
  /// SocketException: Failed to create server socket (OS Error: Permission denied, errno = 13), address = 0.0.0.0, port = 80
  /// ```
  void _startHttpServer() async {
    //debugger();
    _httpServer?.close(force: true);
    /*final server = await HttpServer.bind(
        InternetAddress("192.168.42.129", type: InternetAddressType.any),
        serverPort);*/
    final address = InternetAddress.anyIPv4;
    final server = await HttpServer.bind(address, _httpServerPort);
    resultUpdateSignal.updateValue(
        "${nowTimeString()}\nHttp服务已启动->$address:$_httpServerPort");
    _httpServer = server;
    await for (final request in server) {
      lTime.tick();
      resultUpdateSignal.updateValue(
          "${nowTimeString()}\nHttp请求->${request.uri} ${request.uri.query}");
      final size = request.uri.queryParameters["size"]?.toIntOrNull() ?? 100;
      final text = _buildString(size);
      request.response
        ..statusCode = HttpStatus.ok
        ..writeAll([
          "hello:${nowTimeString()}[${text.bytes.size().toSizeStr()}]\n$text",
          "\n",
          lTime.time()
        ])
        ..close();
    }
  }

  //--

  final _socketServerPort = 1971;
  ServerSocket? _socketServer;
  final List<Socket> _socketList = [];

  void _startSocketServer() async {
    _socketServer?.close();
    _closeAllSocket();
    final address = InternetAddress.anyIPv4;
    final server = await ServerSocket.bind(address, _socketServerPort);
    resultUpdateSignal.updateValue(
        "${nowTimeString()}\nSocket服务已启动:$address 服务端口:$_socketServerPort");
    _socketServer = server;
    await for (final socket in server) {
      resultUpdateSignal.updateValue(
          "${nowTimeString()}\n客户端已连接->${socket.remoteAddress} 客户端端口:${socket.remotePort} 服务端端口:${socket.port}");
      socket.listen((data) {
        resultUpdateSignal
            .updateValue("${nowTimeString()}\n客户端请求数据->${data.utf8Str}");
        socket.add([
          ..."${nowTimeString()}->".bytes,
          ...data,
        ]);
      }, onDone: () {
        //debugger();
        _socketList.remove(socket);
        updateState();
      }, onError: (e) {
        //debugger();
        _socketList.remove(socket);
        updateState();
      }, cancelOnError: true);
      socket.add("hello:${nowTimeString()}".bytes);

      //--
      _socketList.add(socket);
      updateState();
    }
  }

  /// 关闭所有客户端Socket
  void _closeAllSocket() {
    for (final socket in _socketList) {
      socket.close();
    }
    _socketList.clear();
  }

  /// 向所有客户端发送字节大小的数据
  /// [size] 字节大小
  void _sendAllSocket(BuildContext context, int size) {
    context.dispatchProgressState();
    () async {
      for (final socket in _socketList) {
        final bytes = _buildString(size).bytes;
        final byteSize = bytes.size();
        final chunkInfo = DataChunkInfo(
          startTime: lTime.tick(),
          total: byteSize,
          count: byteSize,
        );
        socket.add(bytes);
        resultUpdateSignal.updateValue(
            "${nowTimeString()}\n发送数据(${byteSize.toSizeStr()})->${lTime.time()} ${chunkInfo.getSpeedStr()}");
      }
      context.buildContext?.dispatchProgressState(progress: 1);
    }();
  }

  /// 创建指定字节大小的字符串
  String _buildString(int size) {
    const String chars =
        '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final StringBuffer buffer = StringBuffer();
    int byteCount = 0;

    for (int i = 0; i < intMax64Value; i++) {
      final char = chars[i % chars.length];
      byteCount += char.bytes.size();
      buffer.write(char);
      if (byteCount >= size) {
        break;
      }
    }
    return buffer.toString();
  }
}
