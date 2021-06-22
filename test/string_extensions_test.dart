import 'package:fleasy/fleasy.dart';
import 'package:test/test.dart';

void main() {
  group('isNotBlank', () {
    test('returns true on not blank string.', () {
      const string = 'x';

      expect(string.isNotBlank, equals(true));
    });

    test('returns false on empty string.', () {
      const string = '';

      expect(string.isNotBlank, equals(false));
    });

    test('returns false on only whitespace string.', () {
      const string = ' ';

      expect(string.isNotBlank, equals(false));
    });

    test('returns false on null.', () {
      const String? string = null;

      expect(string.isNotBlank, equals(false));
    });
  });

  group('isBlank', () {
    test('returns false on not blank string.', () {
      const string = 'x';

      expect(string.isBlank, equals(false));
    });

    test('returns true on empty string.', () {
      const string = '';

      expect(string.isBlank, equals(true));
    });

    test('returns true on only whitespace string.', () {
      const string = ' ';

      expect(string.isBlank, equals(true));
    });

    test('returns true on null.', () {
      const String? string = null;

      expect(string.isBlank, equals(true));
    });
  });

  group('isEmail', () {
    test('returns true on valid Email.', () {
      const email = 'info@jensbecker.dev';

      expect(email.isEmail, equals(true));
    });

    test('returns false on invalid Email.', () {
      const email = 'info@jensbeckerdev';

      expect(email.isEmail, equals(false));
    });

    test('returns false on null.', () {
      const String? email = null;

      expect(email.isEmail, equals(false));
    });
  });

  group('isUrl', () {
    test('returns true on valid URL.', () {
      const url = 'https://www.jensbecker.dev';

      expect(url.isUrl, equals(true));
    });

    test('returns false on invalid URLS.', () {
      const url = 'https://www.jensbeckerdev';

      expect(url.isUrl, equals(false));
    });

    test('returns false on null', () {
      const String? url = null;

      expect(url.isUrl, equals(false));
    });
  });

  group('isEasyPassword', () {
    test('returns true when all requirements are met.', () {
      const password = 'a1b2c3d4';

      expect(password.isEasyPassword, equals(true));
    });

    test('returns false when at least one requirement is not met.', () {
      const password1 = 'a1b2c3d';
      const password2 = ' ';

      expect(
          password1.isEasyPassword && password2.isEasyPassword, equals(false));
    });

    test('returns false on null', () {
      const String? password = null;

      expect(password.isEasyPassword, equals(false));
    });
  });

  group('isMediumPassword', () {
    test('returns true when all requirements are met.', () {
      const password = 'A1b2c3d4';

      expect(password.isMediumPassword, equals(true));
    });

    test('returns false when at least one requirement is not met.', () {
      const password1 = 'a1b2c3d4';
      const password2 = ' ';

      expect(password1.isMediumPassword && password2.isMediumPassword,
          equals(false));
    });

    test('returns false on null', () {
      const String? password = null;

      expect(password.isMediumPassword, equals(false));
    });
  });

  group('isStrongPassword', () {
    test('returns true when all requirements are met.', () {
      const password = 'A1b2c3d4!';

      expect(password.isStrongPassword, equals(true));
    });

    test('returns false when at least one requirement is not met.', () {
      const password1 = 'a1b2c3d4';
      const password2 = ' ';

      expect(password1.isStrongPassword && password2.isStrongPassword,
          equals(false));
    });

    test('returns false on null', () {
      const String? password = null;

      expect(password.isStrongPassword, equals(false));
    });
  });
}
