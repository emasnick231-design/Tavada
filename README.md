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

It's organised by feature. Each feature registers its own dependencies and
routes, so adding one doesn't mean editing a central router or DI file.

```
lib/
├── main_dev.dart / main_staging.dart / main_prod.dart
├── app/
│   ├── bootstrap.dart            # error zone, logging, storage, DI, runApp
│   ├── app.dart                  # MaterialApp.router, theme, locale, app-wide blocs
│   ├── flavor/flavor_config.dart
│   ├── router/
│   │   ├── app_router.dart       # GoRouter + redirects (welcome → location → home)
│   │   ├── app_routes.dart       # every path in one place
│   │   └── app_transitions.dart
│   └── view/app_shell.dart       # bottom nav + tab switching
├── core/
│   ├── bloc/                     # BlocObserver, event transformers, ViewStatus
│   ├── di/injection.dart         # get_it setup, calls each feature module
│   ├── error/                    # AppException → Failure, Result type, guard()
│   ├── extensions/
│   ├── l10n/                     # shared strings + merged/generated localizations
│   ├── logging/
│   ├── models/                   # Money, GeoPoint, DeliveryAddress, UserProfile
│   ├── network/
│   │   ├── api_client.dart       # thin wrapper over Dio
│   │   ├── dio_factory.dart
│   │   ├── interceptors/         # auth headers, locale, delivery location
│   │   └── mock/                 # mock server, routes, persisted fixture DB
│   ├── session/                  # SessionCubit (user, address)
│   ├── settings/                 # SettingsCubit (language, haptics)
│   ├── storage/                  # shared_preferences + secure storage wrappers
│   ├── theme/                    # tokens, colour scheme, typography, ThemeData
│   └── utils/                    # formatters, validators, haptics
├── shared/widgets/
│   ├── animations/  buttons/  display/  feedback/  inputs/
│   ├── layout/  map/  media/  sheets/
│   └── widgets.dart              # barrel file
└── features/                     # see below
```

Every feature follows the same layout. `orders` as an example:

```
features/orders/
├── data/
│   ├── datasources/orders_remote_data_source.dart
│   ├── repositories/orders_repository_impl.dart
│   └── mock/orders_mock_api.dart        # fake endpoints for demo builds
├── domain/
│   ├── entities/order.dart              # freezed + json_serializable
│   └── repositories/orders_repository.dart
├── presentation/
│   ├── bloc/order_cubit.dart
│   ├── pages/order_tracking_page.dart
│   ├── pages/order_timeline_page.dart
│   └── widgets/order_widgets.dart
├── l10n/orders_en.arb, orders_tr.arb
├── orders_module.dart                   # get_it registrations + mock routes
└── orders_routes.dart                   # GoRoutes for this feature
```

Features that only combine data from others (home, search, stores, basket)
have just a `presentation/` layer.

| Feature | What it covers |
|---|---|
| `onboarding` | splash, welcome screen |
| `auth` | sign up, log in (email or phone), OTP, forgot / reset password |
| `location` | location permission, map picker, address search |
| `catalog` | restaurants, menus, categories, reviews (shared by other features) |
| `home` | home feed, filters, "see all" lists |
| `stores` | stores tab |
| `search` | search with suggestions and recent searches |
| `restaurant` | restaurant page, menu search, dish options, reviews |
| `cart` | basket state, persisted across restarts |
| `basket` | basket tab, ongoing and past orders |
| `checkout` | delivery / pickup, payment method, gift, instructions, quote |
| `orders` | placing orders, live tracking, timeline, rating |
| `profile` | wallet, rewards, account settings, notifications, language |
| `support` | help articles, support chat |

A request goes through the same layers in every feature:

```
Page → Bloc/Cubit → Repository (domain contract)
                       ↓
                 RepositoryImpl → RemoteDataSource → ApiClient (Dio)
                                                        ↓
                                     real API, or MockApiInterceptor in demo builds
```

Tests mirror the same structure under `test/` (`core/`, `features/<name>/`).

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
