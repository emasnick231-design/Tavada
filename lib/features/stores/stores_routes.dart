import 'package:go_router/go_router.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/app/router/app_transitions.dart';
import 'package:tavada_eats/features/stores/presentation/pages/stores_page.dart';

/// Stores tab.
final storesTabRoute = GoRoute(
  path: AppRoutes.stores,
  pageBuilder: (context, state) =>
      AppTransitions.none(state, const StoresPage()),
);
