import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/buttons/pressable_scale.dart';
import 'package:tavada_eats/shared/widgets/media/app_icon.dart';

/// Rounded-square checkbox: grey outline, or orange outline + orange tick.
class AppCheckbox extends StatelessWidget {
  const AppCheckbox({required this.value, super.key, this.onChanged});

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onChanged == null ? null : () => onChanged!(!value),
      scale: 0.85,
      child: AnimatedContainer(
        duration: AppDurations.fast,
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          color: value ? colors.brandSubtle : colors.surface,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: value ? colors.brand : colors.borderStrong,
            width: 1.4,
          ),
        ),
        alignment: Alignment.center,
        child: AnimatedScale(
          scale: value ? 1 : 0,
          duration: AppDurations.normal,
          curve: AppCurves.spring,
          child: Icon(Icons.check_rounded, size: 16, color: colors.brand),
        ),
      ),
    );
  }
}

/// Orange ring + dot radio.
class AppRadio extends StatelessWidget {
  const AppRadio({required this.selected, super.key, this.onTap});

  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      scale: 0.85,
      child: AnimatedContainer(
        duration: AppDurations.fast,
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colors.surface,
          border: Border.all(
            color: selected ? colors.brand : colors.borderStrong,
            width: selected ? 1.6 : 1.25,
          ),
        ),
        alignment: Alignment.center,
        child: AnimatedScale(
          scale: selected ? 1 : 0,
          duration: AppDurations.normal,
          curve: AppCurves.spring,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: colors.brand,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

/// Full-width row with a title (+ optional subtitle/trailing price) and a
/// checkbox or radio on the right. Used by option groups and filter sheets.
class AppSelectionTile extends StatelessWidget {
  const AppSelectionTile({
    required this.title,
    required this.selected,
    required this.onTap,
    super.key,
    this.subtitle,
    this.trailingText,
    this.isRadio = false,
    this.showDivider = true,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.gutter,
      vertical: AppSpacing.md + 2,
    ),
    this.enabled = true,
    this.dividerColor,
    this.dense = false,
    this.showControl = true,
  });

  final String title;
  final String? subtitle;
  final String? trailingText;
  final bool selected;
  final VoidCallback onTap;
  final bool isRadio;
  final bool showDivider;
  final EdgeInsets padding;
  final bool enabled;

  /// Defaults to the hairline divider colour (white on grey option bands).
  final Color? dividerColor;

  /// 12pt labels (compact sheets such as "Hearing").
  final bool dense;

  /// Plain text rows (Figma "Menu" sheet) hide the radio/checkbox.
  final bool showControl;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      scale: 0.99,
      enabled: enabled,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: padding,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style:
                            (dense
                                    ? AppTypography.caption
                                    : AppTypography.bodyMedium)
                                .copyWith(
                                  color: enabled
                                      ? colors.textPrimary
                                      : colors.textDisabled,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                      if (subtitle != null)
                        Text(subtitle!, style: AppTypography.bodySmall),
                    ],
                  ),
                ),
                if (trailingText != null) ...[
                  Text(
                    trailingText!,
                    style: AppTypography.bodySmall.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                ],
                if (showControl)
                  IgnorePointer(
                    child: isRadio
                        ? AppRadio(selected: selected, onTap: () {})
                        : AppCheckbox(value: selected, onChanged: (_) {}),
                  ),
              ],
            ),
          ),
          if (showDivider)
            Divider(
              indent: padding.left,
              endIndent: padding.right,
              color: dividerColor ?? colors.divider,
            ),
        ],
      ),
    );
  }
}

/// Small "✓ / ✓" rule row used under password fields.
class RuleCheckRow extends StatelessWidget {
  const RuleCheckRow({required this.label, required this.passed, super.key});

  final String label;
  final bool passed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        children: [
          AnimatedSwitcher(
            duration: AppDurations.normal,
            transitionBuilder: (c, a) => ScaleTransition(scale: a, child: c),
            child: AppIcon(
              Assets.icons.checkCircleBold,
              key: ValueKey(passed),
              size: AppSizes.iconMd - 2,
              color: passed ? colors.success : colors.borderStrong,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              label,
              style: AppTypography.bodyMedium.copyWith(
                fontWeight: FontWeight.w400,
                color: colors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
