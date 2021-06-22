import 'package:fleasy/fleasy.dart';
import 'package:test/test.dart';

void main() {
  group('containsDate', () {
    test('returns true with list that contains correct date.', () {
      final list = [
        DateTime.now(),
      ];

      expect(list.containsDate(Date.today()), equals(true));
    });

    test('returns false with list that does not contain correct date.', () {
      final list = [
        Date.yesterday(),
        Date.tomorrow(),
      ];

      expect(list.containsDate(Date.today()), equals(false));
    });
  });
}
