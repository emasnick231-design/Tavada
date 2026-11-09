import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/flavor/flavor_config.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Layout shared by every auth step: back button (+ optional top-right
/// link), bold title, supporting copy and the form, all top aligned and
/// scrollable so the keyboard never causes overflow.
class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    required this.title,
    required this.children,
    super.key,
    this.subtitle,
    this.topAction,
    this.onBack,
  });

  final String title;
  final String? subtitle;
  final List<Widget> children;
  final Widget? topAction;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.gutter,
            AppSpacing.lg,
            AppSpacing.gutter,
            AppSpacing.xxl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  AppBackButton(onPressed: onBack),
                  const Spacer(),
                  ?topAction,
                ],
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(title, style: AppTypography.headlineMedium).entrance(),
              if (subtitle != null) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  subtitle!,
                  style: AppTypography.paragraph,
                ).entrance(index: 1),
              ],
              const SizedBox(height: AppSpacing.lg),
              // Figma: fields and CTAs sit on a 20pt gutter (335pt wide)
              // while the heading keeps the 16pt one.
              for (var i = 0; i < children.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xs,
                  ),
                  child: children[i].entrance(index: i + 2, offsetY: 0.04),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// "Have an account? Log in" style footer.
class AuthFooterLink extends StatelessWidget {
  const AuthFooterLink({
    required this.prompt,
    required this.action,
    required this.onPressed,
    super.key,
  });

  final String prompt;
  final String action;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.lg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            prompt,
            style: AppTypography.bodyMedium.copyWith(
              color: context.colors.textSecondary,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          AppLinkButton(label: action, onPressed: onPressed),
        ],
      ),
    );
  }
}

/// Subtle helper shown only outside prod (demo credentials, OTP code).
class DevTip extends StatelessWidget {
  const DevTip(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    if (sl<FlavorConfig>().isProd) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.md),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTypography.caption.copyWith(
          color: context.colors.textTertiary,
        ),
      ),
    );
  }
}

/// Inline error under a form (animated in/out).
class AuthErrorText extends StatelessWidget {
  const AuthErrorText(this.message, {super.key});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: AppDurations.fast,
      alignment: Alignment.topLeft,
      child: message == null
          ? const SizedBox(width: double.infinity)
          : Padding(
              padding: const EdgeInsets.only(top: AppSpacing.sm),
              child: Text(
                message!,
                style: AppTypography.bodySmall.copyWith(
                  color: context.colors.error,
                ),
              ),
            ),
    );
  }
}
