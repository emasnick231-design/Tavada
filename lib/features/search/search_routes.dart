import 'package:go_router/go_router.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/app/router/app_transitions.dart';
import 'package:tavada_eats/features/search/presentation/pages/search_page.dart';

/// Search routes.
final searchRoutes = <RouteBase>[
  GoRoute(
    path: AppRoutes.search,
    pageBuilder: (context, state) =>
        AppTransitions.fadeThrough(state, const SearchPage()),
  ),
];
