import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/core/utils/formatters.dart';
import 'package:tavada_eats/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:tavada_eats/features/cart/presentation/cart_actions.dart';
import 'package:tavada_eats/features/catalog/domain/entities/menu.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant.dart';
import 'package:tavada_eats/features/catalog/presentation/widgets/dish_widgets.dart';
import 'package:tavada_eats/features/catalog/presentation/widgets/restaurant_card.dart';
import 'package:tavada_eats/features/restaurant/presentation/bloc/restaurant_cubit.dart';
import 'package:tavada_eats/features/restaurant/presentation/widgets/restaurant_widgets.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Figma: cover 0–166pt (incl. status bar), 75pt logo at y 130–205.
const _coverHeight = 158.0;
const _logoSize = 75.0;
const _logoOverlap = 39.0;
const _tabBarHeight = 56.0;

/// Restaurant: cover, details, offers, AI summary, popular orders and the
/// full menu with a sticky section bar.
class RestaurantPage extends StatelessWidget {
  const RestaurantPage({required this.restaurantId, super.key});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = RestaurantCubit(sl(), restaurantId);
        unawaited(cubit.load());
        return cubit;
      },
      child: const _RestaurantView(),
    );
  }
}

class _RestaurantView extends StatefulWidget {
  const _RestaurantView();

  @override
  State<_RestaurantView> createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<_RestaurantView> {
  final _scroll = ScrollController();
  final ValueNotifier<bool> _collapsed = ValueNotifier(false);
  final ValueNotifier<int> _activeSection = ValueNotifier(0);
  final _sectionKeys = <String, GlobalKey>{};
  bool _jumping = false;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scroll.dispose();
    _collapsed.dispose();
    _activeSection.dispose();
    super.dispose();
  }

  double get _pinnedTop =>
      MediaQuery.paddingOf(context).top + kToolbarHeight + _tabBarHeight;

  void _onScroll() {
    _collapsed.value = _scroll.offset > _coverHeight - kToolbarHeight - 40;
    if (_jumping) return;
    final menu = context.read<RestaurantCubit>().state.menu;
    var active = 0;
    for (var i = 0; i < menu.length; i++) {
      final box =
          _sectionKeys[menu[i].id]?.currentContext?.findRenderObject()
              as RenderBox?;
      if (box == null || !box.attached) continue;
      if (box.localToGlobal(Offset.zero).dy <= _pinnedTop + 8) active = i;
    }
    _activeSection.value = active;
  }

  Future<void> _jumpTo(int index) async {
    final menu = context.read<RestaurantCubit>().state.menu;
    final key = _sectionKeys[menu[index].id];
    final target = key?.currentContext;
    _activeSection.value = index;
    if (target == null) return;
    _jumping = true;
    final box = target.findRenderObject()! as RenderBox;
    final delta = box.localToGlobal(Offset.zero).dy - _pinnedTop;
    await _scroll.animateTo(
      (_scroll.offset + delta).clamp(0, _scroll.position.maxScrollExtent),
      duration: AppDurations.slow,
      curve: AppCurves.emphasized,
    );
    _jumping = false;
  }

  Future<void> _openMenuSheet(List<MenuSection> menu) async {
    final picked = await showSelectionSheet<int>(
      context: context,
      title: context.l10n.restaurantMenu,
      multiSelect: false,
      showControls: false,
      selected: {_activeSection.value},
      options: [
        for (var i = 0; i < menu.length; i++)
          SelectionOption(value: i, label: menu[i].name),
      ],
    );
    if (picked != null && picked.isNotEmpty) await _jumpTo(picked.first);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantCubit, RestaurantState>(
      builder: (context, state) {
        final restaurant = state.restaurant;
        if (state.status.isFailure ||
            (restaurant == null && !state.status.isBusy)) {
          return AppScaffold(
            appBar: const AppTopBar(),
            body: ErrorStateView(
              failure: state.failure,
              onRetry: context.read<RestaurantCubit>().load,
            ),
          );
        }
        final loading = restaurant == null;
        final r = restaurant ?? RestaurantCard.placeholderRestaurant();
        for (final s in state.menu) {
          _sectionKeys.putIfAbsent(s.id, GlobalKey.new);
        }
        return AppScaffold(
          bottomBar: loading ? null : _BasketBar(restaurant: r),
          body: AppSkeleton(
            enabled: loading,
            child: CustomScrollView(
              controller: _scroll,
              slivers: [
                _CoverAppBar(
                  restaurant: r,
                  collapsed: _collapsed,
                  enableHero: !loading,
                ),
                SliverToBoxAdapter(child: _Header(restaurant: r)),
                if (r.offers.isNotEmpty)
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 84,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: AppInsets.page,
                        itemCount: r.offers.length,
                        separatorBuilder: (_, _) =>
                            const SizedBox(width: AppSpacing.md),
                        itemBuilder: (_, i) => RestaurantOfferCard(
                          offer: r.offers[i],
                        ).entranceX(index: i),
                      ),
                    ),
                  ),
                if (r.aiSummary != null)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        AppSpacing.gutter,
                        AppSpacing.xxl,
                        AppSpacing.gutter,
                        0,
                      ),
                      child: AiSummaryCard(
                        summary: r.aiSummary!,
                        maxLines: 3,
                        onTap: () =>
                            context.push(AppRoutes.restaurantReviews(r.id)),
                      ),
                    ),
                  ),
                if (state.popular.isNotEmpty)
                  SliverToBoxAdapter(
                    child: _PopularOrders(restaurant: r, items: state.popular),
                  ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: AppSpacing.lg),
                ),
                if (state.menu.isNotEmpty) ...[
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _MenuTabsDelegate(
                      sections: state.menu,
                      active: _activeSection,
                      onSelected: _jumpTo,
                      onMenu: () => _openMenuSheet(state.menu),
                    ),
                  ),
                  for (final section in state.menu)
                    SliverToBoxAdapter(
                      child: _MenuSectionView(
                        key: _sectionKeys[section.id],
                        restaurant: r,
                        section: section,
                      ),
                    ),
                ],
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.paddingOf(context).bottom + 120,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CoverAppBar extends StatelessWidget {
  const _CoverAppBar({
    required this.restaurant,
    required this.collapsed,
    required this.enableHero,
  });

  final Restaurant restaurant;
  final ValueNotifier<bool> collapsed;
  final bool enableHero;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    final r = restaurant;
    Widget circle(Widget child) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
      child: child,
    );
    return ValueListenableBuilder<bool>(
      valueListenable: collapsed,
      builder: (context, isCollapsed, _) {
        final variant = isCollapsed
            ? AppIconButtonVariant.outlined
            : AppIconButtonVariant.elevated;
        return SliverAppBar(
          pinned: true,
          expandedHeight: _coverHeight,
          backgroundColor: colors.surface,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          centerTitle: true,
          leadingWidth: 64,
          leading: Center(child: AppBackButton(variant: variant)),
          title: AnimatedOpacity(
            opacity: isCollapsed ? 1 : 0,
            duration: AppDurations.fast,
            child: Text(
              r.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.labelLarge,
            ),
          ),
          actions: [
            circle(
              AppIconButton(
                icon: Assets.icons.magniferLinear,
                variant: variant,
                tooltip: l10n.restaurantSearchMenu,
                onPressed: () =>
                    context.push(AppRoutes.restaurantMenuSearch(r.id)),
              ),
            ),
            if (!isCollapsed)
              circle(
                AppIconButton(
                  icon: Assets.icons.shareLinear,
                  variant: variant,
                  onPressed: () => SharePlus.instance.share(
                    ShareParams(
                      text:
                          '${l10n.restaurantShareText(r.name)}\n'
                          'tavada:///restaurant/${r.id}',
                    ),
                  ),
                ),
              ),
            const SizedBox(width: AppSpacing.md),
          ],
          bottom: isCollapsed
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(1),
                  child: Divider(height: 1, color: colors.divider),
                )
              : null,
          flexibleSpace: FlexibleSpaceBar(
            // Cover + a white strip the logo overlaps (it has to live in
            // the app bar: pinned headers paint above the content).
            background: Stack(
              children: [
                Positioned.fill(
                  bottom: _logoOverlap,
                  child: AppImage(
                    r.coverUrl,
                    heroTag: enableHero ? r.coverHeroTag : null,
                  ),
                ),
                Positioned(
                  left: AppSpacing.gutter,
                  bottom: 0,
                  child: Hero(
                    tag: r.logoHeroTag,
                    child: AppAvatar(
                      imageUrl: r.logoUrl,
                      size: _logoSize,
                      borderColor: colors.surface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final r = restaurant;
    final secondary = AppTypography.caption.copyWith(
      color: colors.textSecondary,
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.gutter,
        0,
        AppSpacing.gutter,
        AppSpacing.xxl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            r.name,
                            style: AppTypography.headlineSmall.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(r.tags.join(' · '), style: secondary),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    _RatingBadge(restaurant: r),
                  ],
                ),
                const SizedBox(height: AppSpacing.xs),
                Row(
                  children: [
                    AppIcon(
                      Assets.icons.mapPointLinear,
                      size: AppSizes.iconSm,
                      color: colors.textSecondary,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Flexible(
                      child: Text(
                        '${r.shortAddress} · '
                        '${l10n.commonMiles(Formatters.distance(r.distanceMiles))} · ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: secondary,
                      ),
                    ),
                    AppLinkButton(
                      label: l10n.commonMoreInfo,
                      underline: true,
                      color: colors.brand,
                      style: AppTypography.labelMedium,
                      onPressed: () => showRestaurantInfoSheet(context, r),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                RestaurantStats(restaurant: r),
                if (!r.isOpen) ...[
                  const SizedBox(height: AppSpacing.md),
                  InfoBanner(
                    message: r.opensAt == null
                        ? l10n.restaurantClosedBanner
                        : l10n.restaurantClosedBannerAt(r.opensAt!),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RatingBadge extends StatelessWidget {
  const _RatingBadge({required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final r = restaurant;
    final reviews = r.reviewCount;
    // Figma: ~103×52 two-row box; the "27 comments >" half is Primary/50.
    return PressableScale(
      onTap: () => context.push(AppRoutes.restaurantReviews(r.id)),
      child: Container(
        constraints: const BoxConstraints(minWidth: 103),
        decoration: BoxDecoration(
          borderRadius: AppRadii.lgAll,
          border: Border.all(color: colors.border),
        ),
        clipBehavior: Clip.antiAlias,
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppIcon(
                      Assets.icons.starBold,
                      size: AppSizes.iconXs,
                      color: colors.brand,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      r.rating.toStringAsFixed(1),
                      style: AppTypography.labelMedium.copyWith(
                        color: colors.brand,
                      ),
                    ),
                    Text(
                      ' (${r.ratingCount})',
                      style: AppTypography.caption.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              ColoredBox(
                color: colors.brandSubtle,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xs,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.l10n.restaurantComments(reviews),
                        style: AppTypography.labelMedium.copyWith(
                          color: colors.brand,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(width: 2),
                      AppIcon(
                        Assets.icons.altArrowRightLinear,
                        size: AppSizes.iconXs,
                        color: colors.brand,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PopularOrders extends StatelessWidget {
  const _PopularOrders({required this.restaurant, required this.items});

  final Restaurant restaurant;
  final List<MenuItem> items;

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartBloc>().state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(
          title: context.l10n.restaurantPopularOrders,
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.gutter,
            AppSpacing.xxl,
            AppSpacing.gutter,
            AppSpacing.md,
          ),
        ),
        SizedBox(
          height: 168,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: AppInsets.page,
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.md),
            itemBuilder: (context, i) {
              final item = items[i];
              return DishCard(
                item: item,
                enableHero: false,
                quantity: cart.quantityOf(restaurant.id, item.id),
                onTap: () =>
                    context.push(AppRoutes.menuItem(restaurant.id, item.id)),
                onAdd: () => quickAddToCart(
                  context,
                  item: item,
                  store: restaurant.cartStore,
                  restaurant: restaurant,
                ),
              ).entranceX(index: i);
            },
          ),
        ),
      ],
    );
  }
}

class _MenuSectionView extends StatelessWidget {
  const _MenuSectionView({
    required this.restaurant,
    required this.section,
    super.key,
  });

  final Restaurant restaurant;
  final MenuSection section;

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartBloc>().state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SectionGap(),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.gutter,
            AppSpacing.xxl,
            AppSpacing.gutter,
            AppSpacing.sm,
          ),
          child: Text(
            section.name,
            style: AppTypography.headlineSmall.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        for (var i = 0; i < section.items.length; i++) ...[
          MenuItemTile(
            item: section.items[i],
            quantity: cart.quantityOf(restaurant.id, section.items[i].id),
            onTap: () => context.push(
              AppRoutes.menuItem(restaurant.id, section.items[i].id),
            ),
            onAdd: () => quickAddToCart(
              context,
              item: section.items[i],
              store: restaurant.cartStore,
              restaurant: restaurant,
            ),
          ),
        ],
      ],
    );
  }
}

class _MenuTabsDelegate extends SliverPersistentHeaderDelegate {
  _MenuTabsDelegate({
    required this.sections,
    required this.active,
    required this.onSelected,
    required this.onMenu,
  });

  final List<MenuSection> sections;
  final ValueNotifier<int> active;
  final ValueChanged<int> onSelected;
  final VoidCallback onMenu;

  @override
  double get minExtent => _tabBarHeight;

  @override
  double get maxExtent => _tabBarHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlaps) {
    final colors = context.colors;
    return Container(
      // Must fill the extent exactly: a shorter child makes the pinned
      // header's geometry invalid and blanks every sliver after it.
      height: _tabBarHeight,
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(bottom: BorderSide(color: colors.divider)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onMenu,
            tooltip: context.l10n.restaurantMenu,
            icon: AppIcon(Assets.icons.listDownLinear, size: AppSizes.iconMd),
          ),
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: active,
              builder: (_, index, _) => AppTabChips(
                labels: [for (final s in sections) s.name],
                selectedIndex: index,
                onSelected: onSelected,
                padding: const EdgeInsets.only(right: AppSpacing.gutter),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_MenuTabsDelegate oldDelegate) =>
      oldDelegate.sections != sections;
}

/// "View basket · 3 items · £24.50" when this restaurant has a basket.
class _BasketBar extends StatelessWidget {
  const _BasketBar({required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cart = context.select<CartBloc, ({int count, String total})?>((b) {
      final c = b.state.cartFor(restaurant.id);
      if (c == null || c.isEmpty) return null;
      return (count: c.itemCount, total: c.subtotal.format());
    });
    return AnimatedSwitcher(
      duration: AppDurations.normal,
      transitionBuilder: (child, animation) => SizeTransition(
        sizeFactor: animation,
        alignment: Alignment.topCenter,
        child: child,
      ),
      child: cart == null
          ? const SizedBox(width: double.infinity)
          : StickyBottomBar(
              child: AppButton(
                label:
                    '${l10n.cartViewBasket} · ${l10n.commonItems(cart.count)}',
                trailingLabel: cart.total,
                onPressed: () =>
                    context.push(AppRoutes.checkout(restaurant.id)),
              ),
            ),
    );
  }
}
