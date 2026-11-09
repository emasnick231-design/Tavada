import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/buttons/pressable_scale.dart';
import 'package:tavada_eats/shared/widgets/media/app_icon.dart';

/// "Places near you →" style section title (Figma: SemiBold 14/20) with an
/// optional 12pt subtitle and an orange arrow action.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.title,
    super.key,
    this.subtitle,
    this.onSeeAll,
    this.trailing,
    this.padding = const EdgeInsets.fromLTRB(
      AppSpacing.gutter,
      AppSpacing.md,
      AppSpacing.gutter,
      AppSpacing.md,
    ),
    this.titleStyle,
    this.titleSuffix,
  });

  final String title;
  final String? subtitle;
  final VoidCallback? onSeeAll;
  final Widget? trailing;
  final EdgeInsets padding;
  final TextStyle? titleStyle;

  /// Inline widget after the title (e.g. the ⚡️ in "Less than 10 min").
  final Widget? titleSuffix;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: titleStyle ?? AppTypography.labelLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (titleSuffix != null) ...[
                      const SizedBox(width: AppSpacing.xs),
                      titleSuffix!,
                    ],
                  ],
                ),
                if (subtitle != null)
                  Text(subtitle!, style: AppTypography.caption),
              ],
            ),
          ),
          ?trailing,
          if (onSeeAll != null)
            PressableScale(
              onTap: onSeeAll,
              scale: 0.85,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xs),
                child: AppIcon(
                  Assets.icons.arrowRightLinear,
                  color: colors.brand,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
