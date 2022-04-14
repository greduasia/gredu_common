import 'package:flutter_test/flutter_test.dart';
import 'package:gredu_common/gredu_common.dart';

Future<void> main() async {

  await ExLog.init();

  /// Matcher Type:
  /// isEmpty
  /// isNotEmpty
  /// isNull
  /// isNotNull
  /// isTrue
  /// isFalse
  /// isNaN
  /// isNotNaN
  /// anything
  /// returnsNormally

  group('Check log(logDebug)', () {

    setUp(() async {
      ExLog.init();
    });

    test('check if the `log` is working normally', () {
      expect(() => log('this is a message'), returnsNormally);
    });

  });

  group('Check print(logDebug)', () {

    setUp(() async {
      ExLog.init();
    });

    test('check if the `print` is working normally', () {
      expect(() => log('this is a message'), returnsNormally);
    });

  });

  group('Check logD(logDebug)', () {

    setUp(() async {
      ExLog.init();
    });

    test('check if the `logD` is working normally', () {
      expect(() => logD('this is a message'), returnsNormally);
    });

  });

  group('Check logE(logError)', () {

    setUp(() async {
      ExLog.init();
    });

    test('check if the `logE` is working normally', () {
      expect(() => logE('this is a message'), returnsNormally);
    });

  });
  
  group('Check logI(logInfo)', () {

    setUp(() async {
      ExLog.init();
    });

    test('check if the `logI` is working normally', () {
      expect(() => logI('this is a message'), returnsNormally);
    });

  });
    
  group('Check logW(logWarning)', () {

    setUp(() async {
      ExLog.init();
    });

    test('check if the `logW` is working normally', () {
      expect(() => logW('this is a message'), returnsNormally);
    });

  });
  
}
