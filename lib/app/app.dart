import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tavada_eats/app/flavor/flavor_config.dart';
import 'package:tavada_eats/app/router/app_router.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/session/session_cubit.dart';
import 'package:tavada_eats/core/settings/settings_cubit.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/core/utils/haptics.dart';
import 'package:tavada_eats/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:tavada_eats/features/profile/presentation/bloc/account_bloc.dart';
import 'package:tavada_eats/shared/widgets/feedback/offline_banner.dart';

/// Root widget: app-scoped blocs, theme, localization and router.
class TavadaApp extends StatelessWidget {
  const TavadaApp({required this.config, super.key});

  final FlavorConfig config;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SessionCubit>.value(value: sl<SessionCubit>()),
        BlocProvider<SettingsCubit>.value(value: sl<SettingsCubit>()),
        BlocProvider<CartBloc>.value(value: sl<CartBloc>()),
      ],
      child: BlocListener<SessionCubit, SessionState>(
        // User-scoped state must not leak to the next person on the device.
        listenWhen: (a, b) {
          if (a.user?.id == b.user?.id) return false;
          _previousUserId = a.user?.id;
          return true;
        },
        listener: _onUserChanged,
        child: BlocConsumer<SettingsCubit, SettingsState>(
          listenWhen: (a, b) => a.hapticsEnabled != b.hapticsEnabled,
          listener: (_, state) => Haptics.enabled = state.hapticsEnabled,
          builder: (context, settings) {
            Haptics.enabled = settings.hapticsEnabled;
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Colors.transparent,
                systemNavigationBarColor: Colors.transparent,
              ),
              child: MaterialApp.router(
                title: config.appName,
                debugShowCheckedModeBanner: config.showDebugBanner,
                theme: AppTheme.light,
                themeMode: ThemeMode.light,
                locale: settings.locale,
                supportedLocales: supportedAppLocales,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  ...GlobalMaterialLocalizations.delegates,
                ],
                routerConfig: sl<AppRouter>().router,
                builder: (context, child) => SkeletonizerConfig(
                  data: AppTheme.skeleton,
                  child: OfflineBanner(
                    child: MediaQuery.withClampedTextScaling(
                      maxScaleFactor: 1.3,
                      child: child ?? const SizedBox.shrink(),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  static String? _previousUserId;

  /// Signing out (or switching account) drops the previous customer's
  /// basket and cached wallet; a guest who signs in keeps their basket.
  static void _onUserChanged(BuildContext context, SessionState session) {
    sl<AccountBloc>().add(const AccountReset());
    if (_previousUserId != null) {
      context.read<CartBloc>().add(const CartCleared());
    }
  }
}
