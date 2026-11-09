import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/shared/widgets/media/app_image.dart';

/// Circular avatar with image, initials fallback and optional online dot.
class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = AppSizes.avatarMd,
    this.showOnlineIndicator = false,
    this.borderColor,
    this.backgroundColor,
    this.heroTag,
  });

  final String? imageUrl;
  final String? initials;
  final double size;
  final bool showOnlineIndicator;
  final Color? borderColor;
  final Color? backgroundColor;
  final Object? heroTag;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final hasImage = imageUrl != null && imageUrl!.isNotEmpty;
    Widget avatar = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? colors.brandSubtle,
        border: borderColor == null
            ? null
            : Border.all(color: borderColor!, width: 2),
      ),
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      child: hasImage
          ? AppImage(imageUrl!, width: size, height: size)
          : Text(
              initials ?? '',
              style: AppTypography.labelLarge.copyWith(
                color: colors.brand,
                fontSize: size * 0.36,
              ),
            ),
    );
    if (heroTag != null) avatar = Hero(tag: heroTag!, child: avatar);
    if (!showOnlineIndicator) return avatar;

    final dot = size * 0.22;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          avatar,
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: dot,
              height: dot,
              decoration: BoxDecoration(
                color: colors.success,
                shape: BoxShape.circle,
                border: Border.all(color: colors.surface, width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
