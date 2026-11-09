import 'package:go_router/go_router.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/app/router/app_transitions.dart';
import 'package:tavada_eats/features/home/presentation/pages/home_page.dart';
import 'package:tavada_eats/features/home/presentation/pages/restaurant_list_page.dart';

/// Home tab + "see all" lists.
final homeTabRoute = GoRoute(
  path: AppRoutes.home,
  pageBuilder: (context, state) => AppTransitions.none(state, const HomePage()),
);

final homeRoutes = <RouteBase>[
  GoRoute(
    path: AppRoutes.restaurantList,
    pageBuilder: (context, state) => AppTransitions.adaptive(
      state,
      RestaurantListPage(
        section: state.uri.queryParameters['section'] ?? 'places_near_you',
        title: state.uri.queryParameters['title'],
      ),
    ),
  ),
];
