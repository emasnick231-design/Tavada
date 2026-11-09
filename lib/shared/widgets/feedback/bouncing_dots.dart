import 'dart:math' as math;

import 'package:flutter/widgets.dart';

/// Three dots bouncing in sequence — the app's loading glyph (buttons,
/// typing indicators, inline loaders).
class BouncingDots extends StatefulWidget {
  const BouncingDots({
    required this.color,
    super.key,
    this.dotSize = 7,
    this.spacing = 5,
  });

  final Color color;
  final double dotSize;
  final double spacing;

  @override
  State<BouncingDots> createState() => _BouncingDotsState();
}

class _BouncingDotsState extends State<BouncingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1100),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Loading',
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) => Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) {
            final t = (_controller.value - i * 0.16) % 1.0;
            final wave = math.max(0, math.sin(t * math.pi * 2));
            return Padding(
              padding: EdgeInsets.only(left: i == 0 ? 0 : widget.spacing),
              child: Transform.translate(
                offset: Offset(0, -widget.dotSize * 0.6 * wave),
                child: Opacity(
                  opacity: 0.45 + 0.55 * wave,
                  child: Container(
                    width: widget.dotSize,
                    height: widget.dotSize,
                    decoration: BoxDecoration(
                      color: widget.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
