/// id : 1107
/// status : 1
/// userId : 1
/// nickname : "LaserPecker"
/// province : "中西區"
/// city : "中環"
/// avatar : "https://laserpecker-prod.oss-cn-hongkong.aliyuncs.com/app/images/8915d516-2d6d-254b-35bf-702008b35981.png?w=262&h=256&"
/// countryCodeName : null
/// likeNumber : 105
/// commentNumber : 96
/// downloadNumber : 188
/// mainImage : "[\"https://laserpecker-prod.oss-cn-hongkong.aliyuncs.com/app/images/80daf390-311c-70ee-eefd-3336cae52596.png?w=600&h=250&\"]"
/// attachedImage : null
/// title : "👋Dear LaserPecker Users,\nWelcome to the LP Community!\nHere, you can:\n· Post and exchange creative ideas with your fellow global users.\n· Like, comment, download projects, &/or follow your favorite users. \n· Be selected for our Featured Page by sharing creative, informative, and well shot stories.\n· Participate in our themed giveaway prize challenge events!\nJoin us and Let Creativity Fly! "
/// deviceName : null
/// model : null
/// fulfilSize : null
/// duration : null
/// power : null
/// materials : null
/// resolutionRatio : null
/// depth : null
/// frequency : 1
/// otherTips : null
/// isLike : false
/// isDownload : true
/// isFollow : true
/// isComment : false
/// releaseTime : 1678875988000
/// createTime : "2023-03-15 18:26:28"
/// language : "en"
/// label : null
/// operateStep : null
/// annex : null
/// lineId : null
/// stuffId : null
/// photoId : null
/// cuttingId : null
/// cuttingoLayers : null
/// stuffLayers : null
/// photoLayers : null
/// lineLayers : null
/// constructionName : null
/// tags : null
/// squareMaterialsUseds : null
/// squareSteps : null
/// deviceId : null
/// workLength : null
/// workWidth : null
/// workHeight : null
/// materialInfo : null
/// softwareId : null
/// softwareName : null
/// productionTime : null
/// coverPicture : null
/// synopsis : null
/// postSource : 0
/// postType : 0
/// star : 1
/// views : 0
/// location : null

class DynamicBean {
  DynamicBean({
      this.id, 
      this.status, 
      this.userId, 
      this.nickname, 
      this.province, 
      this.city, 
      this.avatar, 
      this.countryCodeName, 
      this.likeNumber, 
      this.commentNumber, 
      this.downloadNumber, 
      this.mainImage, 
      this.attachedImage, 
      this.title, 
      this.deviceName, 
      this.model, 
      this.fulfilSize, 
      this.duration, 
      this.power, 
      this.materials, 
      this.resolutionRatio, 
      this.depth, 
      this.frequency, 
      this.otherTips, 
      this.isLike, 
      this.isDownload, 
      this.isFollow, 
      this.isComment, 
      this.releaseTime, 
      this.createTime, 
      this.language, 
      this.label, 
      this.operateStep, 
      this.annex, 
      this.lineId, 
      this.stuffId, 
      this.photoId, 
      this.cuttingId, 
      this.cuttingoLayers, 
      this.stuffLayers, 
      this.photoLayers, 
      this.lineLayers, 
      this.constructionName, 
      this.tags, 
      this.squareMaterialsUseds, 
      this.squareSteps, 
      this.deviceId, 
      this.workLength, 
      this.workWidth, 
      this.workHeight, 
      this.materialInfo, 
      this.softwareId, 
      this.softwareName, 
      this.productionTime, 
      this.coverPicture, 
      this.synopsis, 
      this.postSource, 
      this.postType, 
      this.star, 
      this.views, 
      this.location,});

  DynamicBean.fromJson(dynamic json) {
    id = json['id'];
    status = json['status'];
    userId = json['userId'];
    nickname = json['nickname'];
    province = json['province'];
    city = json['city'];
    avatar = json['avatar'];
    countryCodeName = json['countryCodeName'];
    likeNumber = json['likeNumber'];
    commentNumber = json['commentNumber'];
    downloadNumber = json['downloadNumber'];
    mainImage = json['mainImage'];
    attachedImage = json['attachedImage'];
    title = json['title'];
    deviceName = json['deviceName'];
    model = json['model'];
    fulfilSize = json['fulfilSize'];
    duration = json['duration'];
    power = json['power'];
    materials = json['materials'];
    resolutionRatio = json['resolutionRatio'];
    depth = json['depth'];
    frequency = json['frequency'];
    otherTips = json['otherTips'];
    isLike = json['isLike'];
    isDownload = json['isDownload'];
    isFollow = json['isFollow'];
    isComment = json['isComment'];
    releaseTime = json['releaseTime'];
    createTime = json['createTime'];
    language = json['language'];
    label = json['label'];
    operateStep = json['operateStep'];
    annex = json['annex'];
    lineId = json['lineId'];
    stuffId = json['stuffId'];
    photoId = json['photoId'];
    cuttingId = json['cuttingId'];
    cuttingoLayers = json['cuttingoLayers'];
    stuffLayers = json['stuffLayers'];
    photoLayers = json['photoLayers'];
    lineLayers = json['lineLayers'];
    constructionName = json['constructionName'];
    tags = json['tags'];
    squareMaterialsUseds = json['squareMaterialsUseds'];
    squareSteps = json['squareSteps'];
    deviceId = json['deviceId'];
    workLength = json['workLength'];
    workWidth = json['workWidth'];
    workHeight = json['workHeight'];
    materialInfo = json['materialInfo'];
    softwareId = json['softwareId'];
    softwareName = json['softwareName'];
    productionTime = json['productionTime'];
    coverPicture = json['coverPicture'];
    synopsis = json['synopsis'];
    postSource = json['postSource'];
    postType = json['postType'];
    star = json['star'];
    views = json['views'];
    location = json['location'];
  }
  num? id;
  num? status;
  int? userId;
  String? nickname;
  String? province;
  String? city;
  String? avatar;
  dynamic countryCodeName;
  num? likeNumber;
  num? commentNumber;
  num? downloadNumber;
  String? mainImage;
  dynamic attachedImage;
  String? title;
  dynamic deviceName;
  dynamic model;
  dynamic fulfilSize;
  dynamic duration;
  dynamic power;
  dynamic materials;
  dynamic resolutionRatio;
  dynamic depth;
  num? frequency;
  dynamic otherTips;
  bool? isLike;
  bool? isDownload;
  bool? isFollow;
  bool? isComment;
  int? releaseTime;
  String? createTime;
  String? language;
  dynamic label;
  dynamic operateStep;
  dynamic annex;
  dynamic lineId;
  dynamic stuffId;
  dynamic photoId;
  dynamic cuttingId;
  dynamic cuttingoLayers;
  dynamic stuffLayers;
  dynamic photoLayers;
  dynamic lineLayers;
  dynamic constructionName;
  dynamic tags;
  dynamic squareMaterialsUseds;
  dynamic squareSteps;
  dynamic deviceId;
  dynamic workLength;
  dynamic workWidth;
  dynamic workHeight;
  dynamic materialInfo;
  dynamic softwareId;
  dynamic softwareName;
  dynamic productionTime;
  dynamic coverPicture;
  dynamic synopsis;
  num? postSource;
  num? postType;
  num? star;
  num? views;
  dynamic location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['status'] = status;
    map['userId'] = userId;
    map['nickname'] = nickname;
    map['province'] = province;
    map['city'] = city;
    map['avatar'] = avatar;
    map['countryCodeName'] = countryCodeName;
    map['likeNumber'] = likeNumber;
    map['commentNumber'] = commentNumber;
    map['downloadNumber'] = downloadNumber;
    map['mainImage'] = mainImage;
    map['attachedImage'] = attachedImage;
    map['title'] = title;
    map['deviceName'] = deviceName;
    map['model'] = model;
    map['fulfilSize'] = fulfilSize;
    map['duration'] = duration;
    map['power'] = power;
    map['materials'] = materials;
    map['resolutionRatio'] = resolutionRatio;
    map['depth'] = depth;
    map['frequency'] = frequency;
    map['otherTips'] = otherTips;
    map['isLike'] = isLike;
    map['isDownload'] = isDownload;
    map['isFollow'] = isFollow;
    map['isComment'] = isComment;
    map['releaseTime'] = releaseTime;
    map['createTime'] = createTime;
    map['language'] = language;
    map['label'] = label;
    map['operateStep'] = operateStep;
    map['annex'] = annex;
    map['lineId'] = lineId;
    map['stuffId'] = stuffId;
    map['photoId'] = photoId;
    map['cuttingId'] = cuttingId;
    map['cuttingoLayers'] = cuttingoLayers;
    map['stuffLayers'] = stuffLayers;
    map['photoLayers'] = photoLayers;
    map['lineLayers'] = lineLayers;
    map['constructionName'] = constructionName;
    map['tags'] = tags;
    map['squareMaterialsUseds'] = squareMaterialsUseds;
    map['squareSteps'] = squareSteps;
    map['deviceId'] = deviceId;
    map['workLength'] = workLength;
    map['workWidth'] = workWidth;
    map['workHeight'] = workHeight;
    map['materialInfo'] = materialInfo;
    map['softwareId'] = softwareId;
    map['softwareName'] = softwareName;
    map['productionTime'] = productionTime;
    map['coverPicture'] = coverPicture;
    map['synopsis'] = synopsis;
    map['postSource'] = postSource;
    map['postType'] = postType;
    map['star'] = star;
    map['views'] = views;
    map['location'] = location;
    return map;
  }

}