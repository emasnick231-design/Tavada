import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/cart/domain/entities/cart_item.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// One basket line on checkout: "Pack N" header, dish row with stepper and
/// the "Your Selections" box with the orange "Edit selection" bar.
class PackTile extends StatelessWidget {
  const PackTile({
    required this.index,
    required this.item,
    required this.onRemove,
    required this.onQuantityChanged,
    required this.onEditSelection,
    super.key,
  });

  final int index;
  final CartItem item;
  final VoidCallback onRemove;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onEditSelection;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.gutter,
        AppSpacing.md,
        AppSpacing.gutter,
        AppSpacing.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.checkoutPack(index + 1),
                  style: AppTypography.labelLarge,
                ),
              ),
              AppIconButton(
                icon: Assets.icons.trashBinMinimalisticLinear,
                size: 32,
                iconSize: AppSizes.iconSm,
                color: colors.error,
                tooltip: l10n.commonRemove,
                onPressed: onRemove,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              AppImage(
                item.imageUrl,
                width: 50,
                height: 50,
                borderRadius: AppRadii.mdAll,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AnimatedMoney(
                      value: item.total,
                      style: AppTypography.caption.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              QuantityStepper(
                value: item.quantity,
                onChanged: onQuantityChanged,
              ),
            ],
          ),
          if (item.options.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.md),
            _SelectionsBox(item: item, onEdit: onEditSelection),
          ],
        ],
      ),
    );
  }
}

class _SelectionsBox extends StatelessWidget {
  const _SelectionsBox({required this.item, required this.onEdit});

  final CartItem item;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    final optionStyle = AppTypography.bodyMedium.copyWith(
      color: colors.textSecondary,
      fontWeight: FontWeight.w400,
    );
    return ClipRRect(
      borderRadius: AppRadii.lgAll,
      child: ColoredBox(
        color: colors.surfaceMuted,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md + 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          l10n.checkoutYourSelections,
                          style: AppTypography.labelLarge,
                        ),
                      ),
                      Text(
                        '+${item.optionsTotal.format()}',
                        style: AppTypography.labelLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  for (final option in item.options)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(option.name, style: optionStyle),
                    ),
                ],
              ),
            ),
            PressableScale(
              onTap: onEdit,
              scale: 0.99,
              semanticLabel: l10n.checkoutEditSelection,
              child: Container(
                height: 36,
                color: colors.brand,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md + 2,
                ),
                child: Row(
                  children: [
                    Text(
                      l10n.checkoutEditSelection,
                      style: AppTypography.labelLarge.copyWith(
                        color: colors.onBrand,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    AppIcon(
                      Assets.icons.altArrowRightLinear,
                      size: AppSizes.iconSm,
                      color: colors.onBrand,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
