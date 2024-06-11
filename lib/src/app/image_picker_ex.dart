import 'package:image_picker/image_picker.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/06/11
///
/// 使用[ImagePicker]获取图片
/// [ImageSource.gallery] 相册
/// [ImageSource.camera] 拍照
Future<XFile?> pickerImage({ImageSource source = ImageSource.gallery}) async {
  final ImagePicker picker = ImagePicker();
  // Pick an image.
  final XFile? image = await picker.pickImage(source: source);
  return image;
}

/// Pick a video.
Future<XFile?> pickerVideo({ImageSource source = ImageSource.gallery}) async {
  final ImagePicker picker = ImagePicker();
  final XFile? video = await picker.pickVideo(source: source);
  return video;
}

/// 使用[ImagePicker]获取一个图片/视频
Future<XFile?> pickerMedia({int? limit}) async {
  final ImagePicker picker = ImagePicker();
  final XFile? media = await picker.pickMedia();
  return media;
}

/// 使用[ImagePicker]获取多个图片/视频
Future<List<XFile>> pickerMultipleMedia({int? limit}) async {
  final ImagePicker picker = ImagePicker();
  final List<XFile> medias = await picker.pickMultipleMedia(limit: limit);
  return medias;
}

/// 使用[ImagePicker]获取多个图片
Future<List<XFile>> pickMultiImage({int? limit}) async {
  final ImagePicker picker = ImagePicker();
  final List<XFile> medias = await picker.pickMultiImage(limit: limit);
  return medias;
}
