import 'package:flutter/material.dart';

/// Typography tokens from the TMQ Figma design system.
///
/// Built on a 14px base (Tailwind `--font-size: 14px`) with the default
/// Tailwind type scale and `line-height: 1.5`. Headings use weight 500
/// (`--font-weight-medium`); body/input text uses weight 400.
///
/// Sizes are rounded to clean logical pixels:
///   h1 21 · h2 18 · h3 16 · h4/label/button 14 · body 14 · small 12
abstract final class AppTypography {
  /// Primary UI font (bundled in `assets/fonts/`).
  static const String fontFamily = 'Inter';

  /// Monospace font for numeric/code cells (bundled in `assets/fonts/`).
  static const String monoFamily = 'JetBrains Mono';

  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  static const double _lineHeight = 1.5;

  /// Builds the base [TextTheme]. [color] is the default text color
  /// (foreground for the active brightness). Font family is applied at the
  /// [ThemeData] level, so styles here only carry size/weight/height/color.
  static TextTheme textTheme(Color color) {
    TextStyle s(double size, FontWeight weight) => TextStyle(
          fontSize: size,
          fontWeight: weight,
          height: _lineHeight,
          color: color,
        );

    return TextTheme(
      // Headings
      headlineSmall: s(21, medium), // h1
      titleLarge: s(18, medium), // h2
      titleMedium: s(16, medium), // h3
      titleSmall: s(14, medium), // h4 / form labels
      // Body
      bodyLarge: s(14, regular),
      bodyMedium: s(14, regular), // default body
      bodySmall: s(12, regular),
      // Labels
      labelLarge: s(14, medium), // button text
      labelMedium: s(12, medium),
      labelSmall: s(11, medium),
    );
  }
}
