import 'package:flutter_test/flutter_test.dart';
import 'package:gredu_common/gredu_common.dart';

void main() {
  test(
    'Should return the value if the value is not null and the block returns true',
    () {
      const value = 10;
      final number = value.takeIf((it) => it.isEven);

      expect(number, value);
    },
  );

  test(
    'Should return null if the value is not null but the block returns false',
    () {
      const value = 9;
      final number = value.takeIf((it) => it.isEven);

      expect(number, null);
    },
  );

  test(
    'Should return null if the value is null and the block should not be called',
    () {
      int? value;
      var isCalled = false;
      final number = value.takeIf((it) {
        isCalled = true;
        return it.isEven;
      });

      expect(number, null);
      expect(isCalled, false);
    },
  );
}
