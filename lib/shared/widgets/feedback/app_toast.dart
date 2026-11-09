import 'dart:async';
import 'dart:ui' show ImageFilter;

import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/core/utils/haptics.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/media/app_icon.dart';

enum ToastType { success, error, info }

/// Frosted floating toast that slides in from the top.
///
/// ```dart
/// AppToast.show(context, 'Added to basket', type: ToastType.success);
/// ```
abstract final class AppToast {
  static OverlayEntry? _current;
  static Timer? _timer;

  static void show(
    BuildContext context,
    String message, {
    ToastType type = ToastType.info,
    Duration duration = const Duration(milliseconds: 2600),
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    final overlay = Overlay.maybeOf(context, rootOverlay: true);
    if (overlay == null) return;
    dismiss();
    switch (type) {
      case ToastType.success:
        Haptics.success();
      case ToastType.error:
        Haptics.error();
      case ToastType.info:
        Haptics.light();
    }
    final entry = OverlayEntry(
      builder: (_) => _ToastView(
        message: message,
        type: type,
        actionLabel: actionLabel,
        onAction: onAction == null
            ? null
            : () {
                dismiss();
                onAction();
              },
        onDismiss: dismiss,
      ),
    );
    _current = entry;
    overlay.insert(entry);
    _timer = Timer(duration, dismiss);
  }

  static void dismiss() {
    _timer?.cancel();
    _timer = null;
    _current?.remove();
    _current = null;
  }
}

class _ToastView extends StatelessWidget {
  const _ToastView({
    required this.message,
    required this.type,
    required this.onDismiss,
    this.actionLabel,
    this.onAction,
  });

  final String message;
  final ToastType type;
  final String? actionLabel;
  final VoidCallback? onAction;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.viewPaddingOf(context).top + AppSpacing.sm;
    final (icon, tint) = switch (type) {
      ToastType.success => (Assets.icons.checkCircleBold, AppColors.success500),
      ToastType.error => (Assets.icons.dangerCircleLinear, AppColors.error500),
      ToastType.info => (Assets.icons.infoCircleBold, AppColors.primary400),
    };
    return Positioned(
      top: top,
      left: AppSpacing.gutter,
      right: AppSpacing.gutter,
      child:
          SafeArea(
                bottom: false,
                top: false,
                child: Dismissible(
                  key: const ValueKey('toast'),
                  direction: DismissDirection.up,
                  onDismissed: (_) => onDismiss(),
                  child: ClipRRect(
                    borderRadius: AppRadii.xxlAll,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: AppBlur.lg,
                        sigmaY: AppBlur.lg,
                      ),
                      child: Material(
                        color: AppColors.gray950.withValues(alpha: 0.86),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.lg,
                            vertical: AppSpacing.md + 2,
                          ),
                          child: Row(
                            children: [
                              AppIcon(icon, size: AppSizes.iconMd, color: tint),
                              const SizedBox(width: AppSpacing.md),
                              Expanded(
                                child: Text(
                                  message,
                                  style: AppTypography.bodyMedium.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              if (actionLabel != null)
                                GestureDetector(
                                  onTap: onAction,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: AppSpacing.md,
                                    ),
                                    child: Text(
                                      actionLabel!,
                                      style: AppTypography.labelLarge.copyWith(
                                        color: AppColors.primary300,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .animate()
              .fadeIn(duration: AppDurations.fast)
              .slideY(
                begin: -0.6,
                end: 0,
                duration: AppDurations.slow,
                curve: AppCurves.spring,
              ),
    );
  }
}
