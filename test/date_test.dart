import 'package:fleasy/fleasy.dart';
import 'package:test/test.dart';

void main() {
  group('today()', () {
    test('is same day as DateTime.now().', () {
      final now = DateTime.now();

      expect(Date.today().isSameDay(now), equals(true));
    });

    test('is not a day in the future.', () {
      expect(Date.today().isFutureDay, equals(false));
    });

    test('time is set to midnight (zero).', () {
      expect(Date.today().timeIsZero, equals(true));
    });
  });

  group('tomorrow()', () {
    test('is same day as DateTime.now() + 1 day.', () {
      final tomorrow = DateTime.now().copyWith(day: DateTime.now().day + 1);

      expect(Date.tomorrow().isSameDay(tomorrow), equals(true));
    });

    test('is a day in the future.', () {
      expect(Date.tomorrow().isFutureDay, equals(true));
    });

    test('time is set to midnight (zero).', () {
      expect(Date.tomorrow().timeIsZero, equals(true));
    });
  });

  group('yesterday()', () {
    test('is same day as DateTime.now() - 1 day.', () {
      final tomorrow = DateTime.now().copyWith(day: DateTime.now().day - 1);

      expect(Date.yesterday().isSameDay(tomorrow), equals(true));
    });

    test('is not a day in the future.', () {
      expect(Date.yesterday().isFutureDay, equals(false));
    });

    test('time is set to midnight (zero).', () {
      expect(Date.yesterday().timeIsZero, equals(true));
    });
  });
}
