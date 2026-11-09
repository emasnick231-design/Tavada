import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/catalog/domain/entities/discovery.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Category illustration + label ("Breakfast"). [selected] adds the peach
/// halo used when the category filters the home feed.
class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.category,
    super.key,
    this.onTap,
    this.selected = false,
    this.size = 42,
    this.width = 84,
  });

  final Category category;
  final VoidCallback? onTap;
  final bool selected;
  final double size;
  final double width;

  static Widget placeholder() => const CategoryItem(
    category: Category(id: 'placeholder', name: 'Category', imageUrl: ''),
  );

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      scale: 0.92,
      semanticLabel: category.name,
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: AppDurations.normal,
              curve: AppCurves.spring,
              width: size + 8,
              height: size + 8,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? colors.brandMuted : Colors.transparent,
              ),
              child: AnimatedScale(
                scale: selected ? 0.9 : 1,
                duration: AppDurations.normal,
                curve: AppCurves.spring,
                child: AppImage(
                  category.imageUrl,
                  width: size,
                  height: size,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              category.name,
              style: AppTypography.bodySmall.copyWith(
                color: selected ? colors.brand : colors.textPrimary,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/// Cuisine photo card ("Trendy cuisines near you").
class CuisineCard extends StatelessWidget {
  const CuisineCard({
    required this.cuisine,
    super.key,
    this.onTap,
    this.imageHeight = 100,
  });

  final Cuisine cuisine;
  final VoidCallback? onTap;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return PressableScale(
      onTap: onTap,
      semanticLabel: cuisine.name,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImage(
            cuisine.imageUrl,
            height: imageHeight,
            width: double.infinity,
            borderRadius: AppRadii.lgAll,
          ),
          const SizedBox(height: AppSpacing.sm),
          Padding(
            padding: const EdgeInsets.only(left: AppSpacing.sm),
            child: Text(
              cuisine.name,
              style: AppTypography.titleSmall.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Home promo banner (Figma "Ads"): a 343×62 card with a two-line 12pt
/// title, a dark pill CTA and the food photo framed by a dark ring, a solid
/// arc band and two faint arc outlines bleeding off the right edge.
///
/// The card is 62pt like Figma and grows with its content, so long locales
/// and large accessibility text never clip the title: size a horizontal rail
/// with [railHeight].
class PromoBannerCard extends StatelessWidget {
  const PromoBannerCard({
    required this.banner,
    super.key,
    this.onTap,
    this.minHeight = 62,
  });

  final PromoBanner banner;
  final VoidCallback? onTap;
  final double minHeight;

  /// Radius of the photo ring / arcs (Figma: 72pt).
  static const double _arc = 72;

  /// Photo ring centre, measured from the card's right edge.
  static const double _ringInset = 24;

  /// Horizontal pitch between the concentric-looking arcs.
  static const double _arcPitch = 25;

  /// Width kept free on the right for the photo ring (the pill may overlap
  /// the arcs at large text sizes, never the photo).
  static const double _artworkWidth = _ringInset + _arc + 4;

  /// Figma title box width: wraps "Get 10% off / your first order!".
  static const double _titleWidth = 93;

  static final TextStyle _titleStyle = AppTypography.labelMedium.copyWith(
    height: 16 / 12,
  );
  static final TextStyle _ctaStyle = AppTypography.badge.copyWith(
    fontWeight: FontWeight.w700,
    height: 14 / 11,
    color: AppColors.white,
  );

  /// Banner width in the home rail: the screen minus the page gutters.
  static double cardWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width - AppSpacing.gutter * 2;

  /// Measures the title/pill layout for [banner] at the current text scale.
  static ({bool stacked, double titleWidth, double height}) _measure(
    BuildContext context,
    PromoBanner banner,
  ) {
    final scaler = MediaQuery.textScalerOf(context);
    final direction = Directionality.of(context);
    final cta = TextPainter(
      text: TextSpan(text: banner.ctaLabel, style: _ctaStyle),
      textDirection: direction,
      textScaler: scaler,
      maxLines: 1,
    )..layout();
    final ctaWidth = cta.width + AppSpacing.sm * 2 + 14 + 6 + 2;
    cta.dispose();
    final content = cardWidth(context) - AppSpacing.lg - _artworkWidth;
    final maxTitle = scaler.scale(_titleWidth);
    final besidePill = content - AppSpacing.lg - ctaWidth;
    // Pill drops below the title when it would crush it.
    final stacked = besidePill < maxTitle * 0.8;
    final titleWidth = stacked
        ? math.min(maxTitle, content)
        : math.min(maxTitle, besidePill);
    final title = TextPainter(
      text: TextSpan(text: banner.title, style: _titleStyle),
      textDirection: direction,
      textScaler: scaler,
      maxLines: 4,
    )..layout(maxWidth: titleWidth);
    final titleHeight = title.height;
    title.dispose();
    final body = stacked
        ? titleHeight + AppSpacing.xs + 2 + 26
        : math.max(titleHeight, 26).toDouble();
    return (
      stacked: stacked,
      titleWidth: titleWidth,
      height: math.max(62, body + AppSpacing.sm * 2),
    );
  }

  /// Height for a rail of [banners] (tallest card).
  static double railHeight(BuildContext context, List<PromoBanner> banners) =>
      banners.fold(62, (h, b) => math.max(h, _measure(context, b).height));

  ({Color bg, Color band, Color ring, Color ctaBg, Color ctaBorder})
  _palette() => switch (banner.style) {
    BannerStyle.teal => (
      bg: AppColors.java100,
      band: AppColors.java300,
      ring: AppColors.java950,
      ctaBg: AppColors.java900,
      ctaBorder: AppColors.java950,
    ),
    BannerStyle.pink => (
      bg: AppColors.cosmos100,
      band: AppColors.cosmos300,
      ring: AppColors.cosmos950,
      ctaBg: AppColors.cosmos900,
      ctaBorder: AppColors.cosmos950,
    ),
    BannerStyle.lavender => (
      bg: AppColors.lavender100,
      band: AppColors.lavender200,
      ring: AppColors.lavender900,
      ctaBg: AppColors.lavender700,
      ctaBorder: AppColors.lavender900,
    ),
    BannerStyle.cream => (
      bg: AppColors.sazerac100,
      band: AppColors.sazerac200,
      ring: AppColors.primary950,
      ctaBg: AppColors.primary900,
      ctaBorder: AppColors.primary950,
    ),
  };

  @override
  Widget build(BuildContext context) {
    final p = _palette();
    const photo = (_arc - 6) * 2;
    final layout = _measure(context, banner);
    final stacked = layout.stacked;
    final title = ConstrainedBox(
      constraints: BoxConstraints(maxWidth: layout.titleWidth),
      child: Text(
        banner.title,
        style: _titleStyle,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
      ),
    );
    final pill = Container(
      height: 26,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: p.ctaBg,
        border: Border.all(color: p.ctaBorder),
        borderRadius: AppRadii.smAll,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcon(
            Assets.icons.tagPriceBold,
            size: 14,
            color: AppColors.gold400,
          ),
          const SizedBox(width: 6),
          Text(banner.ctaLabel, maxLines: 1, style: _ctaStyle),
        ],
      ),
    );
    return PressableScale(
      onTap: onTap,
      scale: 0.98,
      semanticLabel: banner.title,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        decoration: BoxDecoration(color: p.bg, borderRadius: AppRadii.lgAll),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: _BannerArcsPainter(
                  band: p.band,
                  ring: p.ring,
                  radius: _arc,
                  inset: _ringInset,
                  pitch: _arcPitch,
                ),
              ),
            ),
            // Food photo inside the dark ring, centred vertically.
            Positioned(
              top: 0,
              bottom: 0,
              right: _ringInset - photo / 2,
              width: photo,
              child: Center(
                child: OverflowBox(
                  maxHeight: photo,
                  minHeight: photo,
                  child: ClipOval(
                    child: AppImage(
                      banner.imageUrl,
                      width: photo,
                      height: photo,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                AppSpacing.lg,
                AppSpacing.sm,
                _artworkWidth,
                AppSpacing.sm,
              ),
              // Title and pill side by side like Figma; when the pill would
              // crush the title (narrow screen, long locale, large text) the
              // pill drops below it instead.
              child: stacked
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title,
                        const SizedBox(height: AppSpacing.xs + 2),
                        pill,
                      ],
                    )
                  : Row(
                      children: [
                        Flexible(child: title),
                        const SizedBox(width: AppSpacing.lg),
                        pill,
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Faint arc outlines, the solid arc band and the dark photo ring of
/// [PromoBannerCard], anchored to the card's right edge.
class _BannerArcsPainter extends CustomPainter {
  const _BannerArcsPainter({
    required this.band,
    required this.ring,
    required this.radius,
    required this.inset,
    required this.pitch,
  });

  final Color band;
  final Color ring;
  final double radius;
  final double inset;
  final double pitch;

  @override
  void paint(Canvas canvas, Size size) {
    final cy = size.height / 2;
    final cx = size.width - inset;
    final outline = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = band.withValues(alpha: 0.35);
    canvas
      ..drawCircle(Offset(cx - pitch * 3, cy), radius, outline)
      ..drawCircle(Offset(cx - pitch * 2, cy), radius, outline)
      ..drawCircle(Offset(cx - pitch, cy), radius, Paint()..color = band)
      ..drawCircle(Offset(cx, cy), radius, Paint()..color = ring);
  }

  @override
  bool shouldRepaint(_BannerArcsPainter old) =>
      old.band != band || old.ring != ring;
}
