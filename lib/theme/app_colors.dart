import 'package:flutter/painting.dart';

/// Raw color tokens extracted from the TMQ Figma Make design system
/// (`src/styles/theme.css`).
///
/// [AppColors] holds the canonical light palette (verbatim from the Figma
/// `:root` block). [AppColorsDark] is a TMQ-branded dark palette derived to
/// keep the blue/teal brand on dark slate surfaces — it intentionally does
/// NOT mirror the generic gray dark variant shipped in the Figma file.
///
/// These are plain swatches; see `app_theme.dart` for how they map onto a
/// Material [ColorScheme] and `app_color_extension.dart` for the non-Material
/// tokens (success/warning/info, sidebar set, chart palette).
abstract final class AppColors {
  // Surfaces
  static const Color background = Color(0xFFF0F4F8);
  static const Color foreground = Color(0xFF0F1923);
  static const Color card = Color(0xFFFFFFFF);
  static const Color cardForeground = Color(0xFF0F1923);
  static const Color popover = Color(0xFFFFFFFF);
  static const Color popoverForeground = Color(0xFF0F1923);

  // Brand
  static const Color primary = Color(0xFF1A56DB);
  static const Color primaryForeground = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFF0D9488);
  static const Color secondaryForeground = Color(0xFFFFFFFF);

  // Muted / accent
  static const Color muted = Color(0xFFE8EDF3);
  static const Color mutedForeground = Color(0xFF64748B);
  static const Color accent = Color(0xFFE0EAFF);
  static const Color accentForeground = Color(0xFF1A56DB);

  // Feedback
  static const Color destructive = Color(0xFFDC2626);
  static const Color destructiveForeground = Color(0xFFFFFFFF);
  static const Color success = Color(0xFF16A34A);
  static const Color warning = Color(0xFFD97706);
  static const Color info = Color(0xFF0284C7);

  // Lines / inputs
  static const Color border = Color(0xFFE2E8F0);
  static const Color inputBackground = Color(0xFFF8FAFC);
  static const Color switchBackground = Color(0xFFCBD5E1);
  static const Color ring = Color(0xFF1A56DB);

  // Charts
  static const Color chart1 = Color(0xFF1A56DB);
  static const Color chart2 = Color(0xFF0D9488);
  static const Color chart3 = Color(0xFF7C3AED);
  static const Color chart4 = Color(0xFFF59E0B);
  static const Color chart5 = Color(0xFFEF4444);

  // Sidebar
  static const Color sidebar = Color(0xFF0F172A);
  static const Color sidebarForeground = Color(0xFFE2E8F0);
  static const Color sidebarPrimary = Color(0xFF1A56DB);
  static const Color sidebarPrimaryForeground = Color(0xFFFFFFFF);
  static const Color sidebarAccent = Color(0xFF1E293B);
  static const Color sidebarAccentForeground = Color(0xFFF1F5F9);
  static const Color sidebarBorder = Color(0xFF1E293B);
  static const Color sidebarRing = Color(0xFF1A56DB);
}

/// TMQ-branded dark palette (derived — not the generic shadcn gray variant).
abstract final class AppColorsDark {
  // Surfaces
  static const Color background = Color(0xFF0B1220);
  static const Color foreground = Color(0xFFE2E8F0);
  static const Color card = Color(0xFF1E293B);
  static const Color cardForeground = Color(0xFFE2E8F0);
  static const Color popover = Color(0xFF1E293B);
  static const Color popoverForeground = Color(0xFFE2E8F0);

  // Brand (lightened for contrast on dark surfaces)
  static const Color primary = Color(0xFF3B82F6);
  static const Color primaryForeground = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFF14B8A6);
  static const Color secondaryForeground = Color(0xFFFFFFFF);

  // Muted / accent
  static const Color muted = Color(0xFF1E293B);
  static const Color mutedForeground = Color(0xFF94A3B8);
  static const Color accent = Color(0xFF1E3A5F);
  static const Color accentForeground = Color(0xFFBFDBFE);

  // Feedback
  static const Color destructive = Color(0xFFEF4444);
  static const Color destructiveForeground = Color(0xFFFFFFFF);
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF38BDF8);

  // Lines / inputs
  static const Color border = Color(0xFF334155);
  static const Color inputBackground = Color(0xFF1E293B);
  static const Color switchBackground = Color(0xFF475569);
  static const Color ring = Color(0xFF3B82F6);

  // Charts (lightened one step for dark legibility)
  static const Color chart1 = Color(0xFF3B82F6);
  static const Color chart2 = Color(0xFF2DD4BF);
  static const Color chart3 = Color(0xFFA78BFA);
  static const Color chart4 = Color(0xFFFBBF24);
  static const Color chart5 = Color(0xFFF87171);

  // Sidebar
  static const Color sidebar = Color(0xFF0F172A);
  static const Color sidebarForeground = Color(0xFFE2E8F0);
  static const Color sidebarPrimary = Color(0xFF3B82F6);
  static const Color sidebarPrimaryForeground = Color(0xFFFFFFFF);
  static const Color sidebarAccent = Color(0xFF1E293B);
  static const Color sidebarAccentForeground = Color(0xFFF1F5F9);
  static const Color sidebarBorder = Color(0xFF1E293B);
  static const Color sidebarRing = Color(0xFF3B82F6);
}
