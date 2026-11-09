import 'package:get_it/get_it.dart';
import 'package:tavada_eats/app/flavor/flavor_config.dart';
import 'package:tavada_eats/core/network/mock/mock_server.dart';
import 'package:tavada_eats/features/orders/data/datasources/orders_remote_data_source.dart';
import 'package:tavada_eats/features/orders/data/mock/orders_mock_api.dart';
import 'package:tavada_eats/features/orders/data/repositories/orders_repository_impl.dart';
import 'package:tavada_eats/features/orders/domain/repositories/orders_repository.dart';

/// Registers the orders data layer (shared with checkout and the basket
/// tab) and the mock orders API.
void registerOrdersModule(GetIt sl) {
  sl
    ..registerLazySingleton(() => OrdersRemoteDataSource(sl()))
    ..registerLazySingleton<OrdersRepository>(
      () => OrdersRepositoryImpl(sl()),
    );

  if (sl<FlavorConfig>().useMockApi) {
    sl<MockServer>().addApi(OrdersMockApi(sl()));
  }
}
