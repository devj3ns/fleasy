import 'date_time_extensions.dart';

class Date {
  /// DateTime.now() without time
  static DateTime today() =>
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  /// DateTime of tomorrow (without time)
  static DateTime tomorrow() => today().copyWith(day: today().day + 1);

  /// DateTime of yesterday (without time)
  static DateTime yesterday() => today().copyWith(day: today().day - 1);
}
