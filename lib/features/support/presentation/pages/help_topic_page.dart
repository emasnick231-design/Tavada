import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/profile/presentation/widgets/profile_widgets.dart';
import 'package:tavada_eats/features/support/domain/entities/help.dart';
import 'package:tavada_eats/features/support/domain/repositories/support_repositories.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Articles of one help topic.
class HelpTopicPage extends StatefulWidget {
  const HelpTopicPage({required this.topicId, super.key});

  final String topicId;

  @override
  State<HelpTopicPage> createState() => _HelpTopicPageState();
}

class _HelpTopicPageState extends State<HelpTopicPage> {
  ViewStatus _status = ViewStatus.loading;
  HelpTopic? _topic;
  Failure? _failure;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    setState(() => _status = ViewStatus.loading);
    final result = await sl<HelpRepository>().getTopic(widget.topicId);
    if (!mounted) return;
    setState(() {
      result.fold(
        (f) {
          _status = ViewStatus.failure;
          _failure = f;
        },
        (topic) {
          _status = ViewStatus.success;
          _topic = topic;
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final topic = _topic;
    if (_status.isFailure || topic == null) {
      return AppScaffold(
        appBar: const AppTopBar(),
        body: _status.isFailure
            ? ErrorStateView(failure: _failure, onRetry: _load)
            : const Center(child: CircularProgressIndicator()),
      );
    }
    return AccountFormScaffold(
      largeTitle: true,
      title: topic.title,
      children: [
        for (final article in topic.articles)
          SettingsRow(
            verticalPadding: AppSpacing.xxl,
            label: article.title,
            onTap: () => context.push(AppRoutes.helpArticle(article.id)),
          ),
      ],
    );
  }
}
