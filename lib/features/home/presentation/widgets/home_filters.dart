import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/models/money.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/home/presentation/bloc/home_cubit.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Discounts · Cuisines ⌄ · Top-rated · Under 30 min · Dietary ⌄ ·
/// Delivery fee ⌄ — horizontal quick filters under the home search bar.
class HomeFilterChips extends StatelessWidget {
  const HomeFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (a, b) =>
          a.filter != b.filter || a.filterOptions != b.filterOptions,
      builder: (context, state) {
        final f = state.filter;
        final options = state.filterOptions;
        final chips = <Widget>[
          AppFilterChip(
            label: l10n.homeFilterDiscounts,
            icon: Assets.icons.saleLinear,
            selected: f.discountsOnly,
            onTap: () =>
                cubit.setFilter(f.copyWith(discountsOnly: !f.discountsOnly)),
            onClear: () => cubit.setFilter(f.copyWith(discountsOnly: false)),
          ),
          AppFilterChip(
            label: f.cuisineIds.isEmpty
                ? l10n.homeFilterCuisines
                : '${l10n.homeFilterCuisines} (${f.cuisineIds.length})',
            icon: Assets.icons.chefHatMinimalisticLinear,
            selected: f.cuisineIds.isNotEmpty,
            showDropdown: true,
            onTap: () async {
              // Figma: no Apply button — each tap filters right away.
              await showSelectionSheet<String>(
                context: context,
                title: l10n.homeCuisinesTitle,
                selected: f.cuisineIds,
                options: [
                  for (final c in options.cuisines)
                    SelectionOption(value: c.id, label: c.name),
                ],
                onChanged: (picked) => cubit.setFilter(
                  cubit.state.filter.copyWith(cuisineIds: picked),
                ),
              );
            },
            onClear: () => cubit.setFilter(f.copyWith(cuisineIds: const {})),
          ),
          AppFilterChip(
            label: l10n.homeFilterTopRated,
            icon: Assets.icons.medalStarLinear,
            selected: f.topRated,
            onTap: () => cubit.setFilter(f.copyWith(topRated: !f.topRated)),
            onClear: () => cubit.setFilter(f.copyWith(topRated: false)),
          ),
          AppFilterChip(
            label: l10n.homeFilterUnder30,
            icon: Assets.icons.stopwatchLinear,
            selected: f.under30Minutes,
            onTap: () => cubit.setFilter(
              f.copyWith(under30Minutes: !f.under30Minutes),
            ),
            onClear: () => cubit.setFilter(f.copyWith(under30Minutes: false)),
          ),
          AppFilterChip(
            label: l10n.homeFilterDietary,
            icon: Assets.icons.leafLinear,
            selected: f.dietaryIds.isNotEmpty,
            showDropdown: true,
            onTap: () async {
              await showSelectionSheet<String>(
                context: context,
                title: l10n.homeDietaryTitle,
                selected: f.dietaryIds,
                options: [
                  for (final d in options.dietary)
                    SelectionOption(value: d.id, label: d.name),
                ],
                onChanged: (picked) => cubit.setFilter(
                  cubit.state.filter.copyWith(dietaryIds: picked),
                ),
              );
            },
            onClear: () => cubit.setFilter(f.copyWith(dietaryIds: const {})),
          ),
          AppFilterChip(
            label: f.maxDeliveryFee == null
                ? l10n.homeFilterDeliveryFee
                : '${l10n.homeFilterDeliveryFee} ≤ '
                      '${Money.fromMajor(f.maxDeliveryFee!).formatCompact()}',
            icon: Assets.icons.bicyclingLinear,
            selected: f.maxDeliveryFee != null,
            showDropdown: true,
            onTap: () async {
              final fee = await showDeliveryFeeSheet(
                context,
                max: options.maxDeliveryFee,
                initial: f.maxDeliveryFee,
              );
              if (fee == null) return;
              cubit.setFilter(
                fee.isNaN
                    ? cubit.state.filter.copyWith(maxDeliveryFee: null)
                    : cubit.state.filter.copyWith(maxDeliveryFee: fee),
              );
            },
            onClear: () => cubit.setFilter(f.copyWith(maxDeliveryFee: null)),
          ),
        ];
        return SizedBox(
          height: 32,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: AppInsets.page,
            itemCount: chips.length,
            separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
            itemBuilder: (_, i) => chips[i].entranceX(index: i),
          ),
        );
      },
    );
  }
}

/// Slider sheet for the maximum delivery fee. Pops with the chosen value,
/// `double.nan` for "Reset", or `null` when dismissed.
Future<double?> showDeliveryFeeSheet(
  BuildContext context, {
  required double max,
  double? initial,
}) {
  return showAppBottomSheet<double>(
    context: context,
    title: context.l10n.homeDeliveryFeeTitle,
    builder: (_) => _DeliveryFeeSheet(max: max, initial: initial ?? max),
  );
}

class _DeliveryFeeSheet extends StatefulWidget {
  const _DeliveryFeeSheet({required this.max, required this.initial});

  final double max;
  final double initial;

  @override
  State<_DeliveryFeeSheet> createState() => _DeliveryFeeSheetState();
}

class _DeliveryFeeSheetState extends State<_DeliveryFeeSheet> {
  late double _value = widget.initial.clamp(0, widget.max);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    String money(double v) =>
        Money.fromMajor(v).format(decimalDigits: v % 1 == 0 ? 0 : 2);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.xl,
        AppSpacing.lg,
        AppSpacing.xl,
        MediaQuery.paddingOf(context).bottom + AppSpacing.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Figma: range slider (two white thumbs, dark active segment,
          // light track, no ticks) with the values under each thumb. The
          // filter is a maximum fee, so the start thumb stays at £0.
          LayoutBuilder(
            builder: (context, constraints) {
              const thumb = 12.0;
              final track = constraints.maxWidth - thumb * 2;
              final fraction = widget.max <= 0 ? 0.0 : _value / widget.max;
              Widget label(double x, String text) => Positioned(
                left: thumb + x * track - 40,
                width: 80,
                top: 0,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppTypography.caption,
                ),
              );
              return Column(
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: colors.textPrimary,
                      inactiveTrackColor: colors.surfaceMuted,
                      thumbColor: colors.surface,
                      overlayColor: colors.brand.withValues(alpha: 0.08),
                      trackHeight: 6,
                      rangeThumbShape: const RoundRangeSliderThumbShape(
                        enabledThumbRadius: thumb,
                        pressedElevation: 2,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: thumb,
                      ),
                      rangeTickMarkShape: const RoundRangeSliderTickMarkShape(
                        tickMarkRadius: 0,
                      ),
                      showValueIndicator: ShowValueIndicator.never,
                    ),
                    child: RangeSlider(
                      values: RangeValues(0, _value),
                      max: widget.max,
                      onChanged: (v) => setState(() => _value = v.end),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.textScalerOf(context).scale(18),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        label(0, money(0)),
                        if (fraction > 0.12) label(fraction, money(_value)),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: AppSpacing.xxl + AppSpacing.xs),
          AppButton(
            label: l10n.commonApply,
            size: AppButtonSize.lg,
            // The maximum filters nothing: treat it like "Reset" so the chip
            // doesn't look active.
            onPressed: () => Navigator.pop(
              context,
              _value >= widget.max ? double.nan : _value,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppButton.secondary(
            label: l10n.commonReset,
            size: AppButtonSize.lg,
            onPressed: () => Navigator.pop(context, double.nan),
          ),
        ],
      ),
    );
  }
}
