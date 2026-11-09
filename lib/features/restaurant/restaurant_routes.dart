import 'package:go_router/go_router.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/app/router/app_transitions.dart';
import 'package:tavada_eats/features/restaurant/presentation/pages/menu_item_page.dart';
import 'package:tavada_eats/features/restaurant/presentation/pages/menu_search_page.dart';
import 'package:tavada_eats/features/restaurant/presentation/pages/restaurant_page.dart';
import 'package:tavada_eats/features/restaurant/presentation/pages/restaurant_reviews_page.dart';

/// Restaurant details, reviews, menu search and dish details.
final restaurantRoutes = <RouteBase>[
  GoRoute(
    path: AppRoutes.restaurantPath,
    pageBuilder: (context, state) => AppTransitions.adaptive(
      state,
      RestaurantPage(restaurantId: state.pathParameters['restaurantId']!),
    ),
  ),
  GoRoute(
    path: AppRoutes.restaurantReviewsPath,
    pageBuilder: (context, state) => AppTransitions.adaptive(
      state,
      RestaurantReviewsPage(
        restaurantId: state.pathParameters['restaurantId']!,
      ),
    ),
  ),
  GoRoute(
    path: AppRoutes.restaurantMenuSearchPath,
    pageBuilder: (context, state) => AppTransitions.fadeThrough(
      state,
      MenuSearchPage(restaurantId: state.pathParameters['restaurantId']!),
    ),
  ),
  GoRoute(
    path: AppRoutes.menuItemPath,
    pageBuilder: (context, state) => AppTransitions.modal(
      state,
      MenuItemPage(
        restaurantId: state.pathParameters['restaurantId']!,
        itemId: state.pathParameters['itemId']!,
        editLineId: state.uri.queryParameters['edit'],
      ),
    ),
  ),
];
