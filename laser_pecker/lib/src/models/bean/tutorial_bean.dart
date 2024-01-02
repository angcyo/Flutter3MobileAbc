/// title : "L2如何安装电动支架和机器"
/// picturePath : "https://laserpecker-prod.oss-accelerate.aliyuncs.com/course/1.jpg"
/// videoPath : "https://www.bilibili.com/video/BV1KL411H7nd?spm_id_from=333.999.0.0&vd_source=c44ecda7593f95edde1ed4b319cacc91"
/// directory : "L2"
/// content : null
/// subtitleId : 1

class TutorialBean {
  TutorialBean({
      this.title, 
      this.picturePath, 
      this.videoPath, 
      this.directory, 
      this.content, 
      this.subtitleId,});

  TutorialBean.fromJson(dynamic json) {
    title = json['title'];
    picturePath = json['picturePath'];
    videoPath = json['videoPath'];
    directory = json['directory'];
    content = json['content'];
    subtitleId = json['subtitleId'];
  }
  String? title;
  String? picturePath;
  String? videoPath;
  String? directory;
  dynamic content;
  num? subtitleId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['picturePath'] = picturePath;
    map['videoPath'] = videoPath;
    map['directory'] = directory;
    map['content'] = content;
    map['subtitleId'] = subtitleId;
    return map;
  }

}