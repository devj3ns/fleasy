extension ListFindHelper<T> on List<T> {
  /// Returns either the first element of the list which satisfies
  /// the provided test or null if there is none.
  T? find(bool Function(T element) test) {
    final index = indexWhere((element) => test(element));

    return index != -1 ? this[index] : null;
  }
}
