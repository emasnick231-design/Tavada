import 'package:go_router/go_router.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/app/router/app_transitions.dart';
import 'package:tavada_eats/features/checkout/presentation/pages/checkout_page.dart';

/// Checkout route.
final checkoutRoutes = <RouteBase>[
  GoRoute(
    path: AppRoutes.checkoutPath,
    pageBuilder: (context, state) => AppTransitions.adaptive(
      state,
      CheckoutPage(restaurantId: state.pathParameters['restaurantId']!),
    ),
  ),
];
