import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/buttons/app_button.dart';
import 'package:tavada_eats/shared/widgets/media/app_icon.dart';

/// Error view with a localized message derived from a [Failure] and a retry
/// button. Offline failures get a dedicated cloud icon.
class ErrorStateView extends StatelessWidget {
  const ErrorStateView({
    super.key,
    this.failure,
    this.message,
    this.onRetry,
    this.compact = false,
  });

  final Failure? failure;
  final String? message;
  final VoidCallback? onRetry;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    final isOffline = failure is NetworkFailure;
    // Retrying a 404 can't help: offer a way out instead.
    final notFound = failure is NotFoundFailure;
    final text =
        message ?? failure?.localizedMessage(l10n) ?? l10n.errorUnexpected;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.huge,
          vertical: compact ? AppSpacing.xxl : AppSpacing.massive,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: colors.brandSubtle,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: AppIcon(
                isOffline
                    ? Assets.icons.cloudCrossLinear
                    : Assets.icons.sadCircleLinear,
                size: AppSizes.iconXl,
                color: colors.brand,
              ),
            ).animate().scale(
              begin: const Offset(0.6, 0.6),
              end: const Offset(1, 1),
              duration: AppDurations.slow,
              curve: AppCurves.spring,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(l10n.errorTitle, style: AppTypography.titleMedium),
            const SizedBox(height: AppSpacing.xs),
            Text(
              text,
              style: AppTypography.bodyMedium.copyWith(
                color: colors.textSecondary,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            if (notFound) ...[
              const SizedBox(height: AppSpacing.xl),
              AppButton.tonal(
                label: l10n.errorGoHome,
                size: AppButtonSize.md,
                onPressed: () => context.go('/home'),
              ),
            ] else if (onRetry != null) ...[
              const SizedBox(height: AppSpacing.xl),
              AppButton.tonal(
                label: l10n.commonRetry,
                size: AppButtonSize.md,
                onPressed: onRetry,
              ),
            ],
          ],
        ),
      ),
    ).animate().fadeIn(duration: AppDurations.normal);
  }
}
