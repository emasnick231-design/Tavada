import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/session/session_cubit.dart';
import 'package:tavada_eats/core/settings/settings_cubit.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/catalog/domain/entities/discovery.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant.dart';
import 'package:tavada_eats/features/catalog/presentation/widgets/discovery_widgets.dart';
import 'package:tavada_eats/features/catalog/presentation/widgets/restaurant_card.dart';
import 'package:tavada_eats/features/catalog/presentation/widgets/store_tile.dart';
import 'package:tavada_eats/features/home/presentation/bloc/home_cubit.dart';
import 'package:tavada_eats/features/home/presentation/widgets/home_filters.dart';
import 'package:tavada_eats/features/location/presentation/location_flow.dart';
import 'package:tavada_eats/features/location/presentation/pages/location_intro_page.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Home tab: address, search, quick filters, promos, categories and the
/// curated restaurant rails (or the filtered results).
class HomePage extends StatelessWidget {
  const HomePage({super.key, this.storesMode = false});

  /// Stores tab: same feed without promos, featured stores first.
  final bool storesMode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = HomeCubit(sl());
        unawaited(cubit.load());
        return cubit;
      },
      child: Builder(
        builder: (context) => MultiBlocListener(
          listeners: [
            // A new address changes which stores deliver (and how fast).
            BlocListener<SessionCubit, SessionState>(
              listenWhen: (a, b) => a.address != b.address,
              listener: (context, _) =>
                  unawaited(context.read<HomeCubit>().load()),
            ),
            // Server text (banners, sections, categories) is localized.
            BlocListener<SettingsCubit, SettingsState>(
              listenWhen: (a, b) => a.languageCode != b.languageCode,
              listener: (context, _) =>
                  unawaited(context.read<HomeCubit>().load()),
            ),
          ],
          child: _HomeView(storesMode: storesMode),
        ),
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({required this.storesMode});

  final bool storesMode;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final bottomInset =
        MediaQuery.paddingOf(context).bottom + AppSizes.bottomNavHeight;
    return AppScaffold(
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.status.isFailure && state.feed.sections.isEmpty) {
              return Column(
                children: [
                  const _HomeHeader(),
                  Expanded(
                    child: ErrorStateView(
                      failure: state.failure,
                      onRetry: cubit.load,
                    ),
                  ),
                ],
              );
            }
            final loading = state.status.isBusy;
            return RefreshIndicator(
              onRefresh: cubit.load,
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: _HomeHeader()),
                  SliverToBoxAdapter(
                    child: AnimatedSize(
                      duration: AppDurations.normal,
                      curve: AppCurves.emphasized,
                      alignment: Alignment.topCenter,
                      child: state.showFilters || state.filter.isActive
                          ? const Padding(
                              padding: EdgeInsets.only(bottom: AppSpacing.lg),
                              child: HomeFilterChips(),
                            )
                          : const SizedBox(width: double.infinity),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: AppSkeleton(
                      enabled: loading,
                      child: _Discovery(
                        feed: state.feed,
                        loading: loading,
                        showBanners: !storesMode,
                      ),
                    ),
                  ),
                  const SliverSectionGap(),
                  if (state.isFiltering)
                    ..._results(context, state)
                  else
                    ..._sections(context, state, loading: loading),
                  SliverToBoxAdapter(
                    child: SizedBox(height: bottomInset + AppSpacing.lg),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _sections(
    BuildContext context,
    HomeState state, {
    required bool loading,
  }) {
    if (loading) {
      return [
        SliverToBoxAdapter(
          child: AppSkeleton(
            enabled: true,
            child: _RestaurantRail(
              section: HomeSection(
                id: 'loading',
                title: 'Places near you',
                restaurants: List.generate(
                  3,
                  RestaurantCard.placeholderRestaurant,
                ),
              ),
            ),
          ),
        ),
      ];
    }
    final sections = state.feed.sections
        .where((s) => s.restaurants.isNotEmpty)
        .toList();
    if (storesMode) {
      // Featured stores lead the Stores tab.
      sections.sort(
        (a, b) =>
            (b.layout == HomeSectionLayout.storeGrid ? 1 : 0) -
            (a.layout == HomeSectionLayout.storeGrid ? 1 : 0),
      );
    }
    if (sections.isEmpty && state.status.isSuccess) {
      return [
        SliverToBoxAdapter(
          child: EmptyState(
            title: context.l10n.homeNoStoresTitle,
            message: context.l10n.homeNoStoresMessage,
            image: Assets.images.categories.soupStews.path,
            actionLabel: context.l10n.homeChangeAddress,
            onAction: () => showChangeLocationSheet(context),
          ),
        ),
      ];
    }
    return [
      for (var i = 0; i < sections.length; i++) ...[
        if (i > 0) const SliverSectionGap(),
        SliverToBoxAdapter(
          child: sections[i].layout == HomeSectionLayout.storeGrid
              ? _StoreGrid(section: sections[i])
              : _RestaurantRail(section: sections[i]),
        ),
      ],
    ];
  }

  List<Widget> _results(BuildContext context, HomeState state) {
    final l10n = context.l10n;
    final cubit = context.read<HomeCubit>();
    final header = SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.gutter,
          AppSpacing.lg,
          AppSpacing.gutter,
          AppSpacing.md,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                state.resultsStatus.isSuccess
                    ? l10n.commonResults(state.results.length)
                    : ' ',
                style: AppTypography.labelLarge,
              ),
            ),
            AppButton.neutral(
              label: l10n.commonReset,
              size: AppButtonSize.xs,
              onPressed: cubit.resetFilter,
            ),
          ],
        ),
      ),
    );
    if (state.resultsStatus.isFailure) {
      return [
        header,
        SliverToBoxAdapter(
          child: ErrorStateView(
            failure: state.resultsFailure,
            onRetry: cubit.retryResults,
            compact: true,
          ),
        ),
      ];
    }
    final loading = !state.resultsStatus.isSuccess;
    final items = loading
        ? List.generate(3, RestaurantCard.placeholderRestaurant)
        : state.results;
    if (!loading && items.isEmpty) {
      return [
        header,
        SliverToBoxAdapter(
          child: EmptyState(
            title: l10n.homeNoResultsTitle,
            message: l10n.homeNoResultsMessage,
            image: Assets.images.categories.lunch.path,
            compact: true,
            actionLabel: l10n.commonReset,
            onAction: cubit.resetFilter,
          ),
        ),
      ];
    }
    return [
      header,
      SliverPadding(
        padding: AppInsets.page,
        sliver: AppSliverSkeleton(
          enabled: loading,
          child: SliverList.separated(
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.xl),
            itemBuilder: (context, i) => RestaurantCard(
              restaurant: items[i],
              showCuisine: false,
              showDeliveryFee: false,
              enableHero: !loading,
              onTap: () => context.push(AppRoutes.restaurant(items[i].id)),
            ).entrance(index: i),
          ),
        ),
      ),
    ];
  }
}

/// "Now · 23, Fredrick Avenu… ⌄" + Filter, then the search bar.
class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final address = context.select<SessionCubit, String?>(
      (c) => c.state.address?.line1,
    );
    final filtersOpen = context.select<HomeCubit, bool>(
      (c) => c.state.showFilters || c.state.filter.isActive,
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.gutter,
        AppSpacing.lg,
        AppSpacing.gutter,
        AppSpacing.lg,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: PressableScale(
                  onTap: () => showChangeLocationSheet(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.homeNow,
                        style: AppTypography.caption.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                      Row(
                        children: [
                          // Figma caps the label (~130pt) so the chevron stays
                          // next to it: "23, Fredrick Avenu… ⌄".
                          Flexible(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.textScalerOf(
                                  context,
                                ).scale(130),
                              ),
                              child: Text(
                                address ?? l10n.homeAddAddress,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTypography.labelLarge,
                              ),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          AppIcon(
                            Assets.icons.altArrowDownLinear,
                            size: AppSizes.iconMd,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.xxxl),
              _FilterButton(
                active: filtersOpen,
                onTap: context.read<HomeCubit>().toggleFilters,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          AppSearchField(
            hint: l10n.homeSearchHint,
            readOnly: true,
            onTap: () => context.push(AppRoutes.search),
          ),
        ],
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton({required this.active, required this.onTap});

  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      semanticLabel: context.l10n.homeFilter,
      child: AnimatedContainer(
        duration: AppDurations.fast,
        height: 34,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        // Figma keeps the same peach pill whether or not filters are open.
        decoration: BoxDecoration(
          color: colors.brandSubtle,
          borderRadius: AppRadii.pillAll,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.l10n.homeFilter,
              style: AppTypography.labelLarge.copyWith(color: colors.brand),
            ),
            const SizedBox(width: AppSpacing.sm),
            AppIcon(
              Assets.icons.tuning2Linear,
              size: AppSizes.iconMd,
              color: colors.brand,
            ),
          ],
        ),
      ),
    );
  }
}

/// One promo banner at a time, sliding to the next every few seconds
/// (endless loop). Swiping works too and restarts the countdown.
class _PromoCarousel extends StatefulWidget {
  const _PromoCarousel({required this.banners, required this.autoPlay});

  final List<PromoBanner> banners;
  final bool autoPlay;

  @override
  State<_PromoCarousel> createState() => _PromoCarouselState();
}

class _PromoCarouselState extends State<_PromoCarousel> {
  static const _interval = Duration(seconds: 2);

  /// Start far from 0 so the user can also swipe backwards "forever".
  static const _loopStart = 1000;

  late final PageController _controller = PageController(
    initialPage: widget.banners.length * _loopStart,
  );
  Timer? _timer;

  bool get _canAutoPlay => widget.autoPlay && widget.banners.length > 1;

  @override
  void initState() {
    super.initState();
    _restartTimer();
  }

  @override
  void didUpdateWidget(_PromoCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.banners.length != widget.banners.length ||
        oldWidget.autoPlay != widget.autoPlay) {
      _restartTimer();
    }
  }

  void _restartTimer() {
    _timer?.cancel();
    if (!_canAutoPlay) return;
    _timer = Timer.periodic(_interval, (_) {
      // Skip while hidden (another tab / pushed route) or mid-swipe.
      if (!mounted ||
          !TickerMode.valuesOf(context).enabled ||
          !_controller.hasClients ||
          _controller.position.isScrollingNotifier.value) {
        return;
      }
      unawaited(
        _controller.nextPage(
          duration: AppDurations.slower,
          curve: AppCurves.emphasized,
        ),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final banners = widget.banners;
    return NotificationListener<ScrollNotification>(
      // A manual swipe gets a full interval before the next auto slide.
      onNotification: (n) {
        if (n is ScrollStartNotification && n.dragDetails != null) {
          _restartTimer();
        }
        return false;
      },
      child: PageView.builder(
        controller: _controller,
        itemCount: banners.length > 1 ? null : banners.length,
        itemBuilder: (context, i) {
          final banner = banners[i % banners.length];
          return Padding(
            padding: AppInsets.page,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: PromoBannerCard.cardWidth(context),
                child: PromoBannerCard(
                  banner: banner,
                  onTap: banner.deepLink == null
                      ? null
                      : () => context.push(banner.deepLink!),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Promo banners + category rail.
class _Discovery extends StatelessWidget {
  const _Discovery({
    required this.feed,
    required this.loading,
    required this.showBanners,
  });

  final HomeFeed feed;
  final bool loading;
  final bool showBanners;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final selectedCategory = context.select<HomeCubit, String?>(
      (c) => c.state.filter.categoryId,
    );
    final banners = !showBanners
        ? const <PromoBanner>[]
        : loading
        ? [
            const PromoBanner(
              id: 'loading',
              title: 'Get 10% off your first order!',
              ctaLabel: 'First timers',
              imageUrl: '',
            ),
          ]
        : feed.banners;
    final categories = loading
        ? List.generate(
            6,
            (i) => Category(id: '$i', name: 'Breakfast', imageUrl: ''),
          )
        : feed.categories;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: AppSpacing.sm),
        if (banners.isNotEmpty)
          // 62pt like the design; taller only when a long locale or large
          // accessibility text needs extra title lines.
          SizedBox(
            height: PromoBannerCard.railHeight(context, banners),
            child: _PromoCarousel(banners: banners, autoPlay: !loading),
          ),
        if (banners.isNotEmpty) const SizedBox(height: AppSpacing.xxl + 2),
        SizedBox(
          // 50pt image slot + one 12/18 label line (text-scale aware).
          height: 50 + MediaQuery.textScalerOf(context).scale(18),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 6),
            itemCount: categories.length,
            itemBuilder: (context, i) => CategoryItem(
              category: categories[i],
              selected: categories[i].id == selectedCategory,
              onTap: () => cubit.toggleCategory(categories[i].id),
            ).entranceX(index: i),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }
}

class _RestaurantRail extends StatelessWidget {
  const _RestaurantRail({required this.section});

  final HomeSection section;

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.sizeOf(context).width * 0.78;
    final textScaler = MediaQuery.textScalerOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(
          title: section.title,
          subtitle: section.subtitle,
          titleSuffix: section.titleEmoji == null
              ? null
              : Text(section.titleEmoji!),
          onSeeAll: () => context.push(
            AppRoutes.restaurantListFor(
              section: section.id,
              title: section.title,
            ),
          ),
        ),
        SizedBox(
          // Cover (138 + 14 ETA overhang) + cuisine, name and meta lines;
          // grows with the text scale so the card never clips.
          height:
              160 +
              textScaler.scale(18) * 2 +
              textScaler.scale(20) +
              AppSpacing.xs,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: AppInsets.page,
            itemCount: section.restaurants.length,
            separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.md),
            itemBuilder: (context, i) {
              final restaurant = section.restaurants[i];
              return RestaurantCard(
                restaurant: restaurant,
                width: cardWidth,
                // Same restaurant can appear in several rails.
                enableHero: section.id == 'places_near_you',
                onTap: () => context.push(AppRoutes.restaurant(restaurant.id)),
              ).entranceX(index: i);
            },
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }
}

/// "Featured stores" — three rows of logo tiles scrolling sideways.
class _StoreGrid extends StatelessWidget {
  const _StoreGrid({required this.section});

  final HomeSection section;

  @override
  Widget build(BuildContext context) {
    final stores = section.restaurants;
    // Figma: three rows of logo tiles scrolling sideways.
    const rows = 3;
    final columns = (stores.length / rows).ceil();
    Widget tile(Restaurant r) => StoreTile(
      restaurant: r,
      onTap: () => context.push(AppRoutes.restaurant(r.id)),
    );
    return ColoredBox(
      color: context.colors.surfaceMuted,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeader(title: section.title, subtitle: section.subtitle),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: AppInsets.page,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var c = 0; c < columns; c++)
                  Padding(
                    padding: EdgeInsets.only(
                      right: c == columns - 1 ? 0 : AppSpacing.md,
                    ),
                    child: Column(
                      children: [
                        for (
                          var r = 0;
                          r < rows && c * rows + r < stores.length;
                          r++
                        ) ...[
                          if (r > 0) const SizedBox(height: AppSpacing.sm),
                          tile(stores[c * rows + r]),
                        ],
                      ],
                    ).entranceX(index: c),
                  ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }
}

/// "Change location to.." — search elsewhere or use the device position.
Future<void> showChangeLocationSheet(BuildContext context) {
  final l10n = context.l10n;
  return showAppBottomSheet<void>(
    context: context,
    title: l10n.homeChangeLocationTitle,
    builder: (sheetContext) {
      final colors = sheetContext.colors;
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            contentPadding: AppInsets.page,
            leading: AppIcon(
              Assets.icons.magniferLinear,
              size: AppSizes.iconMd,
              color: colors.brand,
            ),
            minLeadingWidth: 0,
            title: Text(
              l10n.homeSearchElsewhere,
              style: AppTypography.labelLarge.copyWith(color: colors.brand),
            ),
            onTap: () {
              Navigator.pop(sheetContext);
              unawaited(
                context.push(
                  AppRoutes.locationPicker,
                  extra: const LocationPickerArgs(),
                ),
              );
            },
          ),
          const AppDivider(),
          ListTile(
            contentPadding: AppInsets.page,
            // Figma: filled grey pin, Regular 13 grey label.
            leading: AppIcon(
              Assets.icons.mapPointBold,
              size: AppSizes.iconMd,
              color: colors.textTertiary,
            ),
            minLeadingWidth: 0,
            title: Text(
              l10n.homeUseCurrentLocation,
              style: AppTypography.bodyMedium.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: colors.textSecondary,
              ),
            ),
            trailing: const AppRadio(selected: false),
            onTap: () async {
              Navigator.pop(sheetContext);
              final point = await findDeviceLocation(context);
              if (point == null || !context.mounted) return;
              unawaited(
                context.push(
                  AppRoutes.locationPicker,
                  extra: LocationPickerArgs(center: point),
                ),
              );
            },
          ),
          SizedBox(height: MediaQuery.paddingOf(sheetContext).bottom),
        ],
      );
    },
  );
}
