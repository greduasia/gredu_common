import 'package:device_info_plus_platform_interface/method_channel/method_channel_device_info.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

///   created               : Aditya Pratama
///   originalFilename      : util_device_info_test
///   date                  : 11 Apr 2022
///   —————————————————————————————————————————————————————————————————————————————
///   scope                : util_device_info
///

const uuidForAndroid = 'b7ba36f5-f0d4-49a4-a5d2-979cf1e5b1d7';
const uuidForIOS = 'b7ba36f5-f0d4-49a4-a5d2-979cf1e5b123';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('$MethodChannelDeviceInfo', () {
    late MethodChannelDeviceInfo methodChannelDeviceInfo;

    // —————————————————————————————————————————————————————————————————————————————
    // # setup mock (phone model) .
    // —————————————————————————————————————————————————————————————————————————————
    setUp(() async {
      methodChannelDeviceInfo = MethodChannelDeviceInfo();

      methodChannelDeviceInfo.channel.setMockMethodCallHandler((MethodCall methodCall) async {
        switch (methodCall.method) {
          case 'getAndroidDeviceInfo':
            return {
              'androidId': uuidForAndroid,
              'brand': 'Adit Android Phone',
            };
          case 'getIosDeviceInfo':
            return {
              'identifierForVendor': uuidForIOS,
              'name': 'Adit iPhone 10',
            };
          case 'getMacosDeviceInfo':
            return {
              'arch': '',
              'model': 'MacBookPro',
              'activeCPUs': 0,
              'memorySize': 0,
              'cpuFrequency': 0,
              'hostName': '',
              'osRelease': '',
              'computerName': '',
              'kernelVersion': '',
              'systemGUID': null,
            };
          default:
            return null;
        }
      });
    });

    // ANDROID —————————————————————————————————————————————————————————————————————————————
    test('androidInfo Brand', () async {
      final result = await methodChannelDeviceInfo.androidInfo();
      expect(result.brand, 'Google');
    });

    test('androidInfo UUID', () async {
      final result = await methodChannelDeviceInfo.androidInfo();
      expect(result.androidId, uuidForAndroid);
    });

    //IOS  —————————————————————————————————————————————————————————————————————————————
    test('iosInfo', () async {
      final result = await methodChannelDeviceInfo.iosInfo();
      expect(result.name, 'iPhone 10');
    });

    test('iosInfo UUID', () async {
      final result = await methodChannelDeviceInfo.iosInfo();
      expect(result.identifierForVendor, uuidForIOS);
    });
  });
}
