import 'package:fleasy/fleasy.dart';
import 'package:test/test.dart';

void main() {
  group('isNotBlank', () {
    test('returns true on filled list.', () {
      final list = [1, 2, 3];

      expect(list.isNotBlank, equals(true));
    });

    test('returns false on empty list.', () {
      final list = <int>[];

      expect(list.isNotBlank, equals(false));
    });

    test('returns false on null list.', () {
      const List? list = null;

      expect(list.isNotBlank, equals(false));
    });
  });

  group('isBlank', () {
    test('returns false on filled list.', () {
      final list = [1, 2, 3];

      expect(list.isBlank, equals(false));
    });

    test('returns true on empty list.', () {
      final list = <int>[];

      expect(list.isBlank, equals(true));
    });

    test('returns true on null list.', () {
      const List? list = null;

      expect(list.isBlank, equals(true));
    });
  });

  group('find', () {
    test('returns the element if it satisfies the test.', () {
      final list = [2, 4, 6];

      expect(list.find((element) => element == 4), equals(4));
    });

    test('returns null if no element satisfies the test.', () {
      final list = [2, 4, 6];

      expect(list.find((element) => element == 3), equals(null));
    });

    test('returns null if list is empty.', () {
      final list = <int>[];

      expect(list.find((element) => element == 3), equals(null));
    });
  });
}
