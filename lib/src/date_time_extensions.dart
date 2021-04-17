import 'package:intl/intl.dart';

extension DateTimeUtils on DateTime {
  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  int _differenceInDays(DateTime other) => DateTime(year, month, day)
      .difference(DateTime(other.year, other.month, other.day))
      .inDays;

  bool get isToday => _differenceInDays(DateTime.now()) == 0;

  bool get isYesterday => _differenceInDays(DateTime.now()) == -1;

  bool get isTomorrow => _differenceInDays(DateTime.now()) == 1;

  bool get isFutureDay => _differenceInDays(DateTime.now()) > 0;

  bool isSameDay(DateTime other) => _differenceInDays(other) == 0;

  bool get timeIsZero =>
      hour == 0 &&
      minute == 0 &&
      second == 0 &&
      millisecond == 0 &&
      microsecond == 0;

  DateTime copyWithEmptyTime() =>
      copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);

  /// Returns a String which represents the date formatted by the given pattern.
  ///
  /// For example: .format('dd.MM.yy') --> 17.04.21
  String format(String pattern) => DateFormat(pattern).format(this);
}

extension DateTimeListUtils on List<DateTime> {
  /// Returns true if the list contains a dateTime which is on
  /// the same date (regardless of the time) as the given one.
  bool containsDate(DateTime date) =>
      indexWhere((dateTime) => dateTime.isSameDay(date)) != -1;

  /// Returns the index of the given date in the list (regardless of the time).
  /// If the list does not contain the given date -1 is returned.
  int indexOfDate(DateTime date) =>
      indexWhere((dateTime) => dateTime.isSameDay(date));
}
