/// Spacing and corner-radius tokens from the TMQ Figma design system.
///
/// Radii derive from the Tailwind `--radius: 0.5rem` base with the
/// sm/md/lg/xl steps (−4/−2/0/+4px), rounded to clean logical pixels.
/// Spacing follows the Tailwind 4px grid.
library;

abstract final class AppRadius {
  /// `--radius-sm` — small controls (chips, badges).
  static const double sm = 4;

  /// `--radius-md` — inputs, secondary buttons.
  static const double md = 6;

  /// `--radius-lg` (base `--radius`) — cards, primary buttons.
  static const double lg = 8;

  /// `--radius-xl` — modals, large surfaces.
  static const double xl = 12;
}

abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
}
