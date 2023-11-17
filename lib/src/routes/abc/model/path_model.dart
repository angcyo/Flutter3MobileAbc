import 'dart:io';

import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/17
///

///
/// ```
/// TargetPlatform.android
///   getTemporaryDirectory->/data/user/0/com.angcyo.flutter3_abc/cache
///   getApplicationSupportDirectory->/data/user/0/com.angcyo.flutter3_abc/files
///   getLibraryDirectory->null
///   getApplicationDocumentsDirectory->null
///   getApplicationCacheDirectory->null
///   getExternalStorageDirectory->/storage/emulated/0/Android/data/com.angcyo.flutter3_abc/files
///   getDownloadsDirectory->/storage/emulated/0/Android/data/com.angcyo.flutter3_abc/files/downloads
///   current->/
///   systemTemp->/data/user/0/com.angcyo.flutter3_abc/code_cache
/// ```
class PathViewModel extends ViewModel {
  final MutableLiveData<Map<String, Directory?>?> pathMap = vmData();

  Future<void> loadPath() async {
    Directory? temporaryDirectory;
    try {
      temporaryDirectory = await getTemporaryDirectory();
    } catch (e) {
      l.e(e);
    }
    Directory? applicationSupportDirectory;
    try {
      applicationSupportDirectory = await getApplicationSupportDirectory();
    } catch (e) {
      l.e(e);
    }
    Directory? libraryDirectory;
    try {
      //Unsupported operation: getLibraryPath is not supported on Android
      libraryDirectory = await getLibraryDirectory();
    } catch (e) {
      l.e(e);
    }
    Directory? applicationDocumentsDirectory;
    try {
      await getApplicationDocumentsDirectory();
    } catch (e) {
      l.e(e);
    }
    Directory? applicationCacheDirectory;
    try {
      await getApplicationCacheDirectory();
    } catch (e) {
      l.e(e);
    }
    Directory? externalStorageDirectory;
    try {
      externalStorageDirectory = await getExternalStorageDirectory();
    } catch (e) {
      l.e(e);
    }
    Directory? downloadsDirectory;
    try {
      downloadsDirectory = await getDownloadsDirectory();
    } catch (e) {
      l.e(e);
    }

    pathMap.value = {
      'getTemporaryDirectory': temporaryDirectory ?? Directory('null'),
      'getApplicationSupportDirectory':
          applicationSupportDirectory ?? Directory('null'),
      'getLibraryDirectory': libraryDirectory ?? Directory('null'),
      'getApplicationDocumentsDirectory':
          applicationDocumentsDirectory ?? Directory('null'),
      'getApplicationCacheDirectory':
          applicationCacheDirectory ?? Directory('null'),
      'getExternalStorageDirectory':
          externalStorageDirectory ?? Directory('null'),
      //'getExternalCacheDirectories': await getExternalCacheDirectories()?? Directory('null'),
      'getDownloadsDirectory': downloadsDirectory ?? Directory('null'),
      'current': Directory.current,
      'systemTemp': Directory.systemTemp,
    };
  }
}
