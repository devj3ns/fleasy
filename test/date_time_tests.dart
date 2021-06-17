import 'package:fleasy/fleasy.dart';
import 'package:test/test.dart';

void main() {
  group('Test isToday, isYesterday, isTomorrow, isFutureDay & isSameDay.', () {
    test('Test isToday', () {
      final now = DateTime.now();

      expect(now.isToday, equals(true));
    });

    test('Test isYesterday', () {
      final now = DateTime.now();
      final yesterday = DateTime(now.year, now.month, now.day - 1, now.hour,
          now.minute, now.millisecond, now.microsecond);

      expect(yesterday.isYesterday, equals(true));
    });

    test('Test isTomorrow', () {
      final now = DateTime.now();
      final tomorrow = DateTime(now.year, now.month, now.day + 1, now.hour,
          now.minute, now.millisecond, now.microsecond);

      expect(tomorrow.isTomorrow, equals(true));
    });

    test('Test isFutureDay', () {
      final now = DateTime.now();
      final tomorrow = DateTime(now.year, now.month, now.day + 3, now.hour,
          now.minute, now.millisecond, now.microsecond);

      expect(tomorrow.isFutureDay, equals(true));
    });

    test('Test isSameDay', () {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day, 0, 0, 0, 0);

      expect(now.isSameDay(today), equals(true));
    });
  });

  test('Test copyWith', () {
    final now = DateTime.now();

    final expected = DateTime(
        2001, 11, 16, now.hour, now.minute, now.millisecond, now.microsecond);
    final actual = now.copyWith(year: 2001, month: 11, day: 16);

    expect(actual, equals(expected));
  });

  test('Test timeIsZero', () {
    final dateTime = DateTime(2001, 11, 16, 0, 0, 0, 1);

    expect(dateTime.timeIsZero, equals(false));
  });

  test('Test timeIsZero', () {
    final dateTime = DateTime(2001, 11, 16, 0, 0, 0, 0);

    expect(dateTime.timeIsZero, equals(true));
  });
}
