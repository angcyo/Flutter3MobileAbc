import 'package:laser_pecker/assets_generated/assets.gen.dart';
import 'package:laser_pecker/laser_pecker.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2023/12/10
///

class DeviceHelper {
  /// [deviceName] 设备的蓝牙地址
  static String getDeviceAssetsPngKey(String? deviceName) {
    var devicePngKey = Assets.png.deviceL1.keyName;
    if (deviceName == null) {
    } else if (deviceName.startsWith('$kProductPrefix-CI') ||
        deviceName.startsWith('LX1')) {
      devicePngKey = Assets.png.deviceC1.keyName;
    } else if (deviceName.startsWith('$kProductPrefix-V') ||
        deviceName.startsWith('LP5')) {
      devicePngKey = Assets.png.deviceL5.keyName;
    } else if (deviceName.startsWith('$kProductPrefix-L4') ||
        deviceName.startsWith('LP4')) {
      devicePngKey = Assets.png.deviceL4.keyName;
    } else if (deviceName.startsWith('$kProductPrefix-L3') ||
        deviceName.startsWith('LP3')) {
      devicePngKey = Assets.png.deviceL3.keyName;
    } else if (deviceName.startsWith('$kProductPrefix-L2') ||
        deviceName.startsWith('LP2')) {
      devicePngKey = Assets.png.deviceL2.keyName;
    }
    return devicePngKey;
  }
}
