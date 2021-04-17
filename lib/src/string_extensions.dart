final RegExp _emailRegularExpression = RegExp(
    r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");

extension StringUtils on String {
  /// Adds https:// to the beginning of the string if it does not contain https:// or http://.
  String addHttps() =>
      !contains('https://') && !contains('http://') ? 'https://$this' : this;

  /// Returns true if the string is a valid email
  bool get isValidEmail => _emailRegularExpression.hasMatch(toLowerCase());

  /// Returns true if the string is an invalid email.
  bool get isInvalidEmail => !isValidEmail;
}

extension NullableStringUtils on String? {
  /// Returns true if the string is not null nor empty.
  bool get isNotBlank => this != null && this!.isNotEmpty;

  /// Returns true if the string is null or empty.
  bool get isBlank => !isNotBlank;

  /// Returns true if the string is a valid email.
  bool get isValidEmail => this != null
      ? _emailRegularExpression.hasMatch(this!.toLowerCase())
      : false;

  /// Returns true if the string is an invalid email.
  bool get isInvalidEmail => !isValidEmail;

  /// Returns null if the string is blank (empty or null) or it's text if it's no blank.
  String? toNullIfBlank() => isNotBlank ? this : null;
}
