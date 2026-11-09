import 'package:material_ui/material_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';

export 'package:skeletonizer/skeletonizer.dart'
    show Skeleton, Skeletonizer, SliverSkeletonizer;

/// Turns real widgets into shimmering placeholders while [enabled].
///
/// Best practice: render the *real* layout with fake data (see each feature's
/// `*.placeholder()` factories) so the skeleton matches the final UI exactly
/// and the swap to content is seamless.
class AppSkeleton extends StatelessWidget {
  const AppSkeleton({required this.enabled, required this.child, super.key});

  final bool enabled;
  final Widget child;

  @override
  Widget build(BuildContext context) =>
      Skeletonizer(enabled: enabled, child: child);
}

/// Sliver variant of [AppSkeleton].
class AppSliverSkeleton extends StatelessWidget {
  const AppSliverSkeleton({
    required this.enabled,
    required this.child,
    super.key,
  });

  final bool enabled;
  final Widget child;

  @override
  Widget build(BuildContext context) =>
      SliverSkeletonizer(enabled: enabled, child: child);
}

/// A plain shimmering block for hand-built skeletons.
class SkeletonBox extends StatelessWidget {
  const SkeletonBox({
    super.key,
    this.width,
    this.height = 14,
    this.borderRadius = AppRadii.mdAll,
    this.shape = BoxShape.rectangle,
  });

  const SkeletonBox.circle({required double size, super.key})
    : width = size,
      height = size,
      borderRadius = null,
      shape = BoxShape.circle;

  final double? width;
  final double height;
  final BorderRadius? borderRadius;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.zone(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: context.colors.skeletonBase,
          borderRadius: shape == BoxShape.circle ? null : borderRadius,
          shape: shape,
        ),
      ),
    );
  }
}
