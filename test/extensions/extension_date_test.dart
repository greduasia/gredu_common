// ignore_for_file: missing_whitespace_between_adjacent_strings, noop_primitive_operations

import 'package:flutter_test/flutter_test.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:gredu_common/src/extensions/extension_date.dart';

///   created               : Aditya Pratama
///   originalFilename      : extension_date
///   date                  : 22 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   scope                : dateTime <-> string
///

void main() {

  group('Adit Extension Date Additional Test', () {

    // test untuk konsistensi nilai. pastikan dimulai dari 1 = januari
    test('parsing date from server (string) -> (date) and matching month', () {
      const mockData = '2022-01-10T05:20:34Z'; // yyyy-MM-ddTHH:mm:ssZ
      final convert = mockData.toDateEx().month;
      expect(DateTime.january, convert); // 1
    });

    test('parsing date from server (date) -> (string) and reformat', () {
      const mockData = '2022-03-10T05:20:34Z'; // yyyy-MM-ddTHH:mm:ssZ
      final convert = mockData.toDateEx().toStringEx(format: 'dd MMM yyyy');
      expect('10 Mar 2022', convert); // 10 Mar 2022
    });


    test(
        ''
        'parsing date from server and check isToday, yesterday, or when?'
        'if today -> HH:mm'
        'if yesterday -> Kemarin'
        'else -> print dd MMM'
        '', () {

      const mockData = '2022-02-04T12:20:34Z'; // yyyy-MM-ddTHH:mm:ssZ
      final convert = mockData.formatPastOrToday();

      if (convert.length == 5) {
        expect('12:20', convert); // 12:20 (GMT+7)
      } else if (convert == 'Kemarin') {
        expect('Kemarin', convert);
      } else {
        expect('04 Feb', convert);
      }
    });
  });

  group('Utils Tests', () {
    test('daysInMonth', () {
      final days = DateTime(2017, 3).daysInMonth;
      expect(days, hasLength(35));
    });

    test('daysInMonthWithTimeChangeFallBack', () {
      final days = DateTime(2017, 11).daysInMonth;
      expect(days, hasLength(35));
    });

    test('daysInMonthWithTimeChangeSpringForward', () {
      final days = DateTime(2018, 4).daysInMonth;
      expect(days, hasLength(42));
    });




    final List<DateTime> testDates = [];

    setUp(() {
      // A full Calendar Week
      testDates
        ..add(DateTime(2018, 3, 4))
        ..add(DateTime(2018, 3, 5))
        ..add(DateTime(2018, 3, 6))
        ..add(DateTime(2018, 3, 7))
        ..add(DateTime(2018, 3, 8))
        ..add(DateTime(2018, 3, 9))
        ..add(DateTime(2018, 3, 10));
    });
  });
}
