/// id : 3
/// key : "wood"
/// name : "木质"
/// picture : "https://laserpecker-prod.oss-accelerate.aliyuncs.com/material/wood.png"

class ChoicesCategoryBean {
  ChoicesCategoryBean({
      this.id, 
      this.key, 
      this.name, 
      this.picture,});

  ChoicesCategoryBean.fromJson(dynamic json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
    picture = json['picture'];
  }
  num? id;
  String? key;
  String? name;
  String? picture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['key'] = key;
    map['name'] = name;
    map['picture'] = picture;
    return map;
  }

}