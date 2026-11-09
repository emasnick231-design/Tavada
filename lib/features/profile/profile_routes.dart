import 'package:go_router/go_router.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/app/router/app_transitions.dart';
import 'package:tavada_eats/features/profile/presentation/pages/accessibility_page.dart';
import 'package:tavada_eats/features/profile/presentation/pages/add_money_page.dart';
import 'package:tavada_eats/features/profile/presentation/pages/change_password_page.dart';
import 'package:tavada_eats/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:tavada_eats/features/profile/presentation/pages/language_page.dart';
import 'package:tavada_eats/features/profile/presentation/pages/notification_channel_page.dart';
import 'package:tavada_eats/features/profile/presentation/pages/notification_preferences_page.dart';
import 'package:tavada_eats/features/profile/presentation/pages/profile_page.dart';
import 'package:tavada_eats/features/profile/presentation/pages/rewards_page.dart';
import 'package:tavada_eats/features/profile/presentation/pages/update_phone_page.dart';
import 'package:tavada_eats/features/profile/presentation/pages/wallet_activity_page.dart';

/// Profile tab and account settings routes.
final profileTabRoute = GoRoute(
  path: AppRoutes.profile,
  pageBuilder: (context, state) =>
      AppTransitions.none(state, const ProfilePage()),
);

final profileRoutes = <RouteBase>[
  GoRoute(
    path: AppRoutes.addMoney,
    pageBuilder: (context, state) =>
        AppTransitions.adaptive(state, const AddMoneyPage()),
  ),
  GoRoute(
    path: AppRoutes.walletActivity,
    pageBuilder: (context, state) =>
        AppTransitions.adaptive(state, const WalletActivityPage()),
  ),
  GoRoute(
    path: AppRoutes.updatePhone,
    pageBuilder: (context, state) =>
        AppTransitions.adaptive(state, const UpdatePhonePage()),
  ),
  GoRoute(
    path: AppRoutes.changePassword,
    pageBuilder: (context, state) =>
        AppTransitions.adaptive(state, const ChangePasswordPage()),
  ),
  GoRoute(
    path: AppRoutes.editProfile,
    pageBuilder: (context, state) =>
        AppTransitions.adaptive(state, const EditProfilePage()),
  ),
  GoRoute(
    path: AppRoutes.notificationPreferences,
    pageBuilder: (context, state) =>
        AppTransitions.adaptive(state, const NotificationPreferencesPage()),
  ),
  GoRoute(
    path: AppRoutes.accessibility,
    pageBuilder: (context, state) =>
        AppTransitions.adaptive(state, const AccessibilityPage()),
  ),
  GoRoute(
    path: AppRoutes.rewards,
    pageBuilder: (context, state) =>
        AppTransitions.adaptive(state, const RewardsPage()),
  ),
  GoRoute(
    path: AppRoutes.language,
    pageBuilder: (context, state) =>
        AppTransitions.adaptive(state, const LanguagePage()),
  ),
  GoRoute(
    path: AppRoutes.notificationChannelPath,
    pageBuilder: (context, state) => AppTransitions.adaptive(
      state,
      NotificationChannelPage(channel: state.pathParameters['channel']!),
    ),
  ),
];
