import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';

/// 8pt grey band separating page sections (as in every Figma screen).
class SectionGap extends StatelessWidget {
  const SectionGap({super.key, this.height = AppSpacing.sectionGap});

  final double height;

  @override
  Widget build(BuildContext context) =>
      Container(height: height, color: context.colors.surfaceMuted);
}

/// Sliver version of [SectionGap].
class SliverSectionGap extends StatelessWidget {
  const SliverSectionGap({super.key, this.height = AppSpacing.sectionGap});

  final double height;

  @override
  Widget build(BuildContext context) =>
      SliverToBoxAdapter(child: SectionGap(height: height));
}

/// Hairline divider with page-gutter indents by default.
class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.indent = AppSpacing.gutter,
    this.endIndent = AppSpacing.gutter,
  });

  final double indent;
  final double endIndent;

  @override
  Widget build(BuildContext context) => Divider(
    indent: indent,
    endIndent: endIndent,
    color: context.colors.divider,
  );
}

/// Dashed horizontal line (checkout "Pack" separators, receipts).
class DashedDivider extends StatelessWidget {
  const DashedDivider({
    super.key,
    this.dashWidth = 5,
    this.gap = 4,
    this.thickness = 1,
    this.color,
  });

  final double dashWidth;
  final double gap;
  final double thickness;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: thickness,
      width: double.infinity,
      child: CustomPaint(
        painter: _DashPainter(
          color: color ?? context.colors.borderStrong,
          dash: dashWidth,
          gap: gap,
          thickness: thickness,
        ),
      ),
    );
  }
}

class _DashPainter extends CustomPainter {
  _DashPainter({
    required this.color,
    required this.dash,
    required this.gap,
    required this.thickness,
  });

  final Color color;
  final double dash;
  final double gap;
  final double thickness;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness;
    var x = 0.0;
    while (x < size.width) {
      canvas.drawLine(
        Offset(x, 0),
        Offset((x + dash).clamp(0, size.width), 0),
        paint,
      );
      x += dash + gap;
    }
  }

  @override
  bool shouldRepaint(_DashPainter old) =>
      old.color != color || old.dash != dash || old.gap != gap;
}
