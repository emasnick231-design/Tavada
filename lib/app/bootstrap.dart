import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tavada_eats/app/app.dart';
import 'package:tavada_eats/app/flavor/flavor_config.dart';
import 'package:tavada_eats/core/bloc/app_bloc_observer.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/logging/app_logger.dart';

/// Shared start-up for every flavor entry point.
Future<void> bootstrap(FlavorConfig config) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      AppLogger.configure(enabled: !config.isProd);

      FlutterError.onError = (details) {
        AppLogger.instance.error(
          'Flutter error',
          details.exception,
          details.stack,
        );
      };
      PlatformDispatcher.instance.onError = (error, stack) {
        AppLogger.instance.error('Platform error', error, stack);
        return true;
      };

      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      Intl.defaultLocale = 'en_GB';

      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory(
                (await getApplicationSupportDirectory()).path,
              ),
      );
      Bloc.observer = AppBlocObserver(verbose: config.isDev);

      await configureDependencies(config);

      runApp(TavadaApp(config: config));
    },
    (error, stack) =>
        AppLogger.instance.error('Uncaught zone error', error, stack),
  );
}
