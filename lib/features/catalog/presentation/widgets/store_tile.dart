import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/core/utils/formatters.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant.dart';
import 'package:tavada_eats/features/catalog/presentation/widgets/restaurant_card.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// "Featured stores" logo tile: logo square, name, rating + distance.
class StoreTile extends StatelessWidget {
  const StoreTile({
    required this.restaurant,
    super.key,
    this.onTap,
    this.width = 232,
  });

  final Restaurant restaurant;
  final VoidCallback? onTap;
  final double? width;

  static Widget placeholder({double? width = 232}) => StoreTile(
    restaurant: RestaurantCard.placeholderRestaurant(),
    width: width,
  );

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final r = restaurant;
    final muted = AppTypography.bodySmall.copyWith(color: colors.textSecondary);
    return PressableScale(
      onTap: onTap,
      semanticLabel: r.name,
      child: Container(
        width: width,
        height: 64,
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: AppRadii.mdAll,
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            AppImage(
              r.logoUrl,
              width: 66,
              height: 64,
              heroTag: r.logoHeroTag,
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    r.name,
                    style: AppTypography.labelMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      AppIcon(
                        Assets.icons.starBold,
                        size: 14,
                        color: RatingTier.of(r.rating).color(context),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        r.rating.toStringAsFixed(1),
                        style: AppTypography.bodySmall.copyWith(
                          color: RatingTier.of(r.rating).color(context),
                        ),
                      ),
                      Text(' · ', style: muted),
                      Text(
                        context.l10n.commonMiles(
                          Formatters.distance(r.distanceMiles),
                        ),
                        style: muted,
                      ),
                    ],
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
