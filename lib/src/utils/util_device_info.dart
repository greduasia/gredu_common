import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

///   created               : Aditya Pratama
///   originalFilename      : device_info_util
///   date                  : 11 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///
class DeviceInfo {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  Future<String> uuid() async {
    String id = 'unknown';
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      id = androidInfo.androidId ?? 'unknown';
    } else if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      id = iosInfo.identifierForVendor ?? 'unknown';
    }
    return id;
  }

  Future<String> name() async {
    String name = 'unknown';
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      name = androidInfo.model ?? 'unknown';
    } else if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      name = iosInfo.utsname.machine ?? 'unknown';
    }
    return name;
  }

  Future<String> type() async {
    String type = 'unknown';
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      type = androidInfo.type ?? 'unknown';
    } else if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      type = iosInfo.name ?? 'unknown';
    }
    return type;
  }
}
