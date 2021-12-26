extension StringBlankHelpers on String {
  /// Whether the string contains characters except of whitespace characters.
  bool get isNotBlank => trim().isNotEmpty;

  /// Whether the string is either empty or solely made of whitespace characters.
  bool get isBlank => trim().isEmpty;
}

extension NullableStringBlankHelpers on String? {
  /// Whether the string is not null and contains characters except of whitespace characters.
  bool get isNotBlank => this?.trim().isNotEmpty ?? false;

  /// Whether the string is either null, empty or is solely made of whitespace characters.
  bool get isBlank => !isNotBlank;

  /// Returns null if the string [isBlank] or it's text if it [isNotBlank].
  String? toNullIfBlank() => isNotBlank ? this : null;
}
