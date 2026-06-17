import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Theme-mode-aware tokens from the TMQ design system that have no direct
/// slot in Material's [ColorScheme]: status colors (success/warning/info),
/// the dark sidebar palette, and the 5-color chart palette.
///
/// Access via `Theme.of(context).extension<AppColorExtension>()!`.
@immutable
class AppColorExtension extends ThemeExtension<AppColorExtension> {
  const AppColorExtension({
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
    required this.info,
    required this.onInfo,
    required this.sidebar,
    required this.sidebarForeground,
    required this.sidebarPrimary,
    required this.sidebarPrimaryForeground,
    required this.sidebarAccent,
    required this.sidebarAccentForeground,
    required this.sidebarBorder,
    required this.sidebarRing,
    required this.charts,
  });

  final Color success;
  final Color onSuccess;
  final Color warning;
  final Color onWarning;
  final Color info;
  final Color onInfo;

  final Color sidebar;
  final Color sidebarForeground;
  final Color sidebarPrimary;
  final Color sidebarPrimaryForeground;
  final Color sidebarAccent;
  final Color sidebarAccentForeground;
  final Color sidebarBorder;
  final Color sidebarRing;

  /// Chart palette (chart-1 … chart-5).
  final List<Color> charts;

  static const AppColorExtension light = AppColorExtension(
    success: AppColors.success,
    onSuccess: Color(0xFFFFFFFF),
    warning: AppColors.warning,
    onWarning: Color(0xFFFFFFFF),
    info: AppColors.info,
    onInfo: Color(0xFFFFFFFF),
    sidebar: AppColors.sidebar,
    sidebarForeground: AppColors.sidebarForeground,
    sidebarPrimary: AppColors.sidebarPrimary,
    sidebarPrimaryForeground: AppColors.sidebarPrimaryForeground,
    sidebarAccent: AppColors.sidebarAccent,
    sidebarAccentForeground: AppColors.sidebarAccentForeground,
    sidebarBorder: AppColors.sidebarBorder,
    sidebarRing: AppColors.sidebarRing,
    charts: [
      AppColors.chart1,
      AppColors.chart2,
      AppColors.chart3,
      AppColors.chart4,
      AppColors.chart5,
    ],
  );

  static const AppColorExtension dark = AppColorExtension(
    success: AppColorsDark.success,
    onSuccess: Color(0xFF052E16),
    warning: AppColorsDark.warning,
    onWarning: Color(0xFF1F1300),
    info: AppColorsDark.info,
    onInfo: Color(0xFF04293A),
    sidebar: AppColorsDark.sidebar,
    sidebarForeground: AppColorsDark.sidebarForeground,
    sidebarPrimary: AppColorsDark.sidebarPrimary,
    sidebarPrimaryForeground: AppColorsDark.sidebarPrimaryForeground,
    sidebarAccent: AppColorsDark.sidebarAccent,
    sidebarAccentForeground: AppColorsDark.sidebarAccentForeground,
    sidebarBorder: AppColorsDark.sidebarBorder,
    sidebarRing: AppColorsDark.sidebarRing,
    charts: [
      AppColorsDark.chart1,
      AppColorsDark.chart2,
      AppColorsDark.chart3,
      AppColorsDark.chart4,
      AppColorsDark.chart5,
    ],
  );

  @override
  AppColorExtension copyWith({
    Color? success,
    Color? onSuccess,
    Color? warning,
    Color? onWarning,
    Color? info,
    Color? onInfo,
    Color? sidebar,
    Color? sidebarForeground,
    Color? sidebarPrimary,
    Color? sidebarPrimaryForeground,
    Color? sidebarAccent,
    Color? sidebarAccentForeground,
    Color? sidebarBorder,
    Color? sidebarRing,
    List<Color>? charts,
  }) {
    return AppColorExtension(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      sidebar: sidebar ?? this.sidebar,
      sidebarForeground: sidebarForeground ?? this.sidebarForeground,
      sidebarPrimary: sidebarPrimary ?? this.sidebarPrimary,
      sidebarPrimaryForeground:
          sidebarPrimaryForeground ?? this.sidebarPrimaryForeground,
      sidebarAccent: sidebarAccent ?? this.sidebarAccent,
      sidebarAccentForeground:
          sidebarAccentForeground ?? this.sidebarAccentForeground,
      sidebarBorder: sidebarBorder ?? this.sidebarBorder,
      sidebarRing: sidebarRing ?? this.sidebarRing,
      charts: charts ?? this.charts,
    );
  }

  @override
  AppColorExtension lerp(covariant AppColorExtension? other, double t) {
    if (other == null) return this;
    return AppColorExtension(
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      sidebar: Color.lerp(sidebar, other.sidebar, t)!,
      sidebarForeground:
          Color.lerp(sidebarForeground, other.sidebarForeground, t)!,
      sidebarPrimary: Color.lerp(sidebarPrimary, other.sidebarPrimary, t)!,
      sidebarPrimaryForeground: Color.lerp(
        sidebarPrimaryForeground,
        other.sidebarPrimaryForeground,
        t,
      )!,
      sidebarAccent: Color.lerp(sidebarAccent, other.sidebarAccent, t)!,
      sidebarAccentForeground: Color.lerp(
        sidebarAccentForeground,
        other.sidebarAccentForeground,
        t,
      )!,
      sidebarBorder: Color.lerp(sidebarBorder, other.sidebarBorder, t)!,
      sidebarRing: Color.lerp(sidebarRing, other.sidebarRing, t)!,
      charts: _lerpColorList(charts, other.charts, t),
    );
  }

  static List<Color> _lerpColorList(
    List<Color> a,
    List<Color> b,
    double t,
  ) {
    final length = a.length < b.length ? a.length : b.length;
    return List<Color>.generate(
      length,
      (i) => Color.lerp(a[i], b[i], t)!,
    );
  }
}
