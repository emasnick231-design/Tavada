import 'package:tavada_eats/app/bootstrap.dart';
import 'package:tavada_eats/app/flavor/flavor_config.dart';

/// Default entry point (`flutter run` with no target) runs the dev flavor.
/// Prefer the explicit entry points: main_dev, main_staging, main_prod.
Future<void> main() => bootstrap(FlavorConfig.dev());
