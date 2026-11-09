import 'package:get_it/get_it.dart';
import 'package:tavada_eats/app/flavor/flavor_config.dart';
import 'package:tavada_eats/core/network/mock/mock_server.dart';
import 'package:tavada_eats/features/location/data/datasources/location_remote_data_source.dart';
import 'package:tavada_eats/features/location/data/mock/location_mock_api.dart';
import 'package:tavada_eats/features/location/data/repositories/location_repository_impl.dart';
import 'package:tavada_eats/features/location/domain/repositories/location_repository.dart';

/// Registers the location feature's dependencies (data sources,
/// repositories, blocs) and its mock API routes.
void registerLocationModule(GetIt sl) {
  sl
    ..registerLazySingleton(() => LocationRemoteDataSource(sl()))
    ..registerLazySingleton<LocationRepository>(
      () => LocationRepositoryImpl(sl()),
    );

  if (sl<FlavorConfig>().useMockApi) {
    sl<MockServer>().addApi(LocationMockApi());
  }
}
