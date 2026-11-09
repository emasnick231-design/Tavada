import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/models/geo_point.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/media/app_icon.dart';

export 'package:flutter_map/flutter_map.dart'
    show MapCamera, MapController, Marker, MarkerLayer, Polyline, PolylineLayer;
export 'package:latlong2/latlong.dart' show LatLng;

extension GeoPointLatLngX on GeoPoint {
  LatLng get latLng => LatLng(latitude, longitude);
}

extension LatLngGeoPointX on LatLng {
  GeoPoint get geoPoint => GeoPoint(latitude: latitude, longitude: longitude);
}

/// Grayscale map matching the design (CARTO Positron tiles, no API key).
///
/// * [onCameraMove] reports the centre while the user drags (location picker).
/// * Add markers/route via [layers] (e.g. `MarkerLayer`, `PolylineLayer`).
class AppMap extends StatelessWidget {
  const AppMap({
    required this.center,
    super.key,
    this.zoom = 15,
    this.controller,
    this.layers = const [],
    this.interactive = true,
    this.onCameraMove,
    this.onMapReady,
    this.borderRadius,
    this.showAttribution = true,
  });

  final GeoPoint center;
  final double zoom;
  final MapController? controller;
  final List<Widget> layers;
  final bool interactive;
  final void Function(GeoPoint center, {required bool byGesture})? onCameraMove;
  final VoidCallback? onMapReady;
  final BorderRadius? borderRadius;
  final bool showAttribution;

  static const tileUrl =
      'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png';

  @override
  Widget build(BuildContext context) {
    final map = FlutterMap(
      mapController: controller,
      options: MapOptions(
        initialCenter: center.latLng,
        initialZoom: zoom,
        minZoom: 3,
        maxZoom: 19,
        backgroundColor: context.colors.surfaceMuted,
        onMapReady: onMapReady,
        interactionOptions: InteractionOptions(
          flags: interactive
              ? InteractiveFlag.all & ~InteractiveFlag.rotate
              : InteractiveFlag.none,
        ),
        onPositionChanged: onCameraMove == null
            ? null
            : (camera, hasGesture) =>
                  onCameraMove!(camera.center.geoPoint, byGesture: hasGesture),
      ),
      children: [
        TileLayer(
          urlTemplate: tileUrl,
          subdomains: const ['a', 'b', 'c', 'd'],
          userAgentPackageName: 'com.tavadaeats.app',
          retinaMode: RetinaMode.isHighDensity(context),
          maxNativeZoom: 20,
        ),
        ...layers,
        if (showAttribution)
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Text(
                context.l10n.mapAttribution,
                style: AppTypography.labelSmall.copyWith(
                  fontSize: 8,
                  color: context.colors.textTertiary,
                ),
              ),
            ),
          ),
      ],
    );
    if (borderRadius == null) return map;
    return ClipRRect(borderRadius: borderRadius!, child: map);
  }
}

/// Orange location pin. When [lifted] (map being dragged) it floats up with a
/// shadow, then drops back with a bounce.
class MapPin extends StatelessWidget {
  const MapPin({super.key, this.lifted = false, this.size = 40});

  final bool lifted;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SizedBox(
      width: size,
      height: size + 14,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Ground shadow grows when lifted.
          AnimatedContainer(
            duration: AppDurations.normal,
            width: lifted ? 14 : 8,
            height: lifted ? 5 : 3,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: lifted ? 0.18 : 0.28),
              borderRadius: AppRadii.pillAll,
            ),
          ),
          AnimatedPositioned(
            duration: AppDurations.normal,
            curve: lifted ? AppCurves.emphasized : AppCurves.bounce,
            bottom: lifted ? 14 : 2,
            child: Stack(
              alignment: const Alignment(0, -0.28),
              children: [
                AppIcon(
                  Assets.icons.mapPointBold,
                  size: size,
                  color: colors.brand,
                ),
                Container(
                  width: size * 0.3,
                  height: size * 0.3,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Small white pill on maps ("0.5 miles").
class MapLabel extends StatelessWidget {
  const MapLabel({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: AppRadii.mdAll,
        boxShadow: AppShadows.md,
      ),
      child: Text(
        text,
        style: AppTypography.labelMedium.copyWith(fontSize: 13),
      ),
    ).animate().fadeIn().scale(
      begin: const Offset(0.8, 0.8),
      end: const Offset(1, 1),
    );
  }
}

/// Pulsing dot for the user's / rider's live position.
class PulsingDot extends StatelessWidget {
  const PulsingDot({super.key, this.color, this.size = 16});

  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    final c = color ?? context.colors.brand;
    return SizedBox(
      width: size * 2.6,
      height: size * 2.6,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
                width: size * 2.6,
                height: size * 2.6,
                decoration: BoxDecoration(
                  color: c.withValues(alpha: 0.25),
                  shape: BoxShape.circle,
                ),
              )
              .animate(onPlay: (ctl) => ctl.repeat())
              .scale(
                begin: const Offset(0.4, 0.4),
                end: const Offset(1, 1),
                duration: 1400.ms,
              )
              .fadeOut(duration: 1400.ms),
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: c,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.white, width: 3),
              boxShadow: AppShadows.md,
            ),
          ),
        ],
      ),
    );
  }
}
