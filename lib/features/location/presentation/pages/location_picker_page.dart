import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/session/session_cubit.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/location/domain/entities/place.dart';
import 'package:tavada_eats/features/location/presentation/bloc/location_picker_cubit.dart';
import 'package:tavada_eats/features/location/presentation/location_flow.dart';
import 'package:tavada_eats/features/location/presentation/pages/location_intro_page.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// "Choose location": drag the map under a fixed pin, then confirm.
class LocationPickerPage extends StatelessWidget {
  const LocationPickerPage({required this.args, super.key});

  final LocationPickerArgs args;

  @override
  Widget build(BuildContext context) {
    final saved = context.read<SessionCubit>().state.address?.location;
    return BlocProvider(
      create: (_) => LocationPickerCubit(
        sl(),
        center: args.center ?? saved ?? defaultMapCenter,
        place: args.place,
      ),
      child: _LocationPickerView(popOnSelect: args.popOnSelect),
    );
  }
}

class _LocationPickerView extends StatefulWidget {
  const _LocationPickerView({required this.popOnSelect});

  final bool popOnSelect;

  @override
  State<_LocationPickerView> createState() => _LocationPickerViewState();
}

class _LocationPickerViewState extends State<_LocationPickerView> {
  final _map = MapController();
  bool _locating = false;

  @override
  void dispose() {
    _map.dispose();
    super.dispose();
  }

  Future<void> _openSearch() async {
    final place = await context.push<Place>(AppRoutes.locationSearch);
    if (place == null || !mounted) return;
    _map.move(place.location.latLng, _map.camera.zoom);
    context.read<LocationPickerCubit>().moveTo(place.location, place: place);
  }

  Future<void> _recenter() async {
    setState(() => _locating = true);
    final point = await findDeviceLocation(context);
    if (!mounted) return;
    setState(() => _locating = false);
    if (point == null) return;
    _map.move(point.latLng, 16);
    context.read<LocationPickerCubit>().moveTo(point);
  }

  void _select(Place place) {
    context.read<SessionCubit>().setAddress(place.toAddress());
    if (widget.popOnSelect && context.canPop()) {
      context.pop(place);
    } else {
      context.go(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<LocationPickerCubit>();
    return AppScaffold(
      appBar: AppTopBar(
        title: l10n.locationPickerTitle,
        showBack: context.canPop(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.gutter,
              AppSpacing.xs,
              AppSpacing.gutter,
              AppSpacing.md,
            ),
            child: AppSearchField(
              hint: l10n.locationSearchHint,
              readOnly: true,
              heroTag: 'location-search',
              onTap: _openSearch,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: AppMap(
                    center: cubit.state.center,
                    controller: _map,
                    onCameraMove: cubit.cameraMoved,
                  ),
                ),
                // The pin stays centred while the map moves underneath.
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child:
                        BlocSelector<
                          LocationPickerCubit,
                          LocationPickerState,
                          bool
                        >(
                          selector: (s) => s.isDragging,
                          builder: (_, dragging) => MapPin(lifted: dragging),
                        ),
                  ),
                ),
                Positioned(
                  left: AppSpacing.xl,
                  right: AppSpacing.xl,
                  bottom: AppSpacing.lg,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (_locating)
                        const SizedBox(
                          width: AppSizes.circleButton,
                          height: AppSizes.circleButton,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ),
                        )
                      else
                        AppIconButton(
                          icon: Assets.icons.gpsLinear,
                          variant: AppIconButtonVariant.elevated,
                          tooltip: l10n.locationRecenter,
                          onPressed: _recenter,
                        ),
                      const SizedBox(height: AppSpacing.md),
                      const _AddressCard(),
                      const SizedBox(height: AppSpacing.lg),
                      BlocBuilder<LocationPickerCubit, LocationPickerState>(
                        builder: (context, state) {
                          // Lookup failed: the customer can still use the pin.
                          final place =
                              state.place ??
                              (state.resolveFailed
                                  ? Place(
                                      id:
                                          'pin-${state.center.latitude},'
                                          '${state.center.longitude}',
                                      title: l10n.locationPinnedTitle,
                                      location: state.center,
                                    )
                                  : null);
                          final ready =
                              place != null &&
                              !state.isDragging &&
                              !state.isResolving;
                          return AppButton(
                            label: l10n.locationSelect,
                            onPressed: ready ? () => _select(place) : null,
                          );
                        },
                      ),
                      SizedBox(height: MediaQuery.paddingOf(context).bottom),
                    ],
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

class _AddressCard extends StatelessWidget {
  const _AddressCard();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadii.xlAll,
        border: Border.all(color: AppColors.primary200),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ColoredBox(
            color: colors.brandSubtle,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 13),
              child: Text(
                l10n.locationDragHint,
                textAlign: TextAlign.center,
                style: AppTypography.bodySmall.copyWith(
                  color: colors.textBrand,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.xl,
              AppSpacing.lg,
              AppSpacing.lg,
            ),
            child: BlocBuilder<LocationPickerCubit, LocationPickerState>(
              builder: (context, state) {
                final failed =
                    state.resolveFailed &&
                    !state.isDragging &&
                    !state.isResolving;
                final busy =
                    !failed &&
                    (state.isDragging ||
                        state.isResolving ||
                        state.place == null);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppIcon(
                          Assets.icons.mapPointBold,
                          size: AppSizes.iconMd,
                          color: colors.brand,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: AnimatedSwitcher(
                            duration: AppDurations.fast,
                            layoutBuilder: (current, previous) => Stack(
                              alignment: Alignment.centerLeft,
                              children: [...previous, ?current],
                            ),
                            child: Text(
                              busy
                                  ? l10n.locationResolving
                                  : failed
                                  ? l10n.locationPinnedTitle
                                  : state.place!.title,
                              key: ValueKey(
                                busy
                                    ? ''
                                    : failed
                                    ? 'pin'
                                    : state.place!.id,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTypography.headlineSmall.copyWith(
                                fontWeight: FontWeight.w500,
                                color: busy
                                    ? colors.textTertiary
                                    : colors.textPrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    if (failed)
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              l10n.locationResolveFailed,
                              style: AppTypography.bodySmall.copyWith(
                                color: colors.error,
                              ),
                            ),
                          ),
                          AppLinkButton(
                            label: l10n.commonRetry,
                            onPressed: context
                                .read<LocationPickerCubit>()
                                .retry,
                          ),
                        ],
                      )
                    else
                      Text(
                        l10n.locationConfirmCurrent,
                        style: AppTypography.bodySmall.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
