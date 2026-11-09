import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/session/session_cubit.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Background of the hero photo, used to paint over its baked-in status bar.
const _heroBackground = Color(0xFFD6582F);

/// "ALWAYS AFRICAN ANYWHERE" — first screen for signed-out users.
///
/// The bottom sheet starts with "Get started" / "Log in" and expands into
/// the sign-up providers (Apple, Google, Email).
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _showProviders = false;

  void _continueAsGuest() {
    context.read<SessionCubit>().continueAsGuest();
    context.go(AppRoutes.home);
  }

  void _comingSoon(String feature) => AppToast.show(
    context,
    context.l10n.commonComingSoonMessage(feature),
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final width = MediaQuery.sizeOf(context).width;
    final top = MediaQuery.paddingOf(context).top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: PopScope(
        canPop: !_showProviders,
        onPopInvokedWithResult: (didPop, _) {
          if (!didPop) setState(() => _showProviders = false);
        },
        child: Scaffold(
          backgroundColor: _heroBackground,
          body: Stack(
            children: [
              // Figma crops the photo ~25pt higher (bowl top at y≈288).
              Positioned(
                top: -25,
                left: 0,
                right: 0,
                child: Assets.images.onboarding.welcomeHero.image(
                  width: width,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
              // Hides the screenshot status bar baked into the photo.
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: width * 0.16 - 25,
                child: const ColoredBox(color: _heroBackground),
              ),
              Positioned(
                top: top + 9,
                left: AppSpacing.xl,
                right: AppSpacing.xl,
                child: Row(
                  children: [
                    const _LogoMark(),
                    const Spacer(),
                    AppLinkButton(
                      label: l10n.onboardingContinueAsGuest,
                      underline: true,
                      color: AppColors.white,
                      onPressed: _continueAsGuest,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: top + 110,
                left: AppSpacing.gutter,
                right: AppSpacing.gutter,
                child: Column(
                  children: [
                    Text(
                      l10n.onboardingHeadlineTop,
                      textAlign: TextAlign.center,
                      style: AppTypography.brandHero,
                    ),
                    Text(
                      l10n.onboardingHeadlineBottom,
                      textAlign: TextAlign.center,
                      style: AppTypography.brandHero.copyWith(
                        color: AppColors.primary400,
                      ),
                    ),
                  ],
                ).entrance(offsetY: 0.2),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _WelcomeSheet(
                  showProviders: _showProviders,
                  onGetStarted: () => setState(() => _showProviders = true),
                  onLogIn: () => context.push(AppRoutes.login),
                  onApple: () => _comingSoon(l10n.onboardingAppleSignIn),
                  onGoogle: () => _comingSoon(l10n.onboardingGoogleSignIn),
                  onEmail: () => context.push(AppRoutes.signUpEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeSheet extends StatelessWidget {
  const _WelcomeSheet({
    required this.showProviders,
    required this.onGetStarted,
    required this.onLogIn,
    required this.onApple,
    required this.onGoogle,
    required this.onEmail,
  });

  final bool showProviders;
  final VoidCallback onGetStarted;
  final VoidCallback onLogIn;
  final VoidCallback onApple;
  final VoidCallback onGoogle;
  final VoidCallback onEmail;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final bottom = MediaQuery.paddingOf(context).bottom;

    final Widget content = showProviders
        ? Column(
            key: const ValueKey('providers'),
            children: [
              AppButton.dark(
                label: l10n.onboardingContinueWithApple,
                leading: AppIcon(
                  Assets.icons.logoApple,
                  color: AppColors.white,
                ),
                onPressed: onApple,
              ),
              const SizedBox(height: AppSpacing.md),
              AppButton.secondary(
                label: l10n.onboardingContinueWithGoogle,
                leading: AppIcon.original(Assets.icons.logoGoogle),
                onPressed: onGoogle,
              ),
              const SizedBox(height: AppSpacing.md),
              AppButton.secondary(
                label: l10n.onboardingContinueWithEmail,
                leading: AppIcon(Assets.icons.letterLinear),
                onPressed: onEmail,
              ),
            ],
          )
        : Column(
            key: const ValueKey('start'),
            children: [
              AppButton(
                label: l10n.onboardingGetStarted,
                onPressed: onGetStarted,
              ),
              const SizedBox(height: AppSpacing.md),
              AppButton.secondary(
                label: l10n.onboardingLogIn,
                onPressed: onLogIn,
              ),
              const SizedBox(height: AppSpacing.xxxl),
              const LegalConsentText(breakBeforeAnd: true),
            ],
          );

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadii.sheetTop,
      ),
      padding: EdgeInsets.fromLTRB(
        AppSpacing.xl,
        AppSpacing.lg,
        AppSpacing.xl,
        bottom + AppSpacing.xl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: AppSizes.dragHandleWidth,
            height: AppSizes.dragHandleHeight,
            decoration: BoxDecoration(
              color: colors.border,
              borderRadius: AppRadii.pillAll,
            ),
          ),
          const SizedBox(height: AppSpacing.xxxl),
          AnimatedSize(
            duration: AppDurations.normal,
            curve: AppCurves.emphasized,
            alignment: Alignment.topCenter,
            child: AnimatedSwitcher(
              duration: AppDurations.normal,
              switchInCurve: AppCurves.standard,
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween(
                    begin: const Offset(0, 0.06),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              ),
              child: content,
            ),
          ),
        ],
      ),
    ).entrance(offsetY: 0.3, delay: AppDurations.fast);
  }
}

/// The brand mark: rounded square in Primary/800 with a white dot.
class _LogoMark extends StatelessWidget {
  const _LogoMark();

  static const double _size = 48;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: AppColors.primary800,
        borderRadius: BorderRadius.circular(_size * 0.3),
      ),
      alignment: Alignment.center,
      child: Container(
        width: _size * 0.375,
        height: _size * 0.375,
        decoration: const BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
