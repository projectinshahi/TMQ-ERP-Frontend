import 'package:flutter/material.dart';

import 'theme/app_color_extension.dart';
import 'theme/app_dimens.dart';
import 'theme/app_theme.dart';
import 'theme/app_typography.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TMQ ERP',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const ThemePreviewPage(),
    );
  }
}

/// Temporary screen to verify the extracted theme renders correctly.
/// Replace with the real app shell once theming is confirmed.
class ThemePreviewPage extends StatelessWidget {
  const ThemePreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final ext = theme.extension<AppColorExtension>()!;

    Widget swatch(String label, Color bg, Color fg) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        child: Text(label, style: TextStyle(color: fg)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        title: const Text('TMQ Theme Preview'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text('Heading 1 (headlineSmall)', style: theme.textTheme.headlineSmall),
          Text('Heading 2 (titleLarge)', style: theme.textTheme.titleLarge),
          Text('Heading 3 (titleMedium)', style: theme.textTheme.titleMedium),
          Text('Body text (bodyMedium) — Inter 14px', style: theme.textTheme.bodyMedium),
          Text('Small caption (bodySmall)', style: theme.textTheme.bodySmall),
          Text(
            'MONO 1,234.56',
            style: theme.textTheme.bodyMedium
                ?.copyWith(fontFamily: AppTypography.monoFamily),
          ),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              swatch('Primary', scheme.primary, scheme.onPrimary),
              swatch('Secondary', scheme.secondary, scheme.onSecondary),
              swatch('Error', scheme.error, scheme.onError),
              swatch('Success', ext.success, ext.onSuccess),
              swatch('Warning', ext.warning, ext.onWarning),
              swatch('Info', ext.info, ext.onInfo),
              swatch('Accent', scheme.primaryContainer, scheme.onPrimaryContainer),
              swatch('Muted', scheme.surfaceContainerHighest, scheme.onSurfaceVariant),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              FilledButton(onPressed: () {}, child: const Text('Filled')),
              const SizedBox(width: AppSpacing.sm),
              OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
              const SizedBox(width: AppSpacing.sm),
              TextButton(onPressed: () {}, child: const Text('Text')),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Text('Card surface', style: theme.textTheme.titleMedium),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.sm,
            children: [
              for (var i = 0; i < ext.charts.length; i++)
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: ext.charts[i],
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
