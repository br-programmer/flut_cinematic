extension DurationX on Duration {
  String get remainingMinutes {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String oneDigits(int n) => n.toString().padLeft(1, '0');
    final hours = oneDigits(inHours.remainder(60));
    final minutes = twoDigits(inMinutes.remainder(60));
    return '${hours}hrs ${minutes}min';
  }
}
