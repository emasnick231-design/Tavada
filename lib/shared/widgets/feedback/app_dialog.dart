import 'dart:ui' show ImageFilter;

import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/shared/widgets/buttons/app_button.dart';

/// Shows [builder] as a centered card over a blurred backdrop with a
/// scale + fade entrance.
Future<T?> showAppDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
}) {
  final scrim = context.colors.scrim;
  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.transparent,
    transitionDuration: AppDurations.normal,
    pageBuilder: (context, _, _) => builder(context),
    transitionBuilder: (context, animation, _, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: AppCurves.emphasized,
        reverseCurve: Curves.easeIn,
      );
      return Stack(
        children: [
          Positioned.fill(
            child: IgnorePointer(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: AppBlur.sm * curved.value,
                  sigmaY: AppBlur.sm * curved.value,
                ),
                child: ColoredBox(
                  color: scrim.withValues(alpha: scrim.a * curved.value),
                ),
              ),
            ),
          ),
          FadeTransition(
            opacity: curved,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.9, end: 1).animate(curved),
              child: child,
            ),
          ),
        ],
      );
    },
  );
}

/// Yes/No confirmation. Resolves to `true` when confirmed.
Future<bool> showConfirmDialog({
  required BuildContext context,
  required String title,
  required String message,
  String? confirmLabel,
  String? cancelLabel,
  bool isDestructive = false,
}) async {
  final result = await showAppDialog<bool>(
    context: context,
    builder: (context) => AppDialog(
      title: title,
      message: message,
      actions: [
        AppButton.secondary(
          label: cancelLabel ?? context.l10n.commonCancel,
          size: AppButtonSize.lg,
          onPressed: () => Navigator.of(context).pop(false),
        ),
        AppButton(
          label: confirmLabel ?? context.l10n.commonConfirm,
          size: AppButtonSize.lg,
          variant: isDestructive
              ? AppButtonVariant.dark
              : AppButtonVariant.primary,
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    ),
  );
  return result ?? false;
}

/// Dialog card used by [showConfirmDialog]; reusable for custom dialogs.
class AppDialog extends StatelessWidget {
  const AppDialog({
    required this.title,
    super.key,
    this.message,
    this.icon,
    this.content,
    this.actions = const [],
  });

  final String title;
  final String? message;
  final Widget? icon;
  final Widget? content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Material(
          color: colors.surface,
          borderRadius: AppRadii.xxxlAll,
          clipBehavior: Clip.antiAlias,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xxl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(height: AppSpacing.lg),
                  ],
                  Text(
                    title,
                    style: AppTypography.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  if (message != null) ...[
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      message!,
                      style: AppTypography.paragraph,
                      textAlign: TextAlign.center,
                    ),
                  ],
                  if (content != null) ...[
                    const SizedBox(height: AppSpacing.lg),
                    content!,
                  ],
                  if (actions.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.xxl),
                    Row(
                      children: [
                        for (var i = 0; i < actions.length; i++) ...[
                          if (i > 0) const SizedBox(width: AppSpacing.md),
                          Expanded(child: actions[i]),
                        ],
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
