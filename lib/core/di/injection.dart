import 'dart:ui' show PlatformDispatcher;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tavada_eats/app/flavor/flavor_config.dart';
import 'package:tavada_eats/app/router/app_router.dart';
import 'package:tavada_eats/core/network/api_client.dart';
import 'package:tavada_eats/core/network/dio_factory.dart';
import 'package:tavada_eats/core/network/interceptors/auth_interceptor.dart';
import 'package:tavada_eats/core/network/mock/mock_database.dart';
import 'package:tavada_eats/core/network/mock/mock_server.dart';
import 'package:tavada_eats/core/network/network_info.dart';
import 'package:tavada_eats/core/session/session_cubit.dart';
import 'package:tavada_eats/core/settings/settings_cubit.dart';
import 'package:tavada_eats/core/storage/local_storage.dart';
import 'package:tavada_eats/core/storage/secure_storage.dart';
import 'package:tavada_eats/features/auth/auth_module.dart';
import 'package:tavada_eats/features/basket/basket_module.dart';
import 'package:tavada_eats/features/cart/cart_module.dart';
import 'package:tavada_eats/features/catalog/catalog_module.dart';
import 'package:tavada_eats/features/checkout/checkout_module.dart';
import 'package:tavada_eats/features/home/home_module.dart';
import 'package:tavada_eats/features/location/location_module.dart';
import 'package:tavada_eats/features/onboarding/onboarding_module.dart';
import 'package:tavada_eats/features/orders/orders_module.dart';
import 'package:tavada_eats/features/profile/profile_module.dart';
import 'package:tavada_eats/features/restaurant/restaurant_module.dart';
import 'package:tavada_eats/features/search/search_module.dart';
import 'package:tavada_eats/features/stores/stores_module.dart';
import 'package:tavada_eats/features/support/support_module.dart';

/// Global service locator. Prefer constructor injection; only composition
/// roots (DI modules, route builders) should call `sl<T>()`.
final GetIt sl = GetIt.instance;

/// Feature modules, each owning its own registrations (repositories, data
/// sources, blocs, mock API routes). Order matters only for dependencies:
/// shared domains (catalog, cart) first.
const _featureModules = <void Function(GetIt)>[
  registerCatalogModule,
  registerCartModule,
  registerOnboardingModule,
  registerAuthModule,
  registerLocationModule,
  registerHomeModule,
  registerSearchModule,
  registerStoresModule,
  registerRestaurantModule,
  registerBasketModule,
  registerCheckoutModule,
  registerOrdersModule,
  registerProfileModule,
  registerSupportModule,
];

Future<void> configureDependencies(FlavorConfig config) async {
  final prefs = await SharedPreferences.getInstance();

  sl
    ..registerSingleton<FlavorConfig>(config)
    ..registerSingleton<SharedPreferences>(prefs)
    ..registerLazySingleton<LocalStorage>(() => LocalStorage(sl()))
    ..registerLazySingleton<SecureStorage>(
      () => SecureStorage(const FlutterSecureStorage()),
    )
    ..registerLazySingleton<NetworkInfo>(() => NetworkInfo(Connectivity()))
    // App-scoped state.
    ..registerLazySingleton<SessionCubit>(() => SessionCubit(sl()))
    ..registerLazySingleton<SettingsCubit>(SettingsCubit.new)
    // Networking.
    ..registerLazySingleton<MockDatabase>(
      () => MockDatabase(bundle: rootBundle, prefs: sl()),
    )
    ..registerLazySingleton<MockServer>(() => MockServer(config))
    ..registerLazySingleton<AuthInterceptor>(
      () => AuthInterceptor(
        sl(),
        localeProvider: () =>
            sl<SettingsCubit>().state.languageCode ??
            PlatformDispatcher.instance.locale.languageCode,
        locationProvider: () {
          final point = sl<SessionCubit>().state.address?.location;
          return point == null ? null : '${point.latitude},${point.longitude}';
        },
      ),
    )
    ..registerLazySingleton(
      () => buildDio(
        config: config,
        authInterceptor: sl(),
        mockServer: config.useMockApi ? sl() : null,
      ),
    )
    ..registerLazySingleton<ApiClient>(() => ApiClient(sl()));

  for (final register in _featureModules) {
    register(sl);
  }

  sl.registerLazySingleton<AppRouter>(() => AppRouter(sl()));
}
