import 'package:fleasy/fleasy.dart';

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
