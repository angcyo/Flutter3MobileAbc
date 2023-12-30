/// id : 10003
/// type : 1
/// englishName : "Animal"
/// jpName : "動物"
/// koName : "동물"
/// twName : "動物"
/// deName : "Tier"
/// esName : "Animal"
/// frName : "Animal"
/// typeName : "动物"
/// sourcePath : "https://laserpecker-prod.oss-accelerate.aliyuncs.com/template/images/dog-1517090.png"
/// background : ""
/// isPay : 0
/// isSequence : 0
/// deviceType : 0
/// bundleId : null

class MaterialsBean {
  MaterialsBean({
    this.id,
    this.type,
    this.englishName,
    this.jpName,
    this.koName,
    this.twName,
    this.deName,
    this.esName,
    this.frName,
    this.typeName,
    this.sourcePath,
    this.background,
    this.isPay,
    this.isSequence,
    this.deviceType,
    this.bundleId,
  });

  MaterialsBean.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    englishName = json['englishName'];
    jpName = json['jpName'];
    koName = json['koName'];
    twName = json['twName'];
    deName = json['deName'];
    esName = json['esName'];
    frName = json['frName'];
    typeName = json['typeName'];
    sourcePath = json['sourcePath'];
    background = json['background'];
    isPay = json['isPay'];
    isSequence = json['isSequence'];
    deviceType = json['deviceType'];
    bundleId = json['bundleId'];
  }

  num? id;
  num? type;
  String? englishName;
  String? jpName;
  String? koName;
  String? twName;
  String? deName;
  String? esName;
  String? frName;
  String? typeName;
  String? sourcePath;
  String? background;
  num? isPay;
  num? isSequence;
  num? deviceType;
  dynamic bundleId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['englishName'] = englishName;
    map['jpName'] = jpName;
    map['koName'] = koName;
    map['twName'] = twName;
    map['deName'] = deName;
    map['esName'] = esName;
    map['frName'] = frName;
    map['typeName'] = typeName;
    map['sourcePath'] = sourcePath;
    map['background'] = background;
    map['isPay'] = isPay;
    map['isSequence'] = isSequence;
    map['deviceType'] = deviceType;
    map['bundleId'] = bundleId;
    return map;
  }
}
