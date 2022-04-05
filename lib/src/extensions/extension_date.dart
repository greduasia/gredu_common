import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../gredu_common.dart';

///   created               : Aditya Pratama
///   originalFilename      : extension_date
///   date                  : 22 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///    scope                : dateTime <-> string
///

extension StringToDateExtension on String {
  /// Convert String to Date
  /// ---
  /// @param : format (optional)
  DateTime toDateEx({
    String format = 'yyyy-MM-ddTHH:mm:ssZ',
  }) {
    initializeDateFormatting('in');
    const locale = 'in';
    return DateFormat(format, locale).parse(this);
  }
}

extension DateToStringExtension on DateTime {
  /// Date to String
  /// ---
  /// @param : format (optional)
  String toStringEx({
    String format = 'yyyy-MM-ddTHH:mm:ssZ',
  }) {
    initializeDateFormatting('in');
    const locale = 'in';
    final output = DateFormat(format, locale).format(this);
    return output;
  }
}

extension StringToDateFormatterExtension on String {
  /// formatPastOrToday
  /// ---
  /// require : String (date)
  /// return : if past  -> dd MMM => 23 Jan
  /// return : if today -> hh:mm  => 18:20
  /// return : if yesterday -> hh:mm  => Kemarin
  String formatPastOrToday({
    String format = 'yyyy-MM-ddTHH:mm:ssZ',
  }) {
    String output;
    final resDate = toDateEx(format: format).toStringEx(format: 'dd MMM');
    final today = DateTime.now().toStringEx(format: 'dd MMM');
    final yesterday = (DateTime.now().subtract(1.days)).toStringEx(format: 'dd MMM');

    if (resDate == today) {
      output = (toDateEx(format: format).add(7.hours)).toStringEx(format: 'HH:mm');
    } else if (resDate == yesterday) {
      output = 'Kemarin';
    } else {
      output = resDate;
    }
    return output;
  }

  String formatRemainingTime({
    String format = 'yyyy-MM-ddTHH:mm:ssZ',
  }) {
    String output;
    final resDateTime = toDateEx(format: format).add(7.hours);
    final resDate = resDateTime.toStringEx(format: 'dd MMM');
    final resMinute = resDateTime.toStringEx(format: 'mm');
    final resHours = resDateTime.toStringEx(format: 'HH');
    final today = DateTime.now().toStringEx(format: 'dd MMM');
    final yesterday = (DateTime.now().subtract(1.days)).toStringEx(format: 'dd MMM');

    if (resDate == today) {
      if (resDateTime.hour < DateTime.now().hour) {
        output = '${resMinute}m';
      } else {
        output = '${resHours}j';
      }
    } else if (resDate == yesterday) {
      output = 'Kemarin';
    } else if (resDateTime.day < (DateTime.now().add(6.days)).day) {
      output = resDateTime.toStringEx(format: 'E');
    } else {
      output = resDateTime.toStringEx(format: 'dd/MM/yy');
    }

    return output;
  }

  String formatDate({String format = 'yyyy-MM-ddTHH:mm:ssZ', String to = 'dd MMM yyyy', int addHours = 0}) {
    String output;
    try {
      output = (toDateEx(format: format).add(addHours.hours)).toStringEx(format: to);
    } catch (e) {
      logE(e.toString());
      output = 'error';
    }
    return output;
  }

  String fromIntToDate() {
    initializeDateFormatting('in');
    const locale = 'in';
    final df = DateFormat('dd MMMM yyyy', locale);
    final item = toString().substring(0, 10);
    return df.format(DateTime.fromMillisecondsSinceEpoch(int.parse(item) * 1000));
  }
}

extension TimeOfDayExtension on TimeOfDay {
  bool compareTo(TimeOfDay end, TimeOfDay start2, TimeOfDay end2) {
    // if((this.hour <= end2.hour && this.minute <= end2.minute ) && (start2.hour <= end.hour  && start2.minute <= end.minute)) {
    if (hour <= end2.hour && start2.hour < hour) {
      return true;
    }
    return false;
  }
}

extension DateUtils on DateTime {
  bool get isToday {
    final nowDate = DateTime.now();
    return year == nowDate.year && month == nowDate.month && day == nowDate.day;
  }

  bool get isYesterday {
    final nowDate = DateTime.now();
    return year == nowDate.year && month == nowDate.month && day == nowDate.day - 1;
  }

  bool get isTomorrow {
    final nowDate = DateTime.now();
    return year == nowDate.year && month == nowDate.month && day == nowDate.day + 1;
  }

  /// The list of days in a given month
  List<DateTime> get daysInMonth {
    final first = firstDayOfMonth;
    final daysBefore = first.weekday;
    final firstToDisplay = first.subtract(Duration(days: daysBefore));
    final last = lastDayOfMonth;

    var daysAfter = 7 - last.weekday;

    // If the last day is sunday (7) the entire week must be rendered
    if (daysAfter == 0) {
      daysAfter = 7;
    }

    final lastToDisplay = last.add(Duration(days: daysAfter));
    return daysInRange(firstToDisplay, lastToDisplay).toList();
  }

  bool get isFirstDayOfMonth => isSameDay(firstDayOfMonth, this);

  bool get isLastDayOfMonth => isSameDay(lastDayOfMonth, this);

  DateTime get firstDayOfMonth => DateTime(year, month);

  DateTime get firstDayOfWeek {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
    final day = DateTime.utc(year, month, this.day, 12);

    /// Weekday is on a 1-7 scale Monday - Sunday,
    /// This Calendar works from Sunday - Monday
    final decreaseNum = day.weekday % 7;
    return subtract(Duration(days: decreaseNum));
  }

  DateTime get lastDayOfWeek {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
    final day = DateTime.utc(year, month, this.day, 12);

    /// Weekday is on a 1-7 scale Monday - Sunday,
    /// This Calendar's Week starts on Sunday
    final increaseNum = day.weekday % 7;
    return day.add(Duration(days: 7 - increaseNum));
  }

  /// The last day of a given month
  DateTime get lastDayOfMonth {
    final beginningNextMonth = (month < 12) ? DateTime(year, month + 1) : DateTime(year + 1);
    return beginningNextMonth.subtract(Duration(days: 1));
  }

  DateTime get previousMonth {
    var year = this.year;
    var month = this.month;
    if (month == 1) {
      year--;
      month = 12;
    } else {
      month--;
    }
    return DateTime(year, month);
  }

  DateTime get nextMonth {
    var year = this.year;
    var month = this.month;

    if (month == 12) {
      year++;
      month = 1;
    } else {
      month++;
    }
    return DateTime(year, month);
  }

  DateTime get previousWeek => subtract(Duration(days: 7));

  DateTime get nextWeek => add(Duration(days: 7));

  /// Returns a [DateTime] for each day the given range.
  ///
  /// [start] inclusive
  /// [end] exclusive
  static Iterable<DateTime> daysInRange(DateTime start, DateTime end) sync* {
    var i = start;
    var offset = start.timeZoneOffset;
    while (i.isBefore(end)) {
      yield i;
      i = i.add(Duration(days: 1));
      final timeZoneDiff = i.timeZoneOffset - offset;
      if (timeZoneDiff.inSeconds != 0) {
        offset = i.timeZoneOffset;
        i = i.subtract(Duration(seconds: timeZoneDiff.inSeconds));
      }
    }
  }

  static bool isSameWeek(DateTime a, DateTime b) {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
    a = DateTime.utc(a.year, a.month, a.day);
    b = DateTime.utc(b.year, b.month, b.day);

    final diff = a.toUtc().difference(b.toUtc()).inDays;
    if (diff.abs() >= 7) {
      return false;
    }

    final min = a.isBefore(b) ? a : b;
    final max = a.isBefore(b) ? b : a;
    final result = max.weekday % 7 - min.weekday % 7 >= 0;
    return result;
  }

  /// Whether or not two times are on the same day.
  static bool isSameDay(DateTime a, DateTime b) => a.year == b.year && a.month == b.month && a.day == b.day;
}
