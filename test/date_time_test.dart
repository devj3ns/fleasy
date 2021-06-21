import 'package:fleasy/fleasy.dart';
import 'package:test/test.dart';

void main() {
  group('isToday', () {
    test('is true on DateTime.now().', () {
      final now = DateTime.now();

      expect(now.isToday, equals(true));
    });

    test('is false on Date.tomorrow().', () {
      final tomorrow = Date.tomorrow();

      expect(tomorrow.isToday, equals(false));
    });

    test('is false on Date.yesterday().', () {
      final yesterday = Date.yesterday();

      expect(yesterday.isToday, equals(false));
    });
  });

  group('isTomorrow', () {
    test('is false on DateTime.now().', () {
      final now = DateTime.now();

      expect(now.isTomorrow, equals(false));
    });

    test('is true on Date.tomorrow().', () {
      final tomorrow = Date.tomorrow();

      expect(tomorrow.isTomorrow, equals(true));
    });

    test('is false on Date.yesterday().', () {
      final yesterday = Date.yesterday();

      expect(yesterday.isTomorrow, equals(false));
    });
  });

  group('isYesterday', () {
    test('is false on DateTime.now().', () {
      final now = DateTime.now();

      expect(now.isYesterday, equals(false));
    });

    test('is false on Date.tomorrow().', () {
      final tomorrow = Date.tomorrow();

      expect(tomorrow.isYesterday, equals(false));
    });

    test('is true on Date.yesterday().', () {
      final yesterday = Date.yesterday();

      expect(yesterday.isYesterday, equals(true));
    });
  });

  group('isFutureDay', () {
    test('is false on DateTime.now().', () {
      final now = DateTime.now();

      expect(now.isFutureDay, equals(false));
    });

    test('is true on Date.tomorrow().', () {
      final tomorrow = Date.tomorrow();

      expect(tomorrow.isFutureDay, equals(true));
    });

    test('is false on Date.yesterday().', () {
      final yesterday = Date.yesterday();

      expect(yesterday.isFutureDay, equals(false));
    });
  });

  group('isSameDay', () {
    test('is true on DateTime.now() and Date.today().', () {
      final now = DateTime.now();
      final today = Date.today();

      expect(now.isSameDay(today), equals(true));
    });

    test('is false on DateTime.now() and Date.yesterday().', () {
      final now = DateTime.now();
      final yesterday = Date.yesterday();

      expect(now.isSameDay(yesterday), equals(false));
    });

    test('is false on DateTime.now() and Date.tomorrow().', () {
      final now = DateTime.now();
      final tomorrow = Date.tomorrow();

      expect(now.isSameDay(tomorrow), equals(false));
    });
  });

  group('copyWith', () {
    test('returns correct DateTime object.', () {
      final today = Date.today();

      final actual = today.copyWith(year: 2050);
      final expected = DateTime(2050, today.month, today.day);

      expect(actual, equals(expected));
    });
  });

  group('copyWithEmptyTime', () {
    test('returns correct DateTime object.', () {
      final now = DateTime.now();

      final actual = now.copyWithEmptyTime();
      final expected = DateTime(now.year, now.month, now.day, 0, 0, 0, 0, 0);

      expect(actual, equals(expected));
    });
  });

  group('timeIsZero', () {
    test('is false on non zero time.', () {
      final dateTime = DateTime(2001, 11, 16, 0, 0, 0, 1);

      expect(dateTime.timeIsZero, equals(false));
    });

    test('is true on zero time.', () {
      final dateTime = DateTime(2001, 11, 16, 0, 0, 0, 0);

      expect(dateTime.timeIsZero, equals(true));
    });
  });

  group('format', () {
    test('returns correct string.', () {
      final dateTime = DateTime(2001, 11, 16);

      expect(dateTime.format('dd.MM.yy'), equals('16.11.01'));
    });
  });
}
