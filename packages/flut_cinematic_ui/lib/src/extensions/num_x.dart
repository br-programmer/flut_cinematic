import 'package:intl/intl.dart';

extension NumX on num {
  NumberFormat get _currencyFormat {
    return NumberFormat.simpleCurrency(decimalDigits: 2);
  }

  String get money => _currencyFormat.format(this);
}
