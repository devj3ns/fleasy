extension NullableListExtensions on List? {
  /// Returns true if empty or null
  bool get isNotBlank => this != null && this!.isNotEmpty;

  /// Returns true if not empty nor null
  bool get isBlank => !isNotBlank;
}

extension ListExtensions<T> on List<T> {
  /// Returns either the first element of the list which satisfies the provided test or null if there is none.
  T? find(Function(T element) test) {
    final index = indexWhere((element) => test(element));
    return index != -1 ? this[index] : null;
  }
}
