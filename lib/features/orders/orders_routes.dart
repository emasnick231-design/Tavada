import 'package:go_router/go_router.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/app/router/app_transitions.dart';
import 'package:tavada_eats/features/orders/presentation/pages/order_timeline_page.dart';
import 'package:tavada_eats/features/orders/presentation/pages/order_tracking_page.dart';

/// Order tracking and timeline routes.
final ordersRoutes = <RouteBase>[
  GoRoute(
    path: AppRoutes.orderPath,
    pageBuilder: (context, state) => AppTransitions.scale(
      state,
      OrderTrackingPage(orderId: state.pathParameters['orderId']!),
    ),
  ),
  GoRoute(
    path: AppRoutes.orderTimelinePath,
    pageBuilder: (context, state) => AppTransitions.adaptive(
      state,
      OrderTimelinePage(orderId: state.pathParameters['orderId']!),
    ),
  ),
];
