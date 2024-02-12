import 'dart:core';

extension IterableX<E> on Iterable<E> {
  /// Shortcut for `map((E e) => e).toList()`.
  List<T> mapList<T>(T Function(E element) f) {
    return map(f).toList();
  }
}
