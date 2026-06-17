import 'package:flutter/material.dart';

import 'app_color_extension.dart';
import 'app_colors.dart';
import 'app_typography.dart';

/// Material [ThemeData] for the TMQ ERP app, assembled from the design tokens
/// extracted from the Figma Make design system.
///
/// Color schemes are built explicitly (not via [ColorScheme.fromSeed]) so the
/// exact brand hexes are preserved. Non-Material tokens (status colors,
/// sidebar, charts) are exposed through [AppColorExtension].
abstract final class AppTheme {
  static ThemeData get light {
    const scheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.primaryForeground,
      primaryContainer: AppColors.accent,
      onPrimaryContainer: AppColors.accentForeground,
      secondary: AppColors.secondary,
      onSecondary: AppColors.secondaryForeground,
      error: AppColors.destructive,
      onError: AppColors.destructiveForeground,
      surface: AppColors.card,
      onSurface: AppColors.cardForeground,
      surfaceContainerHighest: AppColors.muted,
      onSurfaceVariant: AppColors.mutedForeground,
      outline: AppColors.border,
      outlineVariant: AppColors.muted,
    );

    return _base(
      scheme: scheme,
      scaffoldBackground: AppColors.background,
      extension: AppColorExtension.light,
    );
  }

  static ThemeData get dark {
    const scheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColorsDark.primary,
      onPrimary: AppColorsDark.primaryForeground,
      primaryContainer: AppColorsDark.accent,
      onPrimaryContainer: AppColorsDark.accentForeground,
      secondary: AppColorsDark.secondary,
      onSecondary: AppColorsDark.secondaryForeground,
      error: AppColorsDark.destructive,
      onError: AppColorsDark.destructiveForeground,
      surface: AppColorsDark.card,
      onSurface: AppColorsDark.cardForeground,
      surfaceContainerHighest: AppColorsDark.muted,
      onSurfaceVariant: AppColorsDark.mutedForeground,
      outline: AppColorsDark.border,
      outlineVariant: AppColorsDark.muted,
    );

    return _base(
      scheme: scheme,
      scaffoldBackground: AppColorsDark.background,
      extension: AppColorExtension.dark,
    );
  }

  static ThemeData _base({
    required ColorScheme scheme,
    required Color scaffoldBackground,
    required AppColorExtension extension,
  }) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scaffoldBackground,
      fontFamily: AppTypography.fontFamily,
      textTheme: AppTypography.textTheme(scheme.onSurface),
      extensions: <ThemeExtension<dynamic>>[extension],
    );
  }
}
