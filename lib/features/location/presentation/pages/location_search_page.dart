import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/session/session_cubit.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/location/presentation/bloc/location_search_cubit.dart';
import 'package:tavada_eats/features/location/presentation/location_flow.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Address search. Pops with the chosen `Place`.
class LocationSearchPage extends StatelessWidget {
  const LocationSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocationSearchCubit(sl()),
      child: const _LocationSearchView(),
    );
  }
}

class _LocationSearchView extends StatelessWidget {
  const _LocationSearchView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final cubit = context.read<LocationSearchCubit>();
    return AppScaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.gutter,
                AppSpacing.sm,
                AppSpacing.gutter,
                AppSpacing.md,
              ),
              child: AppSearchField(
                hint: l10n.locationSearchHint,
                autofocus: true,
                heroTag: 'location-search',
                outlineWhenFocused: true,
                onChanged: cubit.queryChanged,
                onClear: () => cubit.queryChanged(''),
                leading: GestureDetector(
                  onTap: () => context.pop(),
                  child: AppIcon(
                    Assets.icons.arrowLeftLinear,
                    size: AppSizes.iconMd,
                  ),
                ),
              ),
            ),
            Divider(height: 1, color: colors.divider),
            Expanded(
              child: BlocBuilder<LocationSearchCubit, LocationSearchState>(
                builder: (context, state) {
                  if (state.query.isEmpty) {
                    // Figma keeps the map under the focused search bar
                    // until the user starts typing.
                    final center =
                        context.read<SessionCubit>().state.address?.location ??
                        defaultMapCenter;
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: AppMap(center: center, interactive: false),
                        ),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 40),
                            child: MapPin(),
                          ),
                        ),
                      ],
                    );
                  }
                  return AsyncView(
                    status: state.status,
                    failure: state.failure,
                    onRetry: cubit.retry,
                    hasContent: state.results.isNotEmpty,
                    isEmpty: state.results.isEmpty,
                    empty: EmptyState(
                      title: l10n.locationNoResultsTitle,
                      message: l10n.locationNoResultsMessage,
                    ),
                    loading: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    builder: (_) => ListView.separated(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      // Figma: rows inset to x=28…347, 14pt Regular text.
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      itemCount: state.results.length,
                      separatorBuilder: (_, _) =>
                          Divider(height: 1, color: colors.divider),
                      itemBuilder: (context, i) {
                        final place = state.results[i];
                        final label = [
                          place.title,
                          if (place.subtitle.isNotEmpty) place.subtitle,
                        ].join(', ');
                        return InkWell(
                          onTap: () => context.pop(place),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: AppSpacing.lg,
                            ),
                            child: Text(
                              label,
                              style: AppTypography.bodyMedium.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ).entrance(index: i);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
