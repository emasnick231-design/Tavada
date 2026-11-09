import 'package:go_router/go_router.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/app/router/app_transitions.dart';
import 'package:tavada_eats/features/onboarding/presentation/pages/splash_page.dart';
import 'package:tavada_eats/features/onboarding/presentation/pages/welcome_page.dart';

/// Launch & welcome routes (owned by the onboarding feature).
final onboardingRoutes = <RouteBase>[
  GoRoute(
    path: AppRoutes.splash,
    pageBuilder: (context, state) =>
        AppTransitions.none(state, const SplashPage()),
  ),
  GoRoute(
    path: AppRoutes.welcome,
    pageBuilder: (context, state) =>
        AppTransitions.fade(state, const WelcomePage()),
  ),
];
