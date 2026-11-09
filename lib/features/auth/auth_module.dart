import 'package:get_it/get_it.dart';
import 'package:tavada_eats/app/flavor/flavor_config.dart';
import 'package:tavada_eats/core/network/mock/mock_server.dart';
import 'package:tavada_eats/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:tavada_eats/features/auth/data/mock/auth_mock_api.dart';
import 'package:tavada_eats/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:tavada_eats/features/auth/domain/repositories/auth_repository.dart';
import 'package:tavada_eats/features/auth/presentation/bloc/email_step_cubit.dart';
import 'package:tavada_eats/features/auth/presentation/bloc/forgot_password_cubit.dart';
import 'package:tavada_eats/features/auth/presentation/bloc/login_bloc.dart';
import 'package:tavada_eats/features/auth/presentation/bloc/otp_bloc.dart';
import 'package:tavada_eats/features/auth/presentation/bloc/password_step_cubit.dart';
import 'package:tavada_eats/features/auth/presentation/bloc/reset_password_cubit.dart';
import 'package:tavada_eats/features/auth/presentation/flow/auth_flow.dart';

/// Registers the auth feature's data layer, blocs and mock API routes.
void registerAuthModule(GetIt sl) {
  sl
    ..registerLazySingleton(() => AuthRemoteDataSource(sl()))
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()))
    ..registerFactory(() => EmailStepCubit(sl()))
    ..registerFactory(() => PasswordStepCubit(sl()))
    ..registerFactory(() => LoginBloc(sl()))
    ..registerFactory(() => ForgotPasswordCubit(sl()))
    ..registerFactory(() => ResetPasswordCubit(sl()))
    ..registerFactoryParam<OtpBloc, OtpArgs, void>(
      (args, _) => OtpBloc(repository: sl(), args: args),
    );

  if (sl<FlavorConfig>().useMockApi) {
    sl<MockServer>().addApi(AuthMockApi(sl()));
  }
}
