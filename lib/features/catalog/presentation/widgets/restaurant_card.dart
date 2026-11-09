import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/models/models.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/core/utils/formatters.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Large restaurant card ("Places near you", search/filter results).
///
/// * Cover image with promo badge + ETA pill, shared-element hero to the
///   restaurant page.
/// * Use [RestaurantCard.placeholder] inside `AppSkeleton` while loading.
class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    required this.restaurant,
    super.key,
    this.onTap,
    this.width,
    this.imageHeight = 138,
    this.showCuisine = true,
    this.showDeliveryFee = true,
    this.enableHero = true,
  });

  final Restaurant restaurant;
  final VoidCallback? onTap;

  /// Fixed width for horizontal rails; `null` expands to the parent.
  final double? width;
  final double imageHeight;
  final bool showCuisine;

  /// Figma list/results cards show only "★ rating · distance".
  final bool showDeliveryFee;
  final bool enableHero;

  /// Fake data with realistic lengths for skeleton loading.
  static Restaurant placeholderRestaurant([int seed = 0]) => Restaurant(
    id: 'placeholder-$seed',
    name: 'Restaurant name here',
    logoUrl: '',
    coverUrl: '',
    cuisine: 'Nigerian',
    rating: 4.8,
    ratingCount: 101,
    etaMinutes: 20,
    distanceMiles: 0.5,
    deliveryFee: Money.zero,
    shortAddress: '',
    address: '',
    location: const GeoPoint(latitude: 0, longitude: 0),
  );

  static Widget placeholder({double? width, double imageHeight = 138}) =>
      RestaurantCard(
        restaurant: placeholderRestaurant(),
        width: width,
        imageHeight: imageHeight,
        enableHero: false,
      );

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    final r = restaurant;
    return PressableScale(
      onTap: onTap,
      scale: 0.98,
      semanticLabel: r.name,
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: imageHeight + 14,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    bottom: 14,
                    child: AppImage(
                      r.coverUrl,
                      width: width,
                      height: imageHeight,
                      borderRadius: AppRadii.lgAll,
                      heroTag: enableHero ? r.coverHeroTag : null,
                    ),
                  ),
                  if (r.promoLabel != null)
                    Positioned(
                      top: AppSpacing.sm,
                      left: AppSpacing.sm,
                      child: DiscountBadge(label: r.promoLabel!),
                    ),
                  Positioned(
                    right: AppSpacing.sm,
                    bottom: 0,
                    child: TimePill(
                      value: '${r.etaMinutes}',
                      unit: l10n
                          .commonMinutes(r.etaMinutes)
                          .replaceFirst('${r.etaMinutes}', '')
                          .trim(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showCuisine) ...[
                    Text(
                      r.cuisine,
                      style: AppTypography.bodySmall.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                  Text(
                    r.name,
                    style: AppTypography.labelLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  RestaurantMetaRow(
                    restaurant: r,
                    showDeliveryFee: showDeliveryFee,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// "★ 4.8 Excellent (101) · 0.5 mi · 🚲 Free"
class RestaurantMetaRow extends StatelessWidget {
  const RestaurantMetaRow({
    required this.restaurant,
    super.key,
    this.showDeliveryFee = true,
  });

  final Restaurant restaurant;
  final bool showDeliveryFee;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    final muted = AppTypography.bodySmall.copyWith(color: colors.textSecondary);
    // Figma: light Gray/300 dot with 4pt either side.
    final dot = Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
      child: Container(
        width: 3,
        height: 3,
        decoration: const BoxDecoration(
          color: AppColors.gray300,
          shape: BoxShape.circle,
        ),
      ),
    );
    return Row(
      children: [
        // Flexible so long tier labels (Turkish, large text) ellipsize
        // instead of overflowing narrow cards.
        Flexible(
          flex: 2,
          child: RatingLabel(
            rating: restaurant.rating,
            count: restaurant.ratingCount,
          ),
        ),
        dot,
        Text(
          l10n.commonMiles(Formatters.distance(restaurant.distanceMiles)),
          style: muted,
        ),
        if (showDeliveryFee) ...[
          dot,
          AppIcon(Assets.icons.bike, size: 14, color: colors.textSecondary),
          const SizedBox(width: 3),
          Flexible(
            child: Text(
              restaurant.hasFreeDelivery
                  ? l10n.commonFree
                  : restaurant.deliveryFee.formatCompact(),
              style: muted,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
    );
  }
}
