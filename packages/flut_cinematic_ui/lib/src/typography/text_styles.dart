import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

/// App Text Style Definitions
/// Source: https://m3.material.io/styles/typography/type-scale-tokens
class TextStyles {
  const TextStyles._();

  static const _baseTextStyle = TextStyle(
    fontFamily: FontFamily.redHatDisplay,
    fontWeight: AppFontWeight.medium,
    letterSpacing: -.5,
    color: Palette.white,
    package: FlutCinematicUI.package,
  );

  static TextStyle headlineSmall = _baseTextStyle.copyWith(fontSize: 20);

  static TextStyle headlineLarge = _baseTextStyle.copyWith(
    fontSize: 32,
    fontWeight: AppFontWeight.semiBold,
  );

  static TextStyle headlineMedium = _baseTextStyle.copyWith(
    fontSize: 32,
    fontWeight: AppFontWeight.semiBold,
    color: Palette.red,
  );

  static TextStyle displayLarge = _baseTextStyle.copyWith(
    fontSize: 28,
    fontWeight: AppFontWeight.semiBold,
    color: Palette.red,
  );

  static TextStyle bodySmall = _baseTextStyle.copyWith(fontSize: 14);

  static TextStyle bodyMedium = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: AppFontWeight.regular,
    color: Palette.white.withOpacity(.75),
  );

  static TextStyle bodyLarge = _baseTextStyle.copyWith(fontSize: 16);

  static TextStyle titleLarge = _baseTextStyle.copyWith(
    fontSize: 16,
    letterSpacing: -.4,
    fontWeight: AppFontWeight.semiBold,
  );

  static TextStyle labelSmall = _baseTextStyle.copyWith(fontSize: 12);

  static TextStyle labelMedium = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: AppFontWeight.regular,
    color: Palette.white.withOpacity(.8),
  );

  static TextStyle titleSmall = _baseTextStyle.copyWith(
    fontSize: 13,
    color: Palette.white.withOpacity(.6),
  );
}
