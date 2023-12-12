/// id : 329
/// isFriend : 0
/// fansId : 13888
/// userId : 18434
/// avatar : "http://laserpecker-prod.oss-cn-hongkong.aliyuncs.com/pecker/avatar/default_avatar.png"
/// nickname : "plwmttqh"
/// postsNumber : 0
/// fansNumber : 0

class ListUserBean {
  ListUserBean({
    this.id,
    this.isFriend,
    this.fansId,
    this.userId,
    this.avatar,
    this.nickname,
    this.postsNumber,
    this.fansNumber,
  });

  ListUserBean.fromJson(dynamic json) {
    id = json['id'];
    isFriend = json['isFriend'];
    fansId = json['fansId'];
    userId = json['userId'];
    avatar = json['avatar'];
    nickname = json['nickname'];
    postsNumber = json['postsNumber'];
    fansNumber = json['fansNumber'];
  }

  int? id;
  num? isFriend;
  num? fansId;
  num? userId;
  String? avatar;
  String? nickname;
  num? postsNumber;
  num? fansNumber;

  /// 是否取消了关注
  bool? isCancelAttention = false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['isFriend'] = isFriend;
    map['fansId'] = fansId;
    map['userId'] = userId;
    map['avatar'] = avatar;
    map['nickname'] = nickname;
    map['postsNumber'] = postsNumber;
    map['fansNumber'] = fansNumber;
    return map;
  }
}
