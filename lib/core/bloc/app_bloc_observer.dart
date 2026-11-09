import 'package:bloc/bloc.dart';
import 'package:tavada_eats/core/logging/app_logger.dart';

/// Logs bloc lifecycle in debug builds and surfaces every unhandled error.
class AppBlocObserver extends BlocObserver {
  const AppBlocObserver({this.verbose = false});

  /// When true, every transition is logged (noisy; dev flavor only).
  final bool verbose;

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    if (verbose) {
      AppLogger.instance.debug(
        '${bloc.runtimeType} ${transition.event.runtimeType} → '
        '${transition.nextState.runtimeType}',
      );
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    AppLogger.instance.error('${bloc.runtimeType} error', error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
