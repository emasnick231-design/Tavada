import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/buttons/pressable_scale.dart';
import 'package:tavada_eats/shared/widgets/media/app_icon.dart';

/// Filter chip from the home/search filter bar
/// ("Discounts", "Cuisines ▾", "Top-rated", "Offers ×").
class AppFilterChip extends StatelessWidget {
  const AppFilterChip({
    required this.label,
    required this.onTap,
    super.key,
    this.icon,
    this.selected = false,
    this.showDropdown = false,
    this.onClear,
  });

  final String label;
  final SvgGenImage? icon;
  final bool selected;
  final bool showDropdown;
  final VoidCallback onTap;

  /// When provided and [selected], shows a trailing "×" that clears.
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fg = selected ? colors.brand : colors.textPrimary;
    return PressableScale(
      onTap: onTap,
      scale: 0.95,
      child: AnimatedContainer(
        duration: AppDurations.fast,
        // Figma: 32pt pill, Medium 12 label; selected = peach fill, no border.
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        decoration: BoxDecoration(
          color: selected ? colors.brandSubtle : colors.surfaceMuted,
          borderRadius: AppRadii.pillAll,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              AppIcon(
                icon!,
                size: AppSizes.iconSm,
                color: selected ? colors.brand : colors.textSecondary,
              ),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: AppTypography.labelMedium.copyWith(
                color: fg,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (showDropdown && !selected) ...[
              const SizedBox(width: 4),
              AppIcon(
                Assets.icons.altArrowDownLinear,
                size: AppSizes.iconSm,
                color: colors.textSecondary,
              ),
            ],
            if (selected && onClear != null) ...[
              const SizedBox(width: 6),
              GestureDetector(
                onTap: onClear,
                behavior: HitTestBehavior.opaque,
                child: Icon(Icons.close_rounded, size: 15, color: colors.brand),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Horizontal text tabs ("All Africa · Nigerian · South African …").
/// The selected tab gets a soft orange pill that slides between items.
class AppTabChips extends StatelessWidget {
  const AppTabChips({
    required this.labels,
    required this.selectedIndex,
    required this.onSelected,
    super.key,
    this.padding = AppInsets.page,
  });

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: padding,
      child: Row(
        children: [
          for (var i = 0; i < labels.length; i++)
            PressableScale(
              onTap: () => onSelected(i),
              scale: 0.95,
              child: AnimatedContainer(
                duration: AppDurations.normal,
                curve: AppCurves.standard,
                margin: const EdgeInsets.only(right: AppSpacing.xs),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: i == selectedIndex
                      ? colors.brandSubtle
                      : Colors.transparent,
                  borderRadius: AppRadii.pillAll,
                ),
                child: AnimatedDefaultTextStyle(
                  duration: AppDurations.fast,
                  style: AppTypography.labelMedium.copyWith(
                    color: i == selectedIndex
                        ? colors.brand
                        : colors.textSecondary,
                    fontWeight: i == selectedIndex
                        ? FontWeight.w600
                        : FontWeight.w500,
                  ),
                  child: Text(labels[i]),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Grey pill tag ("Vegan", "Halal", recent searches).
class AppTag extends StatelessWidget {
  const AppTag({
    required this.label,
    super.key,
    this.onTap,
    this.outlined = false,
  });

  final String label;
  final VoidCallback? onTap;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final tag = Container(
      padding: EdgeInsets.symmetric(
        horizontal: outlined ? AppSpacing.sm : AppSpacing.md,
        vertical: outlined ? 1 : AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: outlined ? colors.surfaceMuted : colors.surfaceMuted,
        borderRadius: AppRadii.pillAll,
        border: outlined ? Border.all(color: colors.borderStrong) : null,
      ),
      child: Text(
        label,
        style: (outlined ? AppTypography.bodySmall : AppTypography.labelMedium)
            .copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
      ),
    );
    if (onTap == null) return tag;
    return PressableScale(onTap: onTap, scale: 0.95, child: tag);
  }
}
