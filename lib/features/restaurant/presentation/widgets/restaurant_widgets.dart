import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/session/session_cubit.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/core/utils/formatters.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Delivery Time | Cuisine | Delivery fee — the outlined stats strip.
class RestaurantStats extends StatelessWidget {
  const RestaurantStats({required this.restaurant, super.key});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final r = restaurant;
    final value = AppTypography.labelMedium;
    // Scale-down keeps each cell on one line at large text / long locales.
    Widget cell(String label, Widget child) => Expanded(
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              style: AppTypography.bodySmall.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xxs),
          FittedBox(fit: BoxFit.scaleDown, child: child),
        ],
      ),
    );
    Widget divider() => Container(width: 1, height: 32, color: colors.divider);
    // Figma: 58pt strip, 12pt labels and SemiBold 12 values.
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: AppRadii.pillAll,
        border: Border.all(color: colors.border),
      ),
      child: Row(
        children: [
          cell(
            l10n.restaurantDeliveryTime,
            Text(l10n.commonMinutesLong(r.etaMinutes), style: value),
          ),
          divider(),
          cell(
            l10n.restaurantCuisine,
            Text(r.cuisine, style: value, maxLines: 1),
          ),
          divider(),
          cell(
            l10n.restaurantDeliveryFee,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (r.originalDeliveryFee != null) ...[
                  Text(
                    r.originalDeliveryFee!.format(),
                    style: AppTypography.bodySmall.copyWith(
                      color: colors.textTertiary,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                ],
                Text(
                  r.deliveryFee.isZero
                      ? l10n.commonFree
                      : r.deliveryFee.format(),
                  style: value,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// "Free delivery — Don't worry, it's on us" promo tile.
class RestaurantOfferCard extends StatelessWidget {
  const RestaurantOfferCard({required this.offer, super.key});

  final RestaurantOffer offer;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final (background, accent, icon) = switch (offer.type) {
      OfferType.freeDelivery => (
        colors.accentPinkSubtle,
        colors.error,
        Assets.icons.saleBold,
      ),
      OfferType.firstOrder => (
        colors.accentLavenderSubtle,
        colors.accentLavender,
        Assets.icons.crownBold,
      ),
      OfferType.discount => (
        colors.brandSubtle,
        colors.brand,
        Assets.icons.tagPriceBold,
      ),
    };
    // Figma "ticket": scalloped top and bottom edges.
    return ClipPath(
      clipper: const _TicketClipper(),
      child: Container(
        width: 208,
        padding: const EdgeInsets.all(AppSpacing.lg),
        color: background,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: -AppSpacing.xl,
              top: -AppSpacing.xs,
              child: Transform.rotate(
                angle: 0.5,
                child: AppIcon(
                  Assets.icons.tagPriceBold,
                  size: 44,
                  color: accent.withValues(alpha: 0.12),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    AppIcon(icon, size: AppSizes.iconSm, color: accent),
                    const SizedBox(width: AppSpacing.xs),
                    Flexible(
                      child: Text(
                        offer.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.labelMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  offer.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.caption.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Wavy top/bottom edge of [RestaurantOfferCard] (≈67pt period, 8pt deep).
class _TicketClipper extends CustomClipper<Path> {
  const _TicketClipper();

  static const double _depth = 8;
  static const double _period = 67;
  static const double _corner = 8;

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    double wave(double x) =>
        _depth / 2 * (1 - math.cos(2 * math.pi * (x - 10) / _period));
    final path = Path()
      ..moveTo(0, wave(0) + _corner)
      ..quadraticBezierTo(0, wave(0), _corner, wave(_corner));
    for (var x = _corner; x <= w - _corner; x += 2) {
      path.lineTo(x, wave(x));
    }
    path
      ..quadraticBezierTo(w, wave(w), w, wave(w) + _corner)
      ..lineTo(w, h - wave(w) - _corner)
      ..quadraticBezierTo(w, h - wave(w), w - _corner, h - wave(w - _corner));
    for (var x = w - _corner; x >= _corner; x -= 2) {
      path.lineTo(x, h - wave(x));
    }
    return path
      ..quadraticBezierTo(0, h - wave(0), 0, h - wave(0) - _corner)
      ..close();
  }

  @override
  bool shouldReclip(_TicketClipper oldClipper) => false;
}

/// Cream card with the AI review summary; the ⓘ explains where it's from.
class AiSummaryCard extends StatelessWidget {
  const AiSummaryCard({
    required this.summary,
    super.key,
    this.onTap,
    this.maxLines,
    this.trailing,
  });

  final String summary;
  final VoidCallback? onTap;
  final int? maxLines;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      enabled: onTap != null,
      scale: 0.99,
      child: Container(
        decoration: BoxDecoration(
          color: colors.surfaceWarm,
          borderRadius: AppRadii.xlAll,
          border: Border.all(color: AppColors.primary200),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.all(AppSpacing.sm),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: AppRadii.lgAll,
              ),
              child: Row(
                children: [
                  AppIcon(
                    Assets.icons.sparklesBold,
                    size: AppSizes.iconSm,
                    color: colors.brand,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    l10n.restaurantAiSummary,
                    style: AppTypography.labelMedium,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Tooltip(
                    message: l10n.restaurantAiDisclaimer,
                    triggerMode: TooltipTriggerMode.tap,
                    showDuration: const Duration(seconds: 5),
                    margin: AppInsets.page,
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: colors.surfaceInverse,
                      borderRadius: AppRadii.mdAll,
                    ),
                    textStyle: AppTypography.bodyMedium.copyWith(
                      color: colors.textInverse,
                    ),
                    child: AppIcon(
                      Assets.icons.infoCircleBold,
                      size: AppSizes.iconSm,
                      color: colors.brand,
                    ),
                  ),
                  const Spacer(),
                  trailing ??
                      (onTap == null
                          ? const SizedBox.shrink()
                          : Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: colors.brandSubtle,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: AppIcon(
                                Assets.icons.altArrowRightLinear,
                                size: AppSizes.iconXs,
                                color: colors.brand,
                              ),
                            )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.xs,
                AppSpacing.md,
                AppSpacing.md,
              ),
              child: Text(
                summary,
                maxLines: maxLines,
                overflow: maxLines == null ? null : TextOverflow.ellipsis,
                style: AppTypography.caption.copyWith(
                  color: colors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// "more info": map with the route, address, hours, rating, allergy info.
Future<void> showRestaurantInfoSheet(
  BuildContext context,
  Restaurant restaurant,
) {
  return showAppBottomSheet<void>(
    context: context,
    showHandle: false,
    builder: (_) => _RestaurantInfo(restaurant: restaurant),
  );
}

class _RestaurantInfo extends StatefulWidget {
  const _RestaurantInfo({required this.restaurant});

  final Restaurant restaurant;

  @override
  State<_RestaurantInfo> createState() => _RestaurantInfoState();
}

class _RestaurantInfoState extends State<_RestaurantInfo> {
  bool _showHours = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final r = widget.restaurant;
    final home = context.read<SessionCubit>().state.address?.location;
    final center = home == null
        ? r.location
        : r.location.copyWith(
            latitude: (r.location.latitude + home.latitude) / 2,
            longitude: (r.location.longitude + home.longitude) / 2,
          );
    final status = r.isOpen
        ? l10n.restaurantOpenUntil(r.closesAt ?? '')
        : l10n.restaurantClosedOpensAt(r.opensAt ?? '');
    // Figma: 14 Regular row titles, dividers start under the text.
    final rowText = AppTypography.bodyMedium.copyWith(
      fontWeight: FontWeight.w400,
    );
    const rowDivider = Divider(height: 1, indent: 36);
    // Street-like route (two bends) instead of a straight diagonal.
    final route = home == null
        ? const <LatLng>[]
        : [
            r.location.latLng,
            LatLng(
              home.latitude + (r.location.latitude - home.latitude) * 0.35,
              r.location.longitude,
            ),
            LatLng(
              home.latitude + (r.location.latitude - home.latitude) * 0.35,
              home.longitude,
            ),
            home.latLng,
          ];
    Widget dot() => Container(
      decoration: BoxDecoration(
        color: colors.textPrimary,
        shape: BoxShape.circle,
        border: Border.all(color: colors.surface, width: 2),
      ),
    );

    Widget row({
      required SvgGenImage icon,
      required Widget title,
      Widget? subtitle,
      Widget? trailing,
      VoidCallback? onTap,
    }) => InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md + 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppIcon(icon, size: AppSizes.iconMd, color: colors.textSecondary),
            const SizedBox(width: AppSpacing.lg),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [title, ?subtitle],
              ),
            ),
            ?trailing,
          ],
        ),
      ),
    );

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: 175,
          child: Stack(
            children: [
              Positioned.fill(
                child: AppMap(
                  center: center,
                  zoom: 13.5,
                  interactive: false,
                  layers: [
                    if (home != null)
                      PolylineLayer(
                        polylines: [
                          Polyline(
                            points: route,
                            strokeWidth: 3,
                            color: colors.textPrimary,
                          ),
                        ],
                      ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: r.location.latLng,
                          width: 14,
                          height: 14,
                          child: dot(),
                        ),
                        if (home != null) ...[
                          Marker(
                            point: home.latLng,
                            width: 14,
                            height: 14,
                            child: dot(),
                          ),
                          Marker(
                            point: center.latLng,
                            width: 110,
                            height: 32,
                            child: MapLabel(
                              text: l10n.restaurantMilesAway(
                                Formatters.distance(r.distanceMiles),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: AppSpacing.gutter,
                top: AppSpacing.gutter,
                child: AppBackButton(
                  useCloseIcon: true,
                  variant: AppIconButtonVariant.elevated,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.gutter,
            AppSpacing.xl,
            AppSpacing.gutter,
            AppSpacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                r.name,
                style: AppTypography.headlineSmall.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.xxs),
              Text(
                r.tags.join(' · '),
                style: AppTypography.caption.copyWith(
                  color: colors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        Container(height: AppSpacing.xs, color: colors.surfaceMuted),
        Padding(
          padding: AppInsets.page,
          child: Column(
            children: [
              row(
                icon: Assets.icons.mapPointLinear,
                title: Text(r.address, style: rowText),
                trailing: GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(text: r.address));
                    if (context.mounted) {
                      AppToast.show(context, l10n.restaurantAddressCopied);
                    }
                  },
                  child: AppIcon(
                    Assets.icons.copyLinear,
                    size: AppSizes.iconMd,
                    color: colors.textSecondary,
                  ),
                ),
              ),
              rowDivider,
              row(
                icon: Assets.icons.clockCircleLinear,
                title: Text(status, style: rowText),
                subtitle: AnimatedSize(
                  duration: AppDurations.normal,
                  curve: AppCurves.emphasized,
                  child: !_showHours
                      ? const SizedBox(width: double.infinity)
                      : Padding(
                          padding: const EdgeInsets.only(top: AppSpacing.sm),
                          // Figma: day (Medium 12) stacked over hours.
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (final h in r.openingHours)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: AppSpacing.xs,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        h.days,
                                        style: AppTypography.bodySmall,
                                      ),
                                      Text(
                                        h.hours,
                                        style: AppTypography.caption.copyWith(
                                          color: colors.textTertiary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                ),
                trailing: AnimatedRotation(
                  turns: _showHours ? 0.5 : 0,
                  duration: AppDurations.fast,
                  child: AppIcon(
                    Assets.icons.altArrowDownLinear,
                    size: AppSizes.iconMd,
                    color: colors.textSecondary,
                  ),
                ),
                onTap: r.openingHours.isEmpty
                    ? null
                    : () => setState(() => _showHours = !_showHours),
              ),
              rowDivider,
              row(
                icon: Assets.icons.starLinear,
                title: Text(
                  l10n.restaurantRatingReviews(
                    r.rating.toStringAsFixed(1),
                    r.ratingCount,
                  ),
                  style: rowText,
                ),
                onTap: () {
                  Navigator.pop(context);
                  unawaited(context.push(AppRoutes.restaurantReviews(r.id)));
                },
              ),
              rowDivider,
              row(
                icon: Assets.icons.shieldWarningLinear,
                title: Text(l10n.restaurantAllergyInfo, style: rowText),
                trailing: AppIcon(
                  Assets.icons.altArrowRightLinear,
                  size: AppSizes.iconMd,
                  color: colors.textSecondary,
                ),
                onTap: () => showAllergySheet(context, r),
              ),
              rowDivider,
              row(
                icon: Assets.icons.bagCheckLinear,
                title: Text(
                  l10n.restaurantOrdersCount(
                    Formatters.count(r.ordersLastYear),
                  ),
                  style: rowText,
                ),
                subtitle: Text(
                  l10n.restaurantOrdersPeriod,
                  style: AppTypography.caption.copyWith(
                    color: colors.textSecondary,
                    fontSize: 10,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.paddingOf(context).bottom + AppSpacing.lg,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// "Allergy & Dietary Info" sheet.
Future<void> showAllergySheet(BuildContext context, Restaurant restaurant) {
  final l10n = context.l10n;
  return showAppBottomSheet<void>(
    context: context,
    title: l10n.restaurantAllergyInfo,
    plainHeader: true,
    builder: (sheetContext) => Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.gutter,
        AppSpacing.lg,
        AppSpacing.gutter,
        MediaQuery.paddingOf(sheetContext).bottom + AppSpacing.xl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.restaurantAllergyInformation,
            style: AppTypography.labelLarge,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            restaurant.allergyInfo ?? '',
            style: AppTypography.caption.copyWith(
              color: sheetContext.colors.textSecondary,
            ),
          ),
          if (restaurant.dietaryLabels.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.lg),
            // Figma separates the blocks with a full-bleed grey band.
            SizedBox(
              height: AppSpacing.xs,
              child: OverflowBox(
                maxWidth: MediaQuery.sizeOf(sheetContext).width,
                child: ColoredBox(
                  color: sheetContext.colors.surfaceMuted,
                  child: const SizedBox.expand(),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              l10n.restaurantDietaryLabels,
              style: AppTypography.labelLarge,
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: [
                for (final label in restaurant.dietaryLabels)
                  AppTag(label: label, outlined: true),
              ],
            ),
          ],
        ],
      ),
    ),
  );
}
