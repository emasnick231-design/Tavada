import 'package:go_router/go_router.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/app/router/app_transitions.dart';
import 'package:tavada_eats/features/location/presentation/location_flow.dart';
import 'package:tavada_eats/features/location/presentation/pages/location_intro_page.dart';
import 'package:tavada_eats/features/location/presentation/pages/location_picker_page.dart';
import 'package:tavada_eats/features/location/presentation/pages/location_search_page.dart';

/// Delivery location onboarding & picker routes.
final locationRoutes = <RouteBase>[
  GoRoute(
    path: AppRoutes.locationIntro,
    pageBuilder: (context, state) =>
        AppTransitions.adaptive(state, const LocationIntroPage()),
  ),
  GoRoute(
    path: AppRoutes.locationPicker,
    pageBuilder: (context, state) => AppTransitions.adaptive(
      state,
      LocationPickerPage(
        args: switch (state.extra) {
          final LocationPickerArgs args => args,
          _ => const LocationPickerArgs(),
        },
      ),
    ),
  ),
  GoRoute(
    path: AppRoutes.locationSearch,
    pageBuilder: (context, state) =>
        AppTransitions.adaptive(state, const LocationSearchPage()),
  ),
];
