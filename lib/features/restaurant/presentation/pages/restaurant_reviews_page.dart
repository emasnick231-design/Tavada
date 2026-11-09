import 'dart:async';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/core/utils/formatters.dart';
import 'package:tavada_eats/features/catalog/domain/entities/review.dart';
import 'package:tavada_eats/features/restaurant/presentation/bloc/reviews_cubit.dart';
import 'package:tavada_eats/features/restaurant/presentation/widgets/restaurant_widgets.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Rating breakdown, AI summary and the customer comments.
class RestaurantReviewsPage extends StatelessWidget {
  const RestaurantReviewsPage({required this.restaurantId, super.key});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = ReviewsCubit(sl(), restaurantId);
        unawaited(cubit.load());
        return cubit;
      },
      child: const _ReviewsView(),
    );
  }
}

class _ReviewsView extends StatelessWidget {
  const _ReviewsView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final cubit = context.read<ReviewsCubit>();
    return AppScaffold(
      appBar: AppTopBar(title: l10n.reviewsTitle, alwaysShowDivider: true),
      body: BlocBuilder<ReviewsCubit, ReviewsState>(
        builder: (context, state) {
          final summary = state.summary;
          return AsyncView(
            status: state.status,
            failure: state.failure,
            onRetry: cubit.load,
            isEmpty: summary == null,
            loading: const Center(child: CircularProgressIndicator()),
            builder: (_) => NotificationListener<ScrollNotification>(
              onNotification: (n) {
                if (n.metrics.extentAfter < 400) unawaited(cubit.loadMore());
                return false;
              },
              child: ListView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.paddingOf(context).bottom + AppSpacing.xl,
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.gutter),
                    child: _Summary(summary: summary!),
                  ),
                  if (summary.aiSummary != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        AppSpacing.gutter,
                        0,
                        AppSpacing.gutter,
                        AppSpacing.xxl,
                      ),
                      child: AiSummaryCard(
                        summary: summary.aiSummary!,
                        trailing: const _SummaryFeedback(),
                      ),
                    ),
                  ColoredBox(
                    color: colors.surfaceMuted,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SectionHeader(title: l10n.reviewsComments),
                        if (state.reviews.isEmpty)
                          EmptyState(
                            title: l10n.reviewsEmptyTitle,
                            message: l10n.reviewsEmptyMessage,
                            compact: true,
                          ),
                        for (var i = 0; i < state.reviews.length; i++)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              AppSpacing.gutter,
                              0,
                              AppSpacing.gutter,
                              AppSpacing.md,
                            ),
                            child: _ReviewCard(
                              review: state.reviews[i],
                            ).entrance(index: i),
                          ),
                        if (state.isLoadingMore)
                          const Padding(
                            padding: EdgeInsets.all(AppSpacing.lg),
                            child: Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          ),
                        const SizedBox(height: AppSpacing.lg),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Summary extends StatelessWidget {
  const _Summary({required this.summary});

  final ReviewSummary summary;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Text(
                summary.average.toStringAsFixed(1),
                style: AppTypography.displaySmall,
              ),
              const SizedBox(height: AppSpacing.xs),
              RatingStars(rating: summary.average),
              const SizedBox(height: AppSpacing.xs),
              Text(
                context.l10n.reviewsCount(summary.total),
                style: AppTypography.bodySmall.copyWith(
                  color: colors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.lg),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              for (var stars = 5; stars >= 1; stars--)
                // Figma: 20pt row pitch.
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 14,
                        child: Text('$stars', style: AppTypography.bodySmall),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: AppRadii.pillAll,
                          child: TweenAnimationBuilder<double>(
                            tween: Tween(begin: 0, end: summary.share(stars)),
                            duration: AppDurations.slower,
                            curve: AppCurves.emphasized,
                            builder: (_, value, _) => LinearProgressIndicator(
                              value: value,
                              minHeight: 4,
                              color: colors.brand,
                              backgroundColor: colors.surfaceMuted,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

/// 👍 / 👎 on the AI summary.
class _SummaryFeedback extends StatefulWidget {
  const _SummaryFeedback();

  @override
  State<_SummaryFeedback> createState() => _SummaryFeedbackState();
}

class _SummaryFeedbackState extends State<_SummaryFeedback> {
  bool? _helpful;

  void _vote({required bool helpful}) {
    setState(() => _helpful = _helpful == helpful ? null : helpful);
    if (_helpful != null) {
      AppToast.show(context, context.l10n.reviewsThanksFeedback);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    Widget button({required bool helpful}) {
      final active = _helpful == helpful;
      // Figma "Likes": filled thumbs, grey idle / orange active.
      final icon = helpful ? Assets.icons.likeBold : Assets.icons.dislikeBold;
      return GestureDetector(
        onTap: () => _vote(helpful: helpful),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          child:
              AppIcon(
                    icon,
                    size: AppSizes.iconMd,
                    color: active ? colors.brand : colors.textDisabled,
                  )
                  .animate(key: ValueKey(active))
                  .scale(
                    begin: const Offset(0.8, 0.8),
                    end: const Offset(1, 1),
                    duration: AppDurations.normal,
                    curve: AppCurves.spring,
                  ),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [button(helpful: false), button(helpful: true)],
    );
  }
}

class _ReviewCard extends StatefulWidget {
  const _ReviewCard({required this.review});

  final Review review;

  @override
  State<_ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<_ReviewCard> {
  bool _expanded = false;

  static const _gradients = [
    [Color(0xFFFFB6C1), Color(0xFFFFE29F)],
    [Color(0xFFA0C4FF), Color(0xFFFFC6FF)],
    [Color(0xFFB9FBC0), Color(0xFF98F5E1)],
    [Color(0xFFFFD6A5), Color(0xFFFDFFB6)],
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final r = widget.review;
    final body = AppTypography.caption.copyWith(
      color: colors.textSecondary,
    );
    final long = r.comment.length > 110;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadii.xlAll,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: _gradients[r.avatarSeed % _gradients.length],
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              RatingStars(rating: r.rating.toDouble(), size: 18),
              const Spacer(),
              Text(
                Formatters.relative(r.createdAt, l10n),
                style: AppTypography.caption.copyWith(
                  color: colors.textTertiary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          AnimatedSize(
            duration: AppDurations.normal,
            alignment: Alignment.topLeft,
            child: Text(
              r.comment,
              maxLines: _expanded ? null : 2,
              overflow: _expanded ? null : TextOverflow.ellipsis,
              style: body,
            ),
          ),
          if (long) ...[
            const SizedBox(height: AppSpacing.sm),
            AppLinkButton(
              label: _expanded ? l10n.commonShowLess : l10n.commonReadMore,
              style: AppTypography.labelMedium,
              onPressed: () => setState(() => _expanded = !_expanded),
            ),
          ],
          if (r.restaurantReply != null) ...[
            const SizedBox(height: AppSpacing.md),
            Divider(height: 1, color: colors.divider),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                AppIcon(
                  Assets.icons.chefHatLinear,
                  size: AppSizes.iconSm,
                  color: colors.brand,
                ),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  l10n.reviewsRestaurantReply,
                  style: AppTypography.labelMedium,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: colors.surfaceMuted,
                borderRadius: AppRadii.lgAll,
              ),
              child: Text(r.restaurantReply!, style: body),
            ),
          ],
        ],
      ),
    );
  }
}
