import 'package:flutter_test/flutter_test.dart';
import 'package:gredu_common/src/core/control_flow.dart';

void main() {
  test('Should run the block code and return the context', () {
    const value = 5;
    var ranAlso = false;

    final returnedValue = value.also((it) {
      ranAlso = true;
    });

    expect(value, returnedValue);
    expect(ranAlso, true);
  });
}
