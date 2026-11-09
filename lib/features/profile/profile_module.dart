import 'package:get_it/get_it.dart';
import 'package:tavada_eats/app/flavor/flavor_config.dart';
import 'package:tavada_eats/core/network/mock/mock_server.dart';
import 'package:tavada_eats/features/profile/data/datasources/profile_remote_data_sources.dart';
import 'package:tavada_eats/features/profile/data/mock/profile_mock_api.dart';
import 'package:tavada_eats/features/profile/data/repositories/profile_repositories_impl.dart';
import 'package:tavada_eats/features/profile/domain/repositories/account_settings_repository.dart';
import 'package:tavada_eats/features/profile/domain/repositories/wallet_repository.dart';
import 'package:tavada_eats/features/profile/presentation/bloc/account_bloc.dart';

/// Registers the profile feature's dependencies (data sources,
/// repositories, blocs) and its mock API routes.
void registerProfileModule(GetIt sl) {
  sl
    ..registerLazySingleton(() => WalletRemoteDataSource(sl()))
    ..registerLazySingleton(() => AccountSettingsRemoteDataSource(sl()))
    ..registerLazySingleton<WalletRepository>(() => WalletRepositoryImpl(sl()))
    ..registerLazySingleton<AccountSettingsRepository>(
      () => AccountSettingsRepositoryImpl(sl()),
    )
    // Shared by the Profile tab and the wallet screens so a top-up or a
    // redeemed reward shows up everywhere immediately.
    ..registerLazySingleton<AccountBloc>(() => AccountBloc(sl()));

  if (sl<FlavorConfig>().useMockApi) {
    sl<MockServer>().addApi(ProfileMockApi(sl()));
  }
}
