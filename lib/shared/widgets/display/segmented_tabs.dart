import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/core/utils/haptics.dart';

/// iOS-style segmented control with a sliding white thumb
/// ("My Orders | Ongoing | Completed", "Delivery | Pickup").
class SegmentedTabs extends StatelessWidget {
  const SegmentedTabs({
    required this.segments,
    required this.selectedIndex,
    required this.onChanged,
    super.key,
    this.height = 44,
  });

  final List<String> segments;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final double height;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      height: height,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: colors.surfaceMuted,
        borderRadius: AppRadii.pillAll,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth / segments.length;
          return Stack(
            children: [
              AnimatedPositioned(
                duration: AppDurations.normal,
                curve: AppCurves.emphasized,
                left: width * selectedIndex,
                top: 0,
                bottom: 0,
                width: width,
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: AppRadii.pillAll,
                    boxShadow: AppShadows.sm,
                  ),
                ),
              ),
              Row(
                children: [
                  for (var i = 0; i < segments.length; i++)
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          if (i == selectedIndex) return;
                          Haptics.selection();
                          onChanged(i);
                        },
                        child: Center(
                          child: AnimatedDefaultTextStyle(
                            duration: AppDurations.fast,
                            // Figma: Medium 12 labels.
                            style: AppTypography.labelMedium.copyWith(
                              color: i == selectedIndex
                                  ? colors.textPrimary
                                  : colors.textSecondary,
                              fontWeight: i == selectedIndex
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                            ),
                            child: Text(segments[i], maxLines: 1),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
