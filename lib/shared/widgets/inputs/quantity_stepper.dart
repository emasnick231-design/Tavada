import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/buttons/pressable_scale.dart';
import 'package:tavada_eats/shared/widgets/media/app_icon.dart';

enum QuantityStepperStyle {
  /// Grey pill with small white − / + buttons (checkout line items).
  compact,

  /// Outlined circle icons with a large count (product details).
  large,
}

/// Quantity control with an animated rolling number.
class QuantityStepper extends StatelessWidget {
  const QuantityStepper({
    required this.value,
    required this.onChanged,
    super.key,
    this.min = 1,
    this.max = 99,
    this.style = QuantityStepperStyle.compact,
  });

  final int value;
  final ValueChanged<int> onChanged;
  final int min;
  final int max;
  final QuantityStepperStyle style;

  bool get _canDecrement => value > min;
  bool get _canIncrement => value < max;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final count = _RollingCount(
      value: value,
      style: style == QuantityStepperStyle.large
          ? AppTypography.headlineSmall.copyWith(fontWeight: FontWeight.w500)
          : AppTypography.labelLarge,
    );

    if (style == QuantityStepperStyle.large) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _RoundIcon(
            icon: Assets.icons.minusCircleLinear,
            size: 28,
            color: _canDecrement ? colors.textPrimary : colors.textDisabled,
            onTap: _canDecrement ? () => onChanged(value - 1) : null,
          ),
          SizedBox(width: 48, child: Center(child: count)),
          _RoundIcon(
            icon: Assets.icons.addCircleLinear,
            size: 28,
            color: _canIncrement ? colors.textPrimary : colors.textDisabled,
            onTap: _canIncrement ? () => onChanged(value + 1) : null,
          ),
        ],
      );
    }

    return Container(
      height: AppSizes.buttonSm,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: colors.surfaceMuted,
        borderRadius: AppRadii.pillAll,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _SmallButton(
            symbol: '−',
            enabled: _canDecrement,
            onTap: () => onChanged(value - 1),
          ),
          SizedBox(width: 30, child: Center(child: count)),
          _SmallButton(
            symbol: '+',
            enabled: _canIncrement,
            onTap: () => onChanged(value + 1),
          ),
        ],
      ),
    );
  }
}

class _RollingCount extends StatelessWidget {
  const _RollingCount({required this.value, required this.style});

  final int value;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: AppDurations.normal,
      transitionBuilder: (child, animation) {
        final incoming = child.key == ValueKey(value);
        final offset = Tween<Offset>(
          begin: Offset(0, incoming ? 0.6 : -0.6),
          end: Offset.zero,
        ).animate(animation);
        return ClipRect(
          child: SlideTransition(
            position: offset,
            child: FadeTransition(opacity: animation, child: child),
          ),
        );
      },
      child: Text('$value', key: ValueKey(value), style: style),
    );
  }
}

class _SmallButton extends StatelessWidget {
  const _SmallButton({
    required this.symbol,
    required this.enabled,
    required this.onTap,
  });

  final String symbol;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: enabled ? onTap : null,
      scale: 0.85,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: colors.surface,
          shape: BoxShape.circle,
          boxShadow: AppShadows.xs,
        ),
        alignment: Alignment.center,
        child: Text(
          symbol,
          style: AppTypography.labelLarge.copyWith(
            color: enabled ? colors.textPrimary : colors.textDisabled,
            height: 1,
          ),
        ),
      ),
    );
  }
}

class _RoundIcon extends StatelessWidget {
  const _RoundIcon({
    required this.icon,
    required this.size,
    required this.color,
    this.onTap,
  });

  final SvgGenImage icon;
  final double size;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => PressableScale(
    onTap: onTap,
    scale: 0.85,
    child: AppIcon(icon, size: size, color: color),
  );
}
