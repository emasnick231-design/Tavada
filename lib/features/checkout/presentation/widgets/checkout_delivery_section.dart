import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/models/models.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/core/utils/formatters.dart';
import 'package:tavada_eats/features/catalog/catalog.dart';
import 'package:tavada_eats/features/checkout/presentation/widgets/checkout_info_row.dart';
import 'package:tavada_eats/features/orders/domain/entities/order.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Body of "Delivery Info": Delivery/Pickup switch, map preview and rows.
class CheckoutDeliverySection extends StatelessWidget {
  const CheckoutDeliverySection({
    required this.mode,
    required this.onModeChanged,
    required this.onAddressTap,
    required this.onInstructionsTap,
    required this.onAllergyTap,
    super.key,
    this.restaurant,
    this.address,
    this.instructions,
    this.etaMinutes = 20,
    this.distanceMiles = 0.5,
  });

  final DeliveryMode mode;
  final ValueChanged<DeliveryMode> onModeChanged;
  final VoidCallback onAddressTap;
  final VoidCallback onInstructionsTap;
  final VoidCallback onAllergyTap;
  final Restaurant? restaurant;
  final DeliveryAddress? address;
  final String? instructions;
  final int etaMinutes;
  final double distanceMiles;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isPickup = mode == DeliveryMode.pickup;
    final distance = l10n.checkoutMiles(Formatters.distance(distanceMiles));
    // Body only: the page wraps it in the collapsible "Delivery Info"
    // section (a second header here rendered the title twice).
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: AppInsets.page,
          child: SegmentedTabs(
            height: 46,
            segments: [l10n.checkoutDelivery, l10n.checkoutPickup],
            selectedIndex: isPickup ? 1 : 0,
            onChanged: (i) => onModeChanged(
              i == 1 ? DeliveryMode.pickup : DeliveryMode.delivery,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Padding(
          padding: AppInsets.page,
          child: _MapPreview(
            center:
                (isPickup ? restaurant?.location : address?.location) ??
                restaurant?.location,
            label: distance,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        AnimatedSwitcher(
          duration: AppDurations.normal,
          switchInCurve: AppCurves.emphasized,
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: SizeTransition(sizeFactor: animation, child: child),
          ),
          child: isPickup
              ? _PickupRows(
                  key: const ValueKey('pickup'),
                  address: restaurant?.address ?? '',
                  distance: distance,
                  etaMinutes: etaMinutes,
                )
              : _DeliveryRows(
                  key: const ValueKey('delivery'),
                  address: address,
                  instructions: instructions,
                  etaMinutes: etaMinutes,
                  onAddressTap: onAddressTap,
                  onInstructionsTap: onInstructionsTap,
                  onAllergyTap: onAllergyTap,
                ),
        ),
        const SizedBox(height: AppSpacing.sm),
      ],
    );
  }
}

class _MapPreview extends StatelessWidget {
  const _MapPreview({required this.center, required this.label});

  final GeoPoint? center;
  final String label;

  @override
  Widget build(BuildContext context) {
    final point =
        center ?? const GeoPoint(latitude: 51.4740, longitude: -0.0690);
    return SizedBox(
      height: 128,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: AppMap(
              key: ValueKey(point),
              center: point,
              zoom: 14.5,
              interactive: false,
              showAttribution: false,
              borderRadius: AppRadii.xlAll,
            ),
          ),
          const Positioned(
            left: 0,
            right: 54,
            child: Center(child: MapPin(size: 34)),
          ),
          Positioned(top: 34, child: MapLabel(text: label)),
        ],
      ),
    );
  }
}

class _DeliveryRows extends StatelessWidget {
  const _DeliveryRows({
    required this.address,
    required this.instructions,
    required this.etaMinutes,
    required this.onAddressTap,
    required this.onInstructionsTap,
    required this.onAllergyTap,
    super.key,
  });

  final DeliveryAddress? address;
  final String? instructions;
  final int etaMinutes;
  final VoidCallback onAddressTap;
  final VoidCallback onInstructionsTap;
  final VoidCallback onAllergyTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final hasInstructions = instructions != null && instructions!.isNotEmpty;
    return Column(
      children: [
        CheckoutInfoRow(
          icon: Assets.icons.mapPointLinear,
          title: address?.fullAddress ?? l10n.checkoutChooseAddress,
          onTap: onAddressTap,
        ),
        CheckoutInfoRow(
          icon: Assets.icons.clipboardListLinear,
          title: l10n.checkoutDeliveryInstructions,
          subtitle: hasInstructions
              ? instructions
              : l10n.checkoutDeliveryInstructionsHint,
          onTap: onInstructionsTap,
        ),
        CheckoutInfoRow(
          icon: Assets.icons.shieldWarningLinear,
          title: l10n.checkoutAllergyInfo,
          onTap: onAllergyTap,
        ),
        CheckoutInfoRow(
          icon: Assets.icons.boltLinear,
          title: l10n.checkoutDeliversIn(etaMinutes),
          showDivider: false,
        ),
      ],
    );
  }
}

class _PickupRows extends StatelessWidget {
  const _PickupRows({
    required this.address,
    required this.distance,
    required this.etaMinutes,
    super.key,
  });

  final String address;
  final String distance;
  final int etaMinutes;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        CheckoutInfoRow(
          icon: Assets.icons.shop2Linear,
          title: l10n.checkoutStoreLocation,
          subtitle: address,
        ),
        CheckoutInfoRow(
          icon: Assets.icons.walkingRoundLinear,
          title: l10n.checkoutDistance,
          subtitle: distance,
        ),
        CheckoutInfoRow(
          icon: Assets.icons.alarmLinear,
          title: l10n.checkoutPickupTime,
          subtitle: l10n.checkoutPickupWindow(etaMinutes, etaMinutes + 10),
          showDivider: false,
        ),
      ],
    );
  }
}
