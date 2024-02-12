import 'dart:convert';

extension ConverterFromMap on Map<String, dynamic> {
  String get encode => jsonEncode(this);
}

extension ConverterFromString on String {
  Map<String, dynamic> get decode => jsonDecode(this) as Map<String, dynamic>;
}
