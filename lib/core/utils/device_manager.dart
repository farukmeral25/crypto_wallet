import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  AndroidDeviceInfo? _androidDeviceInfo;
  IosDeviceInfo? _iosDeviceInfo;

  DeviceInfo._android(this._androidDeviceInfo);

  DeviceInfo._iOS(this._iosDeviceInfo);

  static Future<DeviceInfo> createDeviceInfo() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await DeviceInfoPlugin().androidInfo;

      return DeviceInfo._android(androidDeviceInfo);
    } else {
      IosDeviceInfo iosDeviceInfo = await DeviceInfoPlugin().iosInfo;

      return DeviceInfo._iOS(iosDeviceInfo);
    }
  }

  String? get deviceId => Platform.isAndroid ? _androidDeviceInfo?.id : _iosDeviceInfo?.identifierForVendor;
}
