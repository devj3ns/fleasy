import 'date_time_extensions.dart';

/// A helper class for generating [DateTime] objects without a time easily.
class Date {
  /// DateTime.now() without time (time set to zero).
  static DateTime today() =>
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  /// The [DateTime] of tomorrow (without time (time set to zero)).
  static DateTime tomorrow() => today().copyWith(day: today().day + 1);

  /// The [DateTime] of yesterday (without time (time set to zero)).
  static DateTime yesterday() => today().copyWith(day: today().day - 1);
}
