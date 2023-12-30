///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/30
///

class AddDeviceBean {
  /// 设备名称
  final String? name;

  /// 图片资源路径
  /// 'assets/png/device_c1.png'
  final String? assetsKey;

  /// 是否需要配置网络
  final bool? configNetwork;

  /// 是否只在调试模式下显示
  final bool? debug;

  AddDeviceBean(
    this.name,
    this.assetsKey,
    this.configNetwork,
    this.debug,
  );

  AddDeviceBean.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        assetsKey = json['assetsKey'] as String?,
        configNetwork = json['configNetwork'] as bool?,
        debug = json['debug'] as bool?;
}
