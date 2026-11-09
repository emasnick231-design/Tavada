import 'package:flutter/widgets.dart';
import 'package:tavada_eats/core/theme/tokens/tokens.dart';
import 'package:tavada_eats/core/utils/haptics.dart';

/// Wraps any widget with a springy "press" scale + optional haptic tick.
/// The default tap affordance for cards, tiles and custom buttons.
class PressableScale extends StatefulWidget {
  const PressableScale({
    required this.child,
    super.key,
    this.onTap,
    this.onLongPress,
    this.scale = 0.97,
    this.haptic = true,
    this.enabled = true,
    this.behavior = HitTestBehavior.opaque,
    this.semanticLabel,
  });

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final double scale;
  final bool haptic;
  final bool enabled;
  final HitTestBehavior behavior;
  final String? semanticLabel;

  @override
  State<PressableScale> createState() => _PressableScaleState();
}

class _PressableScaleState extends State<PressableScale> {
  bool _pressed = false;

  bool get _interactive =>
      widget.enabled && (widget.onTap != null || widget.onLongPress != null);

  void _setPressed(bool value) {
    if (_pressed == value || !_interactive) return;
    setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: _interactive,
      label: widget.semanticLabel,
      enabled: widget.enabled,
      child: GestureDetector(
        behavior: widget.behavior,
        onTapDown: (_) => _setPressed(true),
        onTapUp: (_) => _setPressed(false),
        onTapCancel: () => _setPressed(false),
        onTap: _interactive && widget.onTap != null
            ? () {
                if (widget.haptic) Haptics.selection();
                widget.onTap!();
              }
            : null,
        onLongPress: _interactive ? widget.onLongPress : null,
        child: AnimatedScale(
          scale: _pressed ? widget.scale : 1,
          duration: _pressed ? AppDurations.instant : AppDurations.normal,
          curve: _pressed ? Curves.easeOut : AppCurves.spring,
          child: widget.child,
        ),
      ),
    );
  }
}
