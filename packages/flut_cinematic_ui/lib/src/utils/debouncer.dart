import 'dart:async';
import 'dart:ui';

class Debouncer {
  Debouncer({required this.duration});

  final Duration duration;
  VoidCallback? action;
  Timer? _timer;

  void run(VoidCallback action) {
    cancel();
    _timer = Timer(duration, action);
  }

  void cancel() => _timer?.cancel();
}
