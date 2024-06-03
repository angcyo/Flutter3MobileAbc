// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_test_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HttpTestBean _$HttpTestBeanFromJson(Map<String, dynamic> json) => HttpTestBean(
      errMsg: json['errMsg'] as String,
      code: json['code'] as num,
      data: DataBean.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HttpTestBeanToJson(HttpTestBean instance) =>
    <String, dynamic>{
      'errMsg': instance.errMsg,
      'code': instance.code,
      'data': instance.data,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) => DataBean(
      id: json['id'] as num?,
      nickname: json['nickname'] as String?,
      say: json['say'],
      avatar: json['avatar'] as String?,
      mobile: json['mobile'],
      email: json['email'] as String?,
      sex: json['sex'] as num?,
      countryCodeName: json['countryCodeName'],
      region: json['region'],
      province: json['province'] as String?,
      city: json['city'] as String?,
      token: json['token'] as String?,
      like: json['like'],
      download: json['download'],
      follow: json['follow'],
      attention: json['attention'],
      isFriend: json['isFriend'],
      deviceSecurityCode: json['deviceSecurityCode'] as String?,
      isOldUser: json['isOldUser'] as num?,
    );

Map<String, dynamic> _$DataBeanToJson(DataBean instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('nickname', instance.nickname);
  writeNotNull('say', instance.say);
  writeNotNull('avatar', instance.avatar);
  writeNotNull('mobile', instance.mobile);
  writeNotNull('email', instance.email);
  writeNotNull('sex', instance.sex);
  writeNotNull('countryCodeName', instance.countryCodeName);
  writeNotNull('region', instance.region);
  writeNotNull('province', instance.province);
  writeNotNull('city', instance.city);
  writeNotNull('token', instance.token);
  writeNotNull('like', instance.like);
  writeNotNull('download', instance.download);
  writeNotNull('follow', instance.follow);
  writeNotNull('attention', instance.attention);
  writeNotNull('isFriend', instance.isFriend);
  writeNotNull('deviceSecurityCode', instance.deviceSecurityCode);
  writeNotNull('isOldUser', instance.isOldUser);
  return val;
}
