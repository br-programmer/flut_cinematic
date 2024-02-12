import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValueProvider<T> extends StateNotifier<T> {
  ValueProvider(super.state);

  void change(T value) => state = value;
}
