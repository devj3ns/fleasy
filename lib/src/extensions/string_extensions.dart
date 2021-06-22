final RegExp _emailRegExp = RegExp(
    r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");

final RegExp _urlRegExp = RegExp(
    r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-@]+))*$");

final RegExp _easyPasswordRegExp = RegExp(r'^\S{8,}$');

final RegExp _mediumPasswordRegExp =
    RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)\S{8,}$');

final RegExp _strongPasswordRegExp =
    RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])\S{8,}$');

extension StringExtensions on String {
  /// Whether the string is a valid email.
  bool get isEmail => _emailRegExp.hasMatch(this);

  /// Whether the string is a valid url.
  bool get isUrl => _urlRegExp.hasMatch(this);

  /// Whether the string is a valid easy password.
  ///
  /// Requirements:
  /// - minimum 8 characters
  /// - no whitespaces
  bool get isEasyPassword => _easyPasswordRegExp.hasMatch(this);

  /// Whether the string is a valid medium password.
  ///
  /// Requirements:
  /// - minimum 8 characters
  /// - no whitespaces
  /// - at least 1 uppercase letter
  /// - at least 1 lowercase letter
  /// - at least 1 number
  bool get isMediumPassword => _mediumPasswordRegExp.hasMatch(this);

  /// Whether the string is a valid strong password.
  ///
  /// Requirements:
  /// - minimum 8 characters
  /// - no whitespaces
  /// - at least 1 uppercase letter
  /// - at least 1 lowercase letter
  /// - at least 1 number
  /// - at least 1 special character
  bool get isStrongPassword => _strongPasswordRegExp.hasMatch(this);
}

extension NullableStringExtensions on String? {
  /// Whether the string is not null nor empty.
  bool get isNotBlank => this != null && this!.isNotEmpty;

  /// Whether the string is null or empty.
  bool get isBlank => !isNotBlank;

  /// Returns null if the string is blank (empty or null) or it's text if not.
  String? toNullIfBlank() => isNotBlank ? this : null;

  /// Whether the string is not null and a valid email.
  bool get isEmail => this != null ? this!.isEmail : false;

  /// Whether the string is not null and a valid url.
  bool get isUrl => this != null ? this!.isUrl : false;

  /// Whether the string is a valid medium password.
  ///
  /// Requirements:
  /// - minimum 8 characters
  /// - no whitespaces
  /// - at least 1 uppercase letter
  /// - at least 1 lowercase letter
  /// - at least 1 number
  bool get isMediumPassword =>
      this != null ? _mediumPasswordRegExp.hasMatch(this!) : false;

  /// Whether the string is a valid strong password.
  ///
  /// Requirements:
  /// - minimum 8 characters
  /// - no whitespaces
  /// - at least 1 uppercase letter
  /// - at least 1 lowercase letter
  /// - at least 1 number
  /// - at least 1 special character
  bool get isStrongPassword =>
      this != null ? _strongPasswordRegExp.hasMatch(this!) : false;
}
