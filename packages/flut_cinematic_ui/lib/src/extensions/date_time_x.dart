import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String formatWithYear(String locale) {
    return DateFormat('dd, MMM yyyy', locale).format(toLocal());
  }

  String format(String locale) {
    return DateFormat('dd, MMMM', locale).format(toLocal());
  }

  String formatShort(String locale) {
    return DateFormat('dd, MMM', locale).format(toLocal());
  }

  String dayInText(
    String locale, {
    required String tomorrowText,
    required String todayText,
  }) {
    if (today) {
      return todayText;
    }
    if (tomorrow) {
      return tomorrowText;
    }
    return DateFormat('EEEE', locale).format(toLocal());
  }

  String myHour(String locale) {
    return DateFormat('hh:mm a', locale).format(toLocal());
  }

  bool get today {
    final today = DateTime.now();
    return today.day == day && today.month == month && today.year == year;
  }

  bool get tomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.day == day &&
        tomorrow.month == month &&
        tomorrow.year == year;
  }
}
