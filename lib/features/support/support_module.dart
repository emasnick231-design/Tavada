import 'package:get_it/get_it.dart';
import 'package:tavada_eats/app/flavor/flavor_config.dart';
import 'package:tavada_eats/core/network/mock/mock_server.dart';
import 'package:tavada_eats/features/support/data/datasources/support_remote_data_source.dart';
import 'package:tavada_eats/features/support/data/mock/chat_mock_api.dart';
import 'package:tavada_eats/features/support/data/mock/help_mock_api.dart';
import 'package:tavada_eats/features/support/data/repositories/support_repositories_impl.dart';
import 'package:tavada_eats/features/support/domain/repositories/support_repositories.dart';

/// Registers the support feature's dependencies (data sources,
/// repositories, blocs) and its mock API routes.
void registerSupportModule(GetIt sl) {
  sl
    ..registerLazySingleton(() => SupportRemoteDataSource(sl()))
    ..registerLazySingleton<HelpRepository>(() => HelpRepositoryImpl(sl()))
    ..registerLazySingleton<SupportChatRepository>(
      () => SupportChatRepositoryImpl(sl()),
    );

  if (sl<FlavorConfig>().useMockApi) {
    sl<MockServer>()
      ..addApi(HelpMockApi(sl()))
      ..addApi(ChatMockApi(sl()));
  }
}
