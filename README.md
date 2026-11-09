# Tavada Eats

Food delivery app for African restaurants, built with Flutter (Android + iOS).

This is a personal project. There's no real backend behind it yet, so the app
ships with a mock API (more on that below). That means you can install the APK
and go through every flow: browse, order, pay, track.

## Download

Android: [latest release](https://github.com/emasnick231-design/Tavada/releases/latest).
There's no iOS build to download yet.

To log in, either sign up with any email or use `emasnick231@gmail.com` /
`Password1!`. The OTP is always `1234`.

## Stack

- Flutter 3.44, Dart 3.12
- flutter_bloc + freezed, bloc_concurrency
- go_router
- get_it
- dio
- fpdart
- hydrated_bloc (session, settings, basket)
- flutter_map
- bloc_test, mocktail, very_good_analysis

## Running it

```bash
flutter pub get
./tool/codegen.sh
flutter run --flavor dev -t lib/main_dev.dart
```

There are three flavors: `dev`, `staging` and `prod`, each with its own entry
point in `lib/`. Staging adds extra latency and fails about 8% of requests on
purpose, which is useful for checking error and retry states.

`--dart-define=SKIP_ONBOARDING=true` skips onboarding and drops you on the home
screen.

```bash
flutter analyze
flutter test
```

## Structure

```
lib/
├── app/          bootstrap, router, flavors, tab shell
├── core/         DI, networking, errors, theme, l10n, session
├── shared/       reusable widgets
└── features/
    └── <feature>/
        ├── data/
        ├── domain/
        ├── presentation/
        ├── l10n/
        ├── <feature>_module.dart   # DI registrations
        └── <feature>_routes.dart
```

It's organised by feature. Each feature registers its own dependencies and
routes, so adding one doesn't mean editing a central router or DI file.

## Notes

A few decisions that aren't obvious from the folder structure:

- The mock API is a Dio interceptor, not fake repositories. Requests go through
  the real `ApiClient` and the interceptor answers them from JSON fixtures in
  `assets/mock`. Repositories and JSON parsing are the same code that would run
  against a real server, and switching over is `--dart-define=USE_MOCK_API=false`
  plus `API_BASE_URL`.
- Repositories return `Either<Failure, T>` instead of throwing, so the UI has
  to deal with the failure case.
- Prices are stored in minor units (pence), not doubles.
- Checkout uses `droppable()` on submit, so a double tap can't place two
  orders. Search is debounced and drops responses from older queries.
- Strings live next to each feature (`features/*/l10n`) and get merged into the
  app ARB files by `tool/l10n_merge.dart`. English and Turkish for now.

## Not done yet

- Real backend
- Google / Apple sign-in (the buttons are there but only show "coming soon")
- Push notifications
- Order cancellation
- Saved addresses
- iOS release build
