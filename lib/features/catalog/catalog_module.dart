import 'package:get_it/get_it.dart';
import 'package:tavada_eats/app/flavor/flavor_config.dart';
import 'package:tavada_eats/core/network/mock/mock_server.dart';
import 'package:tavada_eats/features/catalog/data/datasources/catalog_remote_data_source.dart';
import 'package:tavada_eats/features/catalog/data/mock/catalog_mock_api.dart';
import 'package:tavada_eats/features/catalog/data/repositories/catalog_repository_impl.dart';
import 'package:tavada_eats/features/catalog/domain/repositories/catalog_repository.dart';

/// Registers the shared catalog data layer.
void registerCatalogModule(GetIt sl) {
  sl
    ..registerLazySingleton(() => CatalogRemoteDataSource(sl()))
    ..registerLazySingleton<CatalogRepositoryImpl>(
      () => CatalogRepositoryImpl(sl()),
    )
    ..registerLazySingleton<CatalogRepository>(sl.get<CatalogRepositoryImpl>);

  if (sl<FlavorConfig>().useMockApi) {
    sl<MockServer>().addApi(CatalogMockApi(sl()));
  }
}
