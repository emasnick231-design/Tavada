import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/tokens/tokens.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/media/app_icon.dart';

/// Displays an image from either a bundled asset (`assets/...`) or a URL.
///
/// API payloads (mock or real) carry image references as strings, so this is
/// the one widget that renders any of them, with a soft placeholder, fade-in
/// and an error fallback. Pass [heroTag] to animate between screens.
class AppImage extends StatelessWidget {
  const AppImage(
    this.source, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.heroTag,
    this.alignment = Alignment.center,
    this.semanticLabel,
  });

  final String source;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Object? heroTag;
  final Alignment alignment;
  final String? semanticLabel;

  bool get _isNetwork => source.startsWith('http');

  @override
  Widget build(BuildContext context) {
    final placeholder = _Placeholder(width: width, height: height);
    Widget image;
    if (source.isEmpty) {
      image = _Fallback(width: width, height: height);
    } else if (_isNetwork) {
      image = CachedNetworkImage(
        imageUrl: source,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        fadeInDuration: AppDurations.normal,
        placeholder: (_, _) => placeholder,
        errorWidget: (_, _, _) => _Fallback(width: width, height: height),
      );
    } else {
      final dpr = MediaQuery.devicePixelRatioOf(context);
      final cacheWidth = width != null && width!.isFinite
          ? (width! * dpr).round()
          : null;
      image = Image(
        image: ResizeImage.resizeIfNeeded(cacheWidth, null, AssetImage(source)),
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        semanticLabel: semanticLabel,
        excludeFromSemantics: semanticLabel == null,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) return child;
          return AnimatedSwitcher(
            duration: AppDurations.normal,
            // Passthrough keeps tight constraints (e.g. Positioned.fill), so
            // `BoxFit.cover` images still fill their slot.
            layoutBuilder: (current, previous) => Stack(
              fit: StackFit.passthrough,
              alignment: Alignment.center,
              children: [...previous, ?current],
            ),
            child: frame == null ? placeholder : child,
          );
        },
        errorBuilder: (_, _, _) => _Fallback(width: width, height: height),
      );
    }

    if (borderRadius != null) {
      image = ClipRRect(borderRadius: borderRadius!, child: image);
    }
    if (heroTag != null) {
      image = Hero(
        tag: heroTag!,
        transitionOnUserGestures: true,
        child: image,
      );
    }
    return image;
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) => Container(
    width: width,
    height: height,
    color: context.colors.skeletonBase,
  );
}

class _Fallback extends StatelessWidget {
  const _Fallback({this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) => Container(
    width: width,
    height: height,
    color: context.colors.surfaceMuted,
    alignment: Alignment.center,
    child: AppIcon(
      Assets.icons.galleryLinear,
      color: context.colors.textDisabled,
    ),
  );
}
