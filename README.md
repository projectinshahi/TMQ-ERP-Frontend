# TMQ ERP — Frontend

Flutter frontend for the TMQ (The Marketing Quotient) ERP. The UI follows the
design system defined in the TMQ Figma Make file (colors, typography, spacing),
ported into Flutter under [`lib/theme/`](lib/theme/).

## Architecture

The app uses the **MVC pattern** with **Riverpod** for state management.

| Layer | Responsibility | In this codebase |
|-------|----------------|------------------|
| **Model** | Data structures, repositories, and the services that fetch/persist them. No UI, no Flutter widgets. | Immutable data classes + repository/service classes (e.g. API client, local storage). |
| **View** | Presentation only. Widgets render state and forward user intent to controllers. Views never hold business logic. | `ConsumerWidget` / `ConsumerStatefulWidget` screens and components that `ref.watch` controllers. |
| **Controller** | Mediates between View and Model: holds UI state, runs business logic, calls repositories, exposes state to views. | Riverpod providers — `Notifier` / `AsyncNotifier` (and plain providers for derived/read-only state). |

### State management (Riverpod)

- The widget tree is wrapped in a `ProviderScope` at the root (see [`lib/main.dart`](lib/main.dart)).
- **Controllers are providers.** Each controller is a `Notifier`/`AsyncNotifier` exposed via a provider; that provider *is* the Controller in MVC terms.
- **Views are consumers.** Screens extend `ConsumerWidget`/`ConsumerStatefulWidget` and read state with `ref.watch(...)`; they trigger actions via `ref.read(provider.notifier).someMethod()`.
- **Models stay framework-free.** Repositories are themselves exposed as providers so controllers depend on them through `ref`, keeping things testable and overridable in tests.

Data flow: `View → (ref.read) → Controller → Repository (Model) → Controller updates state → (ref.watch) → View rebuilds`.

## Project structure

```
lib/
├── main.dart                 # Entry point; wraps the app in ProviderScope
├── theme/                    # Design system ported from Figma (see below)
├── core/                     # Cross-feature code
│   ├── models/               # Shared/base models
│   ├── services/             # API client, storage, and other infrastructure
│   └── providers/            # App-wide providers (e.g. repository/service providers)
└── features/
    └── <feature>/            # One folder per ERP module (dashboard, leads, sales, …)
        ├── model/            # Models + repository for the feature        (Model)
        ├── controller/       # Riverpod notifiers/providers for the feature (Controller)
        └── view/             # Screens + widgets                           (View)
```

Planned feature modules (from the Figma design): `dashboard`, `leads`, `sales`,
`buildings`, `products`, `tasks`, `gps`, `commissions`, `users`, `reports`,
`settings`.

> Note: `core/` and `features/` are the agreed convention and are created as
> modules are built; `lib/theme/` exists today.

## Design system

The theme is extracted from the Figma design and lives in [`lib/theme/`](lib/theme/):

- `app_colors.dart` — light palette + a TMQ-branded dark palette.
- `app_typography.dart` — Inter type scale (14px base); JetBrains Mono for numeric/code cells.
- `app_dimens.dart` — `AppRadius` and `AppSpacing` tokens.
- `app_color_extension.dart` — non-Material tokens (success/warning/info, sidebar, chart palette) via a `ThemeExtension`.
- `app_theme.dart` — `AppTheme.light` / `AppTheme.dark` (`ThemeMode.system`).

Use it from widgets via `Theme.of(context).colorScheme`, `Theme.of(context).textTheme`,
and `Theme.of(context).extension<AppColorExtension>()!`. Fonts are bundled in
`assets/fonts/` and declared in `pubspec.yaml`.

## Getting started

```bash
flutter pub get      # install dependencies
flutter run          # run the app
flutter analyze      # static analysis
```

For Flutter basics, see the [online documentation](https://docs.flutter.dev/).
