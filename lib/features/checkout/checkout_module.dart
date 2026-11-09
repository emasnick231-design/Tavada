import 'package:get_it/get_it.dart';
import 'package:tavada_eats/app/flavor/flavor_config.dart';
import 'package:tavada_eats/core/network/mock/mock_server.dart';
import 'package:tavada_eats/features/checkout/data/checkout_mock_api.dart';
import 'package:tavada_eats/features/checkout/data/checkout_remote_data_source.dart';
import 'package:tavada_eats/features/checkout/data/checkout_repository_impl.dart';
import 'package:tavada_eats/features/checkout/domain/repositories/checkout_repository.dart';

/// Registers the checkout data layer and its mock API routes.
void registerCheckoutModule(GetIt sl) {
  sl
    ..registerLazySingleton(() => CheckoutRemoteDataSource(sl()))
    ..registerLazySingleton<CheckoutRepository>(
      () => CheckoutRepositoryImpl(sl()),
    );

  if (sl<FlavorConfig>().useMockApi) {
    sl<MockServer>().addApi(CheckoutMockApi(sl()));
  }
}
