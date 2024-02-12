import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flut_cinematic_ui/src/typography/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// [FlutCinematicTheme] is a theme that can be used to style the UI of the app.
class FlutCinematicTheme {
  const FlutCinematicTheme._();

  static const FlexSchemeData _flutCinematicFlexShemeData = FlexSchemeData(
    name: 'Flut Cinematic Theme',
    description: 'Flut Cinematic theme, custom definition of all colors',
    light: FlexSchemeColor(
      primary: Palette.red,
      secondary: Palette.grey,
    ),
    dark: FlexSchemeColor(
      primary: Palette.red,
      secondary: Palette.grey,
    ),
  );

  /// [light] theme is not yet implemented on figma
  static final light = FlexThemeData.light(
    colors: _flutCinematicFlexShemeData.light,
    fontFamily: FontFamily.redHatDisplay,
  ).copyWith(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Palette.dark,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Palette.red,
    ),
  );

  /// [dark] is the default theme for Flut Cinematic.
  static final dark = FlexThemeData.dark(
    colors: _flutCinematicFlexShemeData.dark,
    scaffoldBackground: Palette.dark,
    fontFamily: FontFamily.redHatDisplay,
  ).copyWith(
    colorScheme: const ColorScheme.dark(onSecondary: Palette.grey),
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Palette.dark,
      elevation: 0,
      titleSpacing: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    textTheme: _textTheme,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Palette.red,
    ),
  );

  /// [TextTheme] for the [dark] theme, it uses 2021 set,
  /// 2018 will be deprecated.
  /// Source: https://github.com/flutter/flutter/pull/93725
  static TextTheme get _textTheme => TextTheme(
        displayLarge: TextStyles.displayLarge,
        headlineSmall: TextStyles.headlineSmall,
        headlineMedium: TextStyles.headlineMedium,
        headlineLarge: TextStyles.headlineLarge,
        bodySmall: TextStyles.bodySmall,
        bodyMedium: TextStyles.bodyMedium,
        bodyLarge: TextStyles.bodyLarge,
        titleSmall: TextStyles.titleSmall,
        titleLarge: TextStyles.titleLarge,
        labelSmall: TextStyles.labelSmall,
        labelMedium: TextStyles.labelMedium,
      );
}
