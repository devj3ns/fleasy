extension NullableListBankChecksExtensions on List? {
  /// Whether the list is not empty nor null.
  bool get isNotBlank => this != null && this!.isNotEmpty;

  /// Whether the list is empty or null.
  bool get isBlank => !isNotBlank;
}
