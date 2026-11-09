import 'package:go_router/go_router.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/app/router/app_transitions.dart';
import 'package:tavada_eats/features/basket/presentation/pages/basket_page.dart';

/// Basket tab (My orders / Ongoing / Completed).
final basketTabRoute = GoRoute(
  path: AppRoutes.basket,
  pageBuilder: (context, state) =>
      AppTransitions.none(state, const BasketPage()),
);
