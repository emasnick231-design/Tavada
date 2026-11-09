import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/models/money.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/catalog/domain/entities/menu.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Round white "+" button on dish images.
class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    this.onTap,
    this.size = 36,
    this.quantity = 0,
  });

  final VoidCallback? onTap;
  final double size;

  /// When > 0 shows the in-basket quantity instead of "+".
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      scale: 0.85,
      child: AnimatedContainer(
        duration: AppDurations.normal,
        curve: AppCurves.spring,
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: quantity > 0 ? colors.brand : colors.surface,
          shape: BoxShape.circle,
          boxShadow: AppShadows.md,
        ),
        alignment: Alignment.center,
        child: AnimatedSwitcher(
          duration: AppDurations.fast,
          transitionBuilder: (c, a) => ScaleTransition(scale: a, child: c),
          child: quantity > 0
              ? Text(
                  '$quantity',
                  key: ValueKey(quantity),
                  style: AppTypography.labelLarge.copyWith(
                    color: colors.onBrand,
                  ),
                )
              : Icon(
                  Icons.add_rounded,
                  key: const ValueKey('plus'),
                  color: colors.brand,
                  size: size * 0.62,
                ),
        ),
      ),
    );
  }
}

/// Compact dish card for rails ("Popular orders", "Continue shopping",
/// search results).
class DishCard extends StatelessWidget {
  const DishCard({
    required this.item,
    super.key,
    this.onTap,
    this.onAdd,
    this.width = 131,
    this.imageHeight = 112,
    this.quantity = 0,
    this.enableHero = true,
  });

  final MenuItem item;
  final VoidCallback? onTap;
  final VoidCallback? onAdd;
  final double width;
  final double imageHeight;
  final int quantity;

  /// Turn off when the same dish is also shown elsewhere on the page (e.g.
  /// "Popular orders" above the full menu) — hero tags must be unique.
  final bool enableHero;

  static MenuItem placeholderItem([int seed = 0]) => MenuItem(
    id: 'placeholder-$seed',
    restaurantId: 'placeholder',
    name: 'Dish name here',
    description: 'A delicious description of this dish',
    price: const Money(601),
    imageUrl: '',
  );

  static Widget placeholder({double width = 131}) =>
      DishCard(item: placeholderItem(), width: width);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      semanticLabel: item.name,
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: imageHeight,
              width: width,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: AppImage(
                      item.imageUrl,
                      width: width,
                      height: imageHeight,
                      borderRadius: AppRadii.lgAll,
                      heroTag: enableHero ? item.heroTag : null,
                    ),
                  ),
                  Positioned(
                    right: AppSpacing.sm,
                    bottom: AppSpacing.sm,
                    child: AddToCartButton(
                      onTap: onAdd ?? onTap,
                      quantity: quantity,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              item.name,
              style: AppTypography.labelMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              item.price.format(),
              style: AppTypography.caption.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Menu row: name, description, price and a thumbnail with "+".
class MenuItemTile extends StatelessWidget {
  const MenuItemTile({
    required this.item,
    super.key,
    this.onTap,
    this.onAdd,
    this.quantity = 0,
  });

  final MenuItem item;
  final VoidCallback? onTap;
  final VoidCallback? onAdd;
  final int quantity;

  static Widget placeholder() => MenuItemTile(item: DishCard.placeholderItem());

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      scale: 0.99,
      semanticLabel: item.name,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.gutter,
          vertical: AppSpacing.md,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: AppTypography.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    item.description,
                    style: AppTypography.caption,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  PriceText(
                    price: item.price,
                    originalPrice: item.originalPrice,
                    style: AppTypography.labelLarge.copyWith(
                      color: colors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.lg),
            SizedBox(
              width: 100,
              height: 92,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: AppImage(
                      item.imageUrl,
                      width: 100,
                      height: 92,
                      borderRadius: AppRadii.lgAll,
                      heroTag: item.heroTag,
                    ),
                  ),
                  Positioned(
                    right: 6,
                    bottom: 6,
                    child: AddToCartButton(
                      onTap: onAdd ?? onTap,
                      quantity: quantity,
                    ),
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
