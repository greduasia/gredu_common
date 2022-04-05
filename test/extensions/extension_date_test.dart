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
    test('firstDayInMonth Sept 30 2018', () {
      final lastDay = DateTime(2018, 9, 30).firstDayOfMonth;
      final expected = DateTime(2018, 9);
      expect(lastDay, expected);
    });

    test('lastDayInMonth', () {
      final lastDay = DateTime(2017, 3).lastDayOfMonth;
      final expected = DateTime(2017, 3, 31);
      expect(lastDay, expected);
    });

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

    group('daysInMonth', () {
      void _assertDaysInMonth(
        DateTime date, {
        required DateTime first,
        required DateTime last,
        required int length,
      }) {
        final days = date.daysInMonth;
        expect(days.first, first);
        expect(days.last, last);
        expect(days.length, length);
      }

      test('9 30 2018', () {
        _assertDaysInMonth(
          DateTime(2018, 9, 30),
          first: DateTime(2018, 8, 26),
          last: DateTime(2018, 10, 6),
          length: 42,
        );
      });
      test('8 30 2018', () {
        _assertDaysInMonth(
          DateTime(2018, 8, 8),
          first: DateTime(2018, 7, 29),
          last: DateTime(2018, 9),
          length: 35,
        );
      });
    });

    test('isSameWeek', () {
      expect(DateUtils.isSameWeek(DateTime(2017, 3, 4), DateTime(2017, 3, 5)), false);
      expect(DateUtils.isSameWeek(DateTime(2017, 3, 5), DateTime(2017, 3, 6)), true);
      expect(
        DateUtils.isSameWeek(DateTime(2017, 2, 26), DateTime(2017, 3, 4)),
        true,
      );
      expect(DateUtils.isSameWeek(DateTime(2017, 3, 4), DateTime(2017, 3, 10)), false);
      expect(DateUtils.isSameWeek(DateTime(2017, 3, 3), DateTime(2017, 3, 10)), false);
      expect(DateUtils.isSameWeek(DateTime(2017, 3, 10), DateTime(2017, 3, 10)), true);
      expect(
        DateUtils.isSameWeek(DateTime(2018, 3, 29, 12), DateTime(2018, 3, 22, 12)),
        false,
      );
      expect(
        DateUtils.isSameWeek(DateTime(2018, 3, 6, 12), DateTime(2018, 3, 13, 12)),
        false,
      );
    });

    final List<DateTime> testDates = [];
    late DateTime today;

    setUp(() {
      today = DateTime.now();
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

    for (var i = 0; i < 7; i++) {
      test('Utils.firstDayOfWeek', () {
        expect(testDates[i].firstDayOfWeek.day, testDates[0].day);
      });
    }

    for (var i = 0; i < 7; i++) {
      test('Utils.lastDayOfWeek', () {
        expect(
          testDates[i].lastDayOfWeek.day,
          testDates[6].add(Duration(days: 1)).day,
        );
      });
    }

    // Test 100 Days for the right length
    for (var i = 0; i < 100; i++) {
      test('datesInRange()', () {
        final date = DateTime.now();
        date.add(Duration(days: i));

        final firstDayOfCurrentWeek = today.firstDayOfWeek;
        final lastDayOfCurrentWeek = today.lastDayOfWeek;

        expect(
          DateUtils.daysInRange(firstDayOfCurrentWeek, lastDayOfCurrentWeek).toList().length,
          7,
        );
      });
    }
  });
}
