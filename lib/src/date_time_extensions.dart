import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  /// Returns a copy with the overridden (given) attributes.
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

  /// Returns a [String] which represents the date formatted by the given pattern.
  /// Patterns can be found [here](https://api.flutter.dev/flutter/intl/DateFormat-class.html) (intl documentation).
  ///
  /// For example: DateTime(2001, 11, 16).format('dd.MM.yy') --> 16.11.01.
  String format(String pattern) => DateFormat(pattern).format(this);

  /// Returns the amount of days this differs from the given date.
  int _differenceInDays(DateTime other) => DateTime(year, month, day)
      .difference(DateTime(other.year, other.month, other.day))
      .inDays;

  /// Whether the date is today.
  bool get isToday => _differenceInDays(DateTime.now()) == 0;

  /// Whether the date is yesterday.
  bool get isYesterday => _differenceInDays(DateTime.now()) == -1;

  /// Whether the date is tomorrow.
  bool get isTomorrow => _differenceInDays(DateTime.now()) == 1;

  /// Whether the date is a day in the future.
  bool get isFutureDay => _differenceInDays(DateTime.now()) > 0;

  /// Whether the date is on the same day (regardless of the time) as the given date.
  bool isSameDay(DateTime other) => _differenceInDays(other) == 0;

  /// Whether the time of the date is zero/empty.
  bool get timeIsZero =>
      hour == 0 &&
      minute == 0 &&
      second == 0 &&
      millisecond == 0 &&
      microsecond == 0;

  /// Returns a copy with time set to zero/empty.
  DateTime copyWithEmptyTime() =>
      copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
}

extension DateTimeListExtensions on List<DateTime> {
  /// Whether the list contains the given date (regardless of the time).
  bool containsDate(DateTime date) =>
      indexWhere((dateTime) => dateTime.isSameDay(date)) != -1;

  /// Returns the index of the given date (regardless of the time).
  ///
  /// If the list does not contain the given date, -1 is returned.
  int indexOfDate(DateTime date) =>
      indexWhere((dateTime) => dateTime.isSameDay(date));
}
