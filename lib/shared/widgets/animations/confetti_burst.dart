import 'dart:math' as math;

import 'package:confetti/confetti.dart';
import 'package:flutter/widgets.dart';
import 'package:tavada_eats/core/theme/tokens/app_colors.dart';

/// Celebration overlay (order placed, gift saved, rewards redeemed).
///
/// ```dart
/// final _confetti = GlobalKey<ConfettiBurstState>();
/// ConfettiBurst(key: _confetti, child: …);
/// _confetti.currentState?.fire();
/// ```
class ConfettiBurst extends StatefulWidget {
  const ConfettiBurst({
    required this.child,
    super.key,
    this.alignment = Alignment.topCenter,
    this.autoFire = false,
  });

  final Widget child;
  final Alignment alignment;
  final bool autoFire;

  @override
  State<ConfettiBurst> createState() => ConfettiBurstState();
}

class ConfettiBurstState extends State<ConfettiBurst> {
  late final ConfettiController _controller = ConfettiController(
    duration: const Duration(milliseconds: 900),
  );

  static const List<Color> _colors = [
    AppColors.primary500,
    AppColors.gold400,
    AppColors.java300,
    AppColors.cosmos500,
    AppColors.lavender600,
    AppColors.success500,
  ];

  @override
  void initState() {
    super.initState();
    if (widget.autoFire) {
      WidgetsBinding.instance.addPostFrameCallback((_) => fire());
    }
  }

  void fire() => _controller.play();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        widget.child,
        Align(
          alignment: widget.alignment,
          child: IgnorePointer(
            child: ConfettiWidget(
              confettiController: _controller,
              blastDirectionality: BlastDirectionality.explosive,
              blastDirection: math.pi / 2,
              emissionFrequency: 0.04,
              numberOfParticles: 22,
              maxBlastForce: 26,
              minBlastForce: 8,
              gravity: 0.25,
              colors: _colors,
              minimumSize: const Size(6, 4),
              maximumSize: const Size(12, 7),
            ),
          ),
        ),
      ],
    );
  }
}
