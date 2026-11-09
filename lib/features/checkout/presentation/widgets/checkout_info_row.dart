import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Icon + title (+ subtitle) row with a hairline divider, used throughout
/// the checkout sections ("Delivery instructions ›", "Store location").
class CheckoutInfoRow extends StatelessWidget {
  const CheckoutInfoRow({
    required this.icon,
    required this.title,
    super.key,
    this.subtitle,
    this.onTap,
    this.trailing,
    this.iconColor,
    this.showDivider = true,
    this.titleStyle,
  });

  final SvgGenImage icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color? iconColor;
  final bool showDivider;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      scale: 0.99,
      semanticLabel: title,
      child: Padding(
        padding: AppInsets.page,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.md + 2),
              child: AppIcon(
                icon,
                size: AppSizes.iconMd + 2,
                color: iconColor ?? colors.textSecondary,
              ),
            ),
            const SizedBox(width: AppSpacing.md + 2),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: showDivider
                      ? Border(bottom: BorderSide(color: colors.divider))
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style:
                                  titleStyle ??
                                  AppTypography.bodyMedium.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            if (subtitle != null)
                              Text(
                                subtitle!,
                                style: AppTypography.bodySmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                          ],
                        ),
                      ),
                      if (trailing != null)
                        trailing!
                      else if (onTap != null)
                        AppIcon(
                          Assets.icons.altArrowRightLinear,
                          size: AppSizes.iconMd,
                          color: colors.textTertiary,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
