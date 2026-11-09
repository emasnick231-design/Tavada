import 'package:go_router/go_router.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/app/router/app_transitions.dart';
import 'package:tavada_eats/features/support/presentation/pages/help_article_page.dart';
import 'package:tavada_eats/features/support/presentation/pages/help_center_page.dart';
import 'package:tavada_eats/features/support/presentation/pages/help_topic_page.dart';
import 'package:tavada_eats/features/support/presentation/pages/support_chat_page.dart';

/// Help centre and support chat routes.
final supportRoutes = <RouteBase>[
  GoRoute(
    path: AppRoutes.help,
    pageBuilder: (context, state) =>
        AppTransitions.adaptive(state, const HelpCenterPage()),
  ),
  GoRoute(
    path: AppRoutes.helpTopicPath,
    pageBuilder: (context, state) => AppTransitions.adaptive(
      state,
      HelpTopicPage(topicId: state.pathParameters['topicId']!),
    ),
  ),
  GoRoute(
    path: AppRoutes.helpArticlePath,
    pageBuilder: (context, state) => AppTransitions.adaptive(
      state,
      HelpArticlePage(articleId: state.pathParameters['articleId']!),
    ),
  ),
  GoRoute(
    path: AppRoutes.supportChat,
    pageBuilder: (context, state) =>
        AppTransitions.adaptive(state, const SupportChatPage()),
  ),
];
