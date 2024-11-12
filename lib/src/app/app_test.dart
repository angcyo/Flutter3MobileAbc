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
  /// ```
  ///NetworkInterface('lo', [InternetAddress('127.0.0.1', IPv4), InternetAddress('::1%1', IPv6)])
  ///NetworkInterface('wlan0', [InternetAddress('192.168.0.108', IPv4), InternetAddress('fd00:4c10:d528:d394:1c86:ee7e:df0e:85ed%26', IPv6), InternetAddress('fd00:4c10:d528:d394:19a1:53c:2d57:a2b7%26', IPv6), InternetAddress('fd00:4c10:d528:d394:c916:ebd5:3585:5bef%26', IPv6), InternetAddress('fd00:4c10:d528:d394:9bd:eb46:2db9:d13c%26', IPv6), InternetAddress('fd00:4c10:d528:d394:8417:5926:e5fe:a23c%26', IPv6), InternetAddress('fd00:4c10:d528:d394:5025:d13e:ff2c:9544%26', IPv6), InternetAddress('fd00:4c10:d528:d394:d063:fdcb:3ff0:e5f5%26', IPv6), InternetAddress('fd00:4c10:d528:d394:2e59:8aff:fe7c:3f54%26', IPv6), InternetAddress('fe80::2e59:8aff:fe7c:3f54%wlan0', IPv6)])
  ///NetworkInterface('rndis0', [InternetAddress('192.168.42.129', IPv4), InternetAddress('fe80::68b3:eaff:fee0:22f%rndis0', IPv6)])
  ///NetworkInterface('dummy0', [InternetAddress('fe80::502b:1aff:fe3a:5b7d%dummy0', IPv6)])
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
    l.i("网络接口信息(网关)↓\n${list.join("\n")}\n默认ipv4->$ipv4, 默认ipv6->$ipv6");
    //debugger();
  }
}
