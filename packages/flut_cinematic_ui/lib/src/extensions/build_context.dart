import 'package:flutter/material.dart';

extension ThemeX on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension TextThemeX on BuildContext {
  TextTheme get textTheme => theme.textTheme;
}

extension MediaQueryX on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => mediaQuery.size;
  double get height => size.height;
  double get width => size.width;
  EdgeInsets get padding => mediaQuery.padding;
}
