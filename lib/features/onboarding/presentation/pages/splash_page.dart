import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/flavor/flavor_config.dart';
import 'package:tavada_eats/app/router/app_router.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/models/models.dart';
import 'package:tavada_eats/core/session/session_cubit.dart';
import 'package:tavada_eats/core/theme/theme.dart';

/// Animated launch screen that continues seamlessly from the native splash
/// (same brand orange + logo mark), reveals the wordmark, then routes to the
/// right place for the current session.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _maybeSkipOnboarding();
    _timer = Timer(const Duration(milliseconds: 2100), _continue);
  }

  /// Dev shortcut: `--dart-define=SKIP_ONBOARDING=true` lands on Home as a
  /// guest with a demo address (handy for QA and screenshots).
  void _maybeSkipOnboarding() {
    if (!sl<FlavorConfig>().skipOnboarding) return;
    final session = context.read<SessionCubit>();
    if (!session.state.hasCompletedWelcome) session.continueAsGuest();
    if (session.state.needsAddress) {
      session.setAddress(
        const DeliveryAddress(
          id: 'demo',
          line1: '23, Fredrick Avenue',
          line2: 'Peckham SE15 5JT',
          city: 'London',
          country: 'United Kingdom',
          location: GeoPoint(latitude: 51.4740, longitude: -0.0690),
        ),
      );
    }
  }

  void _continue() {
    if (!mounted) return;
    context.go(sl<AppRouter>().launchDestination);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.primary600,
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Soft radial glow that breathes behind the mark.
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [AppColors.primary500, AppColors.primary600],
                  radius: 0.9,
                ),
              ),
            ).animate().fadeIn(duration: 900.ms),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const _LogoMark(size: 112)
                      .animate()
                      .scale(
                        begin: const Offset(0.86, 0.86),
                        end: const Offset(1, 1),
                        duration: 700.ms,
                        curve: AppCurves.spring,
                      )
                      .then(delay: 150.ms)
                      .shimmer(duration: 900.ms, color: AppColors.primary300),
                  const SizedBox(height: AppSpacing.xxl),
                  Text(
                        l10n.appName.toUpperCase(),
                        style: AppTypography.brandHero.copyWith(fontSize: 40),
                      )
                      .animate(delay: 450.ms)
                      .fadeIn(duration: 500.ms)
                      .slideY(
                        begin: 0.4,
                        end: 0,
                        curve: AppCurves.emphasized,
                        duration: 600.ms,
                      ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    l10n.appTagline,
                    style: AppTypography.bodyLarge.copyWith(
                      color: AppColors.primary100,
                      fontWeight: FontWeight.w600,
                    ),
                  ).animate(delay: 800.ms).fadeIn(duration: 500.ms),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The brand mark: rounded square in Primary/800 with a white dot.
class _LogoMark extends StatelessWidget {
  const _LogoMark({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.primary800,
        borderRadius: BorderRadius.circular(size * 0.3),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary950.withValues(alpha: 0.35),
            blurRadius: 30,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      alignment: Alignment.center,
      child:
          Container(
                width: size * 0.375,
                height: size * 0.375,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
              )
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .scale(
                begin: const Offset(1, 1),
                end: const Offset(1.12, 1.12),
                duration: 900.ms,
                curve: Curves.easeInOut,
              ),
    );
  }
}
