import 'package:flutter_test/flutter_test.dart';
import 'package:gredu_common/gredu_common.dart';

void main() {
  test('Should return the value of the given block', () {
    final value = 5.let((it) => it * 2);

    expect(value, 10);
  });

  test('Should return null if the variable is null', () {
    int? value;
    final result = value?.let((it) => it * 2);

    expect(result, null);
  });
}
