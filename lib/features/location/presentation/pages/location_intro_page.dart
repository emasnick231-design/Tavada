import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/models/geo_point.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/location/domain/repositories/location_repository.dart';
import 'package:tavada_eats/features/location/presentation/location_flow.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// "Howfa naw! Where do you stay?" — asks for the device location.
class LocationIntroPage extends StatefulWidget {
  const LocationIntroPage({super.key});

  @override
  State<LocationIntroPage> createState() => _LocationIntroPageState();
}

class _LocationIntroPageState extends State<LocationIntroPage> {
  bool _locating = false;

  Future<void> _findMe() async {
    setState(() => _locating = true);
    final result = await findDeviceLocation(context);
    if (!mounted) return;
    setState(() => _locating = false);
    if (result == null) return;
    unawaited(
      context.push(
        AppRoutes.locationPicker,
        extra: LocationPickerArgs(center: result),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppScaffold(
      backgroundColor: AppColors.primary100,
      // Spacers keep the Figma positions on phones; on short screens or
      // with large text the page scrolls instead of overflowing.
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.gutter,
              AppSpacing.md,
              AppSpacing.gutter,
              AppSpacing.lg,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    constraints.maxHeight - AppSpacing.md - AppSpacing.lg,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    // Search alternative lives top-right so the illustration,
                    // copy and CTA keep their Figma positions.
                    Align(
                      alignment: Alignment.centerRight,
                      child: AppLinkButton(
                        label: l10n.locationSearchInstead,
                        underline: true,
                        style: AppTypography.labelMedium,
                        onPressed: () => context.push(
                          AppRoutes.locationPicker,
                          extra: const LocationPickerArgs(),
                        ),
                      ),
                    ),
                    const Spacer(flex: 6),
                    ClipOval(
                      child: Assets.images.illustrations.locationScooter.image(
                        width: 168,
                        height: 168,
                        fit: BoxFit.cover,
                      ),
                    ).popIn(),
                    const SizedBox(height: AppSpacing.xxl),
                    Transform.rotate(
                      angle: -0.06,
                      child: Column(
                        children: [
                          Text(
                            l10n.locationIntroShout,
                            style: AppTypography.brandShout.copyWith(
                              fontSize: 48,
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(0, -10),
                            child: Text(
                              l10n.locationIntroTitle,
                              style: AppTypography.headlineLarge.copyWith(
                                fontWeight: FontWeight.w800,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).entrance(index: 1),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      l10n.locationIntroBody,
                      textAlign: TextAlign.center,
                      style: AppTypography.paragraph,
                    ).entrance(index: 2),
                    const Spacer(flex: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.xs,
                      ),
                      child: AppButton(
                        label: l10n.locationFindMe,
                        isLoading: _locating,
                        onPressed: _findMe,
                      ).entrance(index: 3),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Reads the device position, explaining what to do when it isn't
/// available. Returns `null` when the user should stay where they are.
Future<GeoPoint?> findDeviceLocation(BuildContext context) async {
  final repository = sl<LocationRepository>();
  final result = await repository.currentPosition();
  if (!context.mounted) return null;
  return result.fold((issue) async {
    final l10n = context.l10n;
    switch (issue) {
      case LocationIssue.serviceDisabled:
      case LocationIssue.deniedForever:
        final disabled = issue == LocationIssue.serviceDisabled;
        final openSettings = await showDialog<bool>(
          context: context,
          builder: (dialogContext) => AppDialog(
            title: disabled
                ? l10n.locationServiceDisabledTitle
                : l10n.locationDeniedForeverTitle,
            message: disabled
                ? l10n.locationServiceDisabledMessage
                : l10n.locationDeniedForeverMessage,
            actions: [
              AppButton(
                label: l10n.locationOpenSettings,
                onPressed: () => Navigator.pop(dialogContext, true),
              ),
              AppButton.secondary(
                label: l10n.locationChooseOnMap,
                onPressed: () => Navigator.pop(dialogContext, false),
              ),
            ],
          ),
        );
        if (openSettings ?? false) {
          await repository.openSettings(issue);
          return null;
        }
        return openSettings == null ? null : defaultMapCenter;
      case LocationIssue.denied:
      case LocationIssue.unavailable:
        AppToast.show(context, l10n.locationFallbackToast);
        return defaultMapCenter;
    }
  }, (point) async => point);
}
