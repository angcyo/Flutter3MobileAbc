/// background : "https://laserpecker-prod.oss-cn-hongkong.aliyuncs.com/template/images/Background.png"
/// name : "节日"
/// value : 10
/// pictureType : "Svg"

class MaterialsTypeBean {
  MaterialsTypeBean({
    this.background,
    this.name,
    this.value,
    this.pictureType,
  });

  MaterialsTypeBean.fromJson(dynamic json) {
    background = json['background'];
    name = json['name'];
    value = json['value'];
    pictureType = json['pictureType'];
  }

  String? background;
  String? name;
  num? value;
  String? pictureType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['background'] = background;
    map['name'] = name;
    map['value'] = value;
    map['pictureType'] = pictureType;
    return map;
  }
}
