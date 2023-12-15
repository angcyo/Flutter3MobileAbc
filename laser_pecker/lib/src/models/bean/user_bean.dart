/// id : 18434
/// nickname : "8️⃣🅱️Q了"
/// say : null
/// avatar : "https://laserpecker-prod.oss-cn-hongkong.aliyuncs.com/app/images/7d26dffd-9ca6-8dab-166e-98351a825905.png?w=250&h=250&"
/// mobile : null
/// email : "angcyo@126.com"
/// sex : 2
/// countryCodeName : null
/// region : null
/// province : "中西區"
/// city : "香港"
/// token : null
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
  String? say;
  String? avatar;
  String? mobile;
  String? email;
  num? sex;
  String? countryCodeName;
  String? region;
  String? province;
  String? city;
  String? token;
  int? like;
  int? download;
  int? follow;
  int? attention;
  int? isFriend;
  String? deviceSecurityCode;
  num? isOldUser;

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
