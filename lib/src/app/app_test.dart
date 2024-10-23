import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/09/27
///
class AppTest {
  AppTest._();

  /// [_MainAbcState.build]
  ///
  /// ```
  /// NetworkInterface('lo', [InternetAddress('127.0.0.1', IPv4), InternetAddress('::1%1', IPv6)])
  /// NetworkInterface('wlan1', [InternetAddress('192.168.1.139', IPv4), InternetAddress('fe80::5418:24ff:fec0:1b07%wlan1', IPv6)])
  /// NetworkInterface('dummy0', [InternetAddress('fe80::50b4:8bff:fee9:b545%dummy0', IPv6)])
  /// ```
  /// [NetworkInterface]
  static void testOnMainBuild(State state) async {
    //debugger();
    final list = await NetworkInterface.list(
      includeLinkLocal: true,
      type: InternetAddressType.any,
      includeLoopback: true,
    );
    final ipv4 = InternetAddress.anyIPv4.address; //0.0.0.0
    final ipv6 = InternetAddress.anyIPv6.address; //::
    l.i("网络接口信息↓\n${list.join("\n")}\n默认ipv4->$ipv4, 默认ipv6->$ipv6");
    //debugger();
  }
}
