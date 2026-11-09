import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/shared/widgets/buttons/app_button.dart';
import 'package:tavada_eats/shared/widgets/media/app_image.dart';

/// Friendly empty state: floating illustration, title, message and an
/// optional action ("Search menu — Find your favourite dish…").
class EmptyState extends StatelessWidget {
  const EmptyState({
    required this.title,
    super.key,
    this.message,
    this.image,
    this.illustration,
    this.imageSize = 64,
    this.actionLabel,
    this.onAction,
    this.compact = false,
    this.alignment = Alignment.center,
  });

  final String title;
  final String? message;

  /// Asset path / URL rendered with [AppImage].
  final String? image;

  /// Custom widget instead of [image].
  final Widget? illustration;
  final double imageSize;
  final String? actionLabel;
  final VoidCallback? onAction;

  /// Reduced paddings for inline usage inside lists.
  final bool compact;

  /// Where the block sits in the available space (Figma places some empty
  /// states in the upper part of the screen).
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final art =
        illustration ??
        (image == null
            ? null
            : AppImage(
                image!,
                width: imageSize,
                height: imageSize,
                fit: BoxFit.contain,
              ));
    return Align(
          alignment: alignment,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.huge,
              vertical: compact ? AppSpacing.xxl : AppSpacing.massive,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (art != null) ...[
                  art
                      .animate(onPlay: (c) => c.repeat(reverse: true))
                      .moveY(
                        begin: 0,
                        end: -6,
                        duration: 1600.ms,
                        curve: Curves.easeInOut,
                      ),
                  const SizedBox(height: AppSpacing.lg),
                ],
                Text(
                  title,
                  style: AppTypography.titleMedium,
                  textAlign: TextAlign.center,
                ),
                if (message != null) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    message!,
                    style: AppTypography.bodyMedium.copyWith(
                      color: colors.textSecondary,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
                if (actionLabel != null && onAction != null) ...[
                  const SizedBox(height: AppSpacing.xl),
                  AppButton.tonal(
                    label: actionLabel!,
                    size: AppButtonSize.md,
                    onPressed: onAction,
                  ),
                ],
              ],
            ),
          ),
        )
        .animate()
        .fadeIn(duration: AppDurations.slow)
        .scale(
          begin: const Offset(0.96, 0.96),
          end: const Offset(1, 1),
          duration: AppDurations.slow,
          curve: AppCurves.emphasized,
        );
  }
}
