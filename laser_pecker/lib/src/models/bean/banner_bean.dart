/// id : 50
/// sourcePath : "https://laserpecker-prod.oss-accelerate.aliyuncs.com/banner/source/20231215-174943.jpg"
/// jumpPath : "https://craftzone.laserpecker.net/"
/// type : 0

class BannerBean {
  BannerBean({
    this.id,
    this.sourcePath,
    this.jumpPath,
    this.type,
  });

  BannerBean.fromJson(dynamic json) {
    id = json['id'];
    sourcePath = json['sourcePath'];
    jumpPath = json['jumpPath'];
    type = json['type'];
  }

  num? id;
  String? sourcePath;
  String? jumpPath;
  num? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sourcePath'] = sourcePath;
    map['jumpPath'] = jumpPath;
    map['type'] = type;
    return map;
  }
}
