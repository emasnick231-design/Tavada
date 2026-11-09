import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/profile/presentation/widgets/profile_widgets.dart';
import 'package:tavada_eats/features/support/domain/entities/help.dart';
import 'package:tavada_eats/features/support/domain/repositories/support_repositories.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// "How can we help?" — help topics.
class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  ViewStatus _status = ViewStatus.loading;
  List<HelpTopic> _topics = const [];
  Failure? _failure;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    setState(() => _status = ViewStatus.loading);
    final result = await sl<HelpRepository>().getTopics();
    if (!mounted) return;
    setState(() {
      result.fold(
        (f) {
          _status = ViewStatus.failure;
          _failure = f;
        },
        (topics) {
          _status = ViewStatus.success;
          _topics = topics;
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (_status.isFailure) {
      return AppScaffold(
        appBar: const AppTopBar(),
        body: ErrorStateView(failure: _failure, onRetry: _load),
      );
    }
    final loading = !_status.isSuccess;
    final topics = loading
        ? List.generate(
            5,
            (i) => HelpTopic(id: '$i', title: 'Order damage or quality'),
          )
        : _topics;
    return AccountFormScaffold(
      largeTitle: true,
      title: l10n.helpTitle,
      subtitle: l10n.helpSubtitle,
      children: [
        for (final topic in topics)
          AppSkeleton(
            enabled: loading,
            child: SettingsRow(
              verticalPadding: AppSpacing.xxl,
              label: topic.title,
              onTap: () => context.push(AppRoutes.helpTopic(topic.id)),
            ),
          ),
      ],
    );
  }
}
