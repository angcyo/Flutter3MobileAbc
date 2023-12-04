/// id : 785187
/// blueName : "LP5-2D4F7A"
/// deviceModel : "LP5"
/// firmwareVersion : "8000"
/// appVersion : "5.3.7-alpha8"
/// createTime : "12/01/2023"

class ConnectDeviceBean {
  ConnectDeviceBean({
    this.id,
    this.blueName,
    this.deviceModel,
    this.firmwareVersion,
    this.appVersion,
    this.createTime,
  });

  ConnectDeviceBean.fromJson(dynamic json) {
    id = json['id'];
    blueName = json['blueName'];
    deviceModel = json['deviceModel'];
    firmwareVersion = json['firmwareVersion'];
    appVersion = json['appVersion'];
    createTime = json['createTime'];
  }

  num? id;
  String? blueName;
  String? deviceModel;
  String? firmwareVersion;
  String? appVersion;
  String? createTime;

  ConnectDeviceBean copyWith({
    num? id,
    String? blueName,
    String? deviceModel,
    String? firmwareVersion,
    String? appVersion,
    String? createTime,
  }) =>
      ConnectDeviceBean(
        id: id ?? this.id,
        blueName: blueName ?? this.blueName,
        deviceModel: deviceModel ?? this.deviceModel,
        firmwareVersion: firmwareVersion ?? this.firmwareVersion,
        appVersion: appVersion ?? this.appVersion,
        createTime: createTime ?? this.createTime,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['blueName'] = blueName;
    map['deviceModel'] = deviceModel;
    map['firmwareVersion'] = firmwareVersion;
    map['appVersion'] = appVersion;
    map['createTime'] = createTime;
    return map;
  }
}
