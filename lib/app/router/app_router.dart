import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/app/view/app_shell.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/session/session_cubit.dart';
import 'package:tavada_eats/features/auth/auth_routes.dart';
import 'package:tavada_eats/features/basket/basket_routes.dart';
import 'package:tavada_eats/features/checkout/checkout_routes.dart';
import 'package:tavada_eats/features/home/home_routes.dart';
import 'package:tavada_eats/features/location/location_routes.dart';
import 'package:tavada_eats/features/onboarding/onboarding_routes.dart';
import 'package:tavada_eats/features/orders/orders_routes.dart';
import 'package:tavada_eats/features/profile/profile_routes.dart';
import 'package:tavada_eats/features/restaurant/restaurant_routes.dart';
import 'package:tavada_eats/features/search/search_routes.dart';
import 'package:tavada_eats/features/stores/stores_routes.dart';
import 'package:tavada_eats/features/support/support_routes.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Root navigator — full-screen routes are pushed here (above the tab bar).
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

/// Owns the [GoRouter] and its redirect policy.
///
/// Routes are declared by each feature (`*_routes.dart`) so teams can add
/// screens without touching this file.
class AppRouter {
  AppRouter(this._session);

  final SessionCubit _session;

  late final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: _StreamListenable(_session.stream),
    redirect: _redirect,
    // Unknown links (old deep links, typos) get a branded page, not the
    // raw go_router exception.
    errorBuilder: (context, state) => AppScaffold(
      appBar: const AppTopBar(),
      body: ErrorStateView(
        failure: const NotFoundFailure(),
        message: context.l10n.errorPageNotFound,
      ),
    ),
    routes: [
      ...onboardingRoutes,
      ...authRoutes,
      ...locationRoutes,
      StatefulShellRoute(
        builder: (context, state, shell) => AppShell(navigationShell: shell),
        navigatorContainerBuilder: (context, shell, children) =>
            AnimatedBranchContainer(
              currentIndex: shell.currentIndex,
              children: children,
            ),
        branches: [
          StatefulShellBranch(routes: [homeTabRoute]),
          StatefulShellBranch(routes: [storesTabRoute]),
          StatefulShellBranch(routes: [basketTabRoute]),
          StatefulShellBranch(routes: [profileTabRoute]),
        ],
      ),
      ...homeRoutes,
      ...searchRoutes,
      ...restaurantRoutes,
      ...checkoutRoutes,
      ...ordersRoutes,
      ...profileRoutes,
      ...supportRoutes,
    ],
  );

  /// Session-driven guards:
  /// 1. Haven't passed the welcome screen → `/welcome`.
  /// 2. No delivery address yet → location onboarding.
  /// 3. Guests on account / order screens → log in (then back).
  /// The splash screen decides for itself after its animation.
  String? _redirect(BuildContext context, GoRouterState state) {
    final location = state.matchedLocation;
    final session = _session.state;
    if (location == AppRoutes.splash) return null;

    if (!session.hasCompletedWelcome) {
      return AppRoutes.isOnboardingLocation(location)
          ? null
          : AppRoutes.welcome;
    }
    if (session.needsAddress &&
        !location.startsWith(AppRoutes.locationIntro) &&
        !location.startsWith('/auth')) {
      return AppRoutes.locationIntro;
    }
    if (location == AppRoutes.welcome) return AppRoutes.home;
    // Account screens and orders belong to a signed-in customer: send
    // guests (deep links, stale back stacks) to log in and come back.
    if (session.isGuest && _needsAccount(location)) {
      return Uri(
        path: AppRoutes.login,
        queryParameters: {'from': state.uri.toString()},
      ).toString();
    }
    return null;
  }

  static bool _needsAccount(String location) =>
      (location.startsWith('/account/') && location != AppRoutes.language) ||
      location.startsWith('/orders/');

  /// Where the splash screen should go once its animation completes.
  String get launchDestination {
    final session = _session.state;
    if (!session.hasCompletedWelcome) return AppRoutes.welcome;
    if (session.needsAddress) return AppRoutes.locationIntro;
    return AppRoutes.home;
  }
}

class _StreamListenable extends ChangeNotifier {
  _StreamListenable(Stream<dynamic> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    unawaited(_subscription.cancel());
    super.dispose();
  }
}
