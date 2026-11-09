# Tavada Eats

Tavada Eats is a food delivery app for African cuisine, built with Flutter for
iOS and Android. You can browse restaurants near you, filter by cuisine or
dietary needs, build a basket from one or more stores, check out, and follow
your order until it arrives.

I built it as a portfolio project to show how I structure a production-sized
Flutter app: clear feature boundaries, predictable state, and a codebase that
stays easy to test as it grows.

## Try it

**Android:** grab the APK from the
[latest release](https://github.com/emasnick231-design/Tavada/releases/latest)
and install it on your phone. Android will ask you to allow installs from
unknown sources the first time.

The app ships with a built-in demo backend, so it works without a server. To
try the signed-in flows, either:

- **Sign up with your own email.** Nothing is actually sent: the verification
  code is always `1234`, and your account only exists on your phone.
- **Or log in with the demo account:** `emasnick231@gmail.com` / `Password1!`

## What's inside

- **39 screens across 14 features:** onboarding, sign up and log in with OTP,
  a map-based address picker, search, restaurant menus with dish options, a
  multi-store basket, checkout with delivery or pickup, live order tracking,
  wallet, rewards and in-app support chat.
- **Feature-first Clean Architecture.** Each feature owns its data, domain and
  presentation layers, plus its own routes and dependency registrations.
- **BLoC / Cubit** with immutable `freezed` states, sealed events and explicit
  concurrency (`droppable` for submits, `restartable` for refreshes, debounced
  search).
- **go_router** with a stateful four-tab shell, session-aware redirects and
  deep links.
- **A mock backend that behaves like a real one.** Requests go through Dio as
  usual; in demo mode an interceptor answers them from JSON fixtures, with
  realistic latency and (in staging) random failures, so loading and error
  states actually get exercised.
- **Three flavours** (dev, staging, prod) on both Android and iOS.
- **English and Turkish**, with per-feature translation files.
- **Tests:** unit, bloc and widget tests for the core flows.

## Getting started

You'll need Flutter 3.44 or newer.

```bash
flutter pub get
tool/codegen.sh        # localisation, freezed/json models and typed assets

flutter run --flavor dev     -t lib/main_dev.dart
flutter run --flavor staging -t lib/main_staging.dart
flutter run --flavor prod    -t lib/main_prod.dart
```

Running `flutter run` with no flags uses the dev flavour.

To skip onboarding while working on the main screens:

```bash
flutter run --flavor dev -t lib/main_dev.dart --dart-define=SKIP_ONBOARDING=true
```

Before opening a pull request:

```bash
flutter analyze
flutter test
```

### Flavours

| Flavour | Entry point | App name | Bundle / application ID | Demo API latency | Random failures |
|---|---|---|---|---|---|
| dev | `lib/main_dev.dart` | Tavada Dev | `com.tavadaeats.app.dev` | 450–1100 ms | none |
| staging | `lib/main_staging.dart` | Tavada Stg | `com.tavadaeats.app.stg` | 700–1800 ms | 8% |
| prod | `lib/main_prod.dart` | Tavada Eats | `com.tavadaeats.app` | 250–650 ms | none |

Runtime settings live in `lib/app/flavor/flavor_config.dart` and can be
overridden with `--dart-define` (`API_BASE_URL`, `USE_MOCK_API`,
`SKIP_ONBOARDING`). To point the app at a real API, run with
`--dart-define=USE_MOCK_API=false --dart-define=API_BASE_URL=https://…`.

## Project structure

```
lib/
├── app/              # bootstrap, MaterialApp, router, flavours, tab shell
├── core/             # DI, networking, errors, theme, l10n, session, storage
├── shared/widgets/   # design-system components
└── features/<name>/
    ├── data/         # data sources, repository implementations, mock API
    ├── domain/       # entities and repository contracts
    ├── presentation/ # blocs, pages and widgets
    ├── l10n/         # English and Turkish strings
    ├── <name>_module.dart
    └── <name>_routes.dart
```

A few rules the code follows:

- Presentation depends on domain contracts, never on Dio or data sources.
- Repositories return `Either<Failure, T>`, so errors are values the UI has to
  handle rather than exceptions it can forget about.
- Money is stored in minor units to avoid rounding bugs in the basket.
- Session, settings and the basket are persisted with `hydrated_bloc`, so they
  survive restarts.

## Design system

Colours, spacing, radii, shadows and motion are defined as tokens in
`lib/core/theme` and match the Figma design. Text uses Plus Jakarta Sans, with
Protest Strike for brand headlines, and the icons are the Solar set as SVGs.
Shared components (buttons, inputs, OTP field, bottom sheets, toasts,
skeleton loaders, empty and error states, map widgets) live in
`lib/shared/widgets`.

## Not included yet

Google and Apple sign-in and Firebase aren't wired up. Their buttons are in the
UI and show a "coming soon" message for now.
