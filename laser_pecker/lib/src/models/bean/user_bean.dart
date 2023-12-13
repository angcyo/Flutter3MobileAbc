/// id : 18434
/// nickname : "8️⃣🅱️Q了"
/// say : null
/// avatar : "https://laserpecker-prod.oss-cn-hongkong.aliyuncs.com/app/images/7d26dffd-9ca6-8dab-166e-98351a825905.png?w=250&h=250&"
/// mobile : null
/// email : "angcyo@126.com"
/// sex : 2
/// countryCodeName : null
/// region : null
/// province : "北京市"
/// city : "北京"
/// token : "576de7465dea4e14938cf251c8081686"
/// like : null
/// download : null
/// follow : null
/// attention : null
/// isFriend : null
/// deviceSecurityCode : "666666"
/// isOldUser : 0

class UserBean {
  UserBean({
    this.id,
    this.nickname,
    this.say,
    this.avatar,
    this.mobile,
    this.email,
    this.sex,
    this.countryCodeName,
    this.region,
    this.province,
    this.city,
    this.token,
    this.like,
    this.download,
    this.follow,
    this.attention,
    this.isFriend,
    this.deviceSecurityCode,
    this.isOldUser,
  });

  UserBean.fromJson(dynamic json) {
    id = json['id'];
    nickname = json['nickname'];
    say = json['say'];
    avatar = json['avatar'];
    mobile = json['mobile'];
    email = json['email'];
    sex = json['sex'];
    countryCodeName = json['countryCodeName'];
    region = json['region'];
    province = json['province'];
    city = json['city'];
    token = json['token'];
    like = json['like'];
    download = json['download'];
    follow = json['follow'];
    attention = json['attention'];
    isFriend = json['isFriend'];
    deviceSecurityCode = json['deviceSecurityCode'];
    isOldUser = json['isOldUser'];
  }

  num? id;
  String? nickname;
  dynamic say;
  String? avatar;
  String? mobile;
  String? email;
  int? sex;
  dynamic countryCodeName;
  dynamic region;
  String? province;
  String? city;
  String? token;
  int? like;
  int? download;
  int? follow;
  int? attention;
  int? isFriend;
  String? deviceSecurityCode;
  int? isOldUser;

  UserBean copyWith({
    num? id,
    String? nickname,
    dynamic say,
    String? avatar,
    dynamic mobile,
    String? email,
    int? sex,
    dynamic countryCodeName,
    dynamic region,
    String? province,
    String? city,
    String? token,
    dynamic like,
    dynamic download,
    dynamic follow,
    dynamic attention,
    dynamic isFriend,
    String? deviceSecurityCode,
    int? isOldUser,
  }) =>
      UserBean(
        id: id ?? this.id,
        nickname: nickname ?? this.nickname,
        say: say ?? this.say,
        avatar: avatar ?? this.avatar,
        mobile: mobile ?? this.mobile,
        email: email ?? this.email,
        sex: sex ?? this.sex,
        countryCodeName: countryCodeName ?? this.countryCodeName,
        region: region ?? this.region,
        province: province ?? this.province,
        city: city ?? this.city,
        token: token ?? this.token,
        like: like ?? this.like,
        download: download ?? this.download,
        follow: follow ?? this.follow,
        attention: attention ?? this.attention,
        isFriend: isFriend ?? this.isFriend,
        deviceSecurityCode: deviceSecurityCode ?? this.deviceSecurityCode,
        isOldUser: isOldUser ?? this.isOldUser,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nickname'] = nickname;
    map['say'] = say;
    map['avatar'] = avatar;
    map['mobile'] = mobile;
    map['email'] = email;
    map['sex'] = sex;
    map['countryCodeName'] = countryCodeName;
    map['region'] = region;
    map['province'] = province;
    map['city'] = city;
    map['token'] = token;
    map['like'] = like;
    map['download'] = download;
    map['follow'] = follow;
    map['attention'] = attention;
    map['isFriend'] = isFriend;
    map['deviceSecurityCode'] = deviceSecurityCode;
    map['isOldUser'] = isOldUser;
    return map;
  }
}
