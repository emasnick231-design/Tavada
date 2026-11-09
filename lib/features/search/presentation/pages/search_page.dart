import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:tavada_eats/features/cart/presentation/cart_actions.dart';
import 'package:tavada_eats/features/catalog/domain/entities/discovery.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant_filter.dart';
import 'package:tavada_eats/features/catalog/presentation/widgets/discovery_widgets.dart';
import 'package:tavada_eats/features/catalog/presentation/widgets/dish_widgets.dart';
import 'package:tavada_eats/features/home/presentation/widgets/home_filters.dart';
import 'package:tavada_eats/features/search/presentation/bloc/search_cubit.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Dish & restaurant search: recent searches + discovery, live suggestions,
/// then grouped results (restaurant + matching dishes).
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = SearchCubit(sl(), sl());
        unawaited(cubit.loadDiscovery());
        return cubit;
      },
      child: const _SearchView(),
    );
  }
}

class _SearchView extends StatefulWidget {
  const _SearchView();

  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
  final _controller = TextEditingController();
  final _focus = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _submit(String query, {RestaurantFilter? filter}) {
    _controller.value = TextEditingValue(
      text: query,
      selection: TextSelection.collapsed(offset: query.length),
    );
    _focus.unfocus();
    unawaited(context.read<SearchCubit>().submit(query, filter: filter));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<SearchCubit>();
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
                controller: _controller,
                focusNode: _focus,
                hint: l10n.searchHint,
                autofocus: true,
                onChanged: cubit.queryChanged,
                onSubmitted: _submit,
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
            Divider(height: 1, color: context.colors.divider),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) => AnimatedSwitcher(
                  duration: AppDurations.fast,
                  child: switch (state.phase) {
                    SearchPhase.idle => _IdleView(
                      key: const ValueKey('idle'),
                      state: state,
                      onSubmit: _submit,
                    ),
                    SearchPhase.typing => _Suggestions(
                      key: const ValueKey('typing'),
                      state: state,
                      onSubmit: _submit,
                    ),
                    SearchPhase.results => _Results(
                      key: const ValueKey('results'),
                      state: state,
                    ),
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Figma search section titles: SemiBold 18.
final TextStyle _sectionTitle = AppTypography.headlineSmall.copyWith(
  fontWeight: FontWeight.w600,
);

class _IdleView extends StatelessWidget {
  const _IdleView({
    required this.state,
    required this.onSubmit,
    super.key,
  });

  final SearchState state;
  final void Function(String query, {RestaurantFilter? filter}) onSubmit;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final width = MediaQuery.sizeOf(context).width;
    final cuisineWidth = (width - AppSpacing.gutter * 2 - AppSpacing.md) / 2;
    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.only(
        bottom: MediaQuery.paddingOf(context).bottom + AppSpacing.xl,
      ),
      children: [
        if (state.recent.isNotEmpty) ...[
          SectionHeader(
            title: l10n.searchRecent,
            trailing: AppButton.neutral(
              label: l10n.commonClearAll,
              size: AppButtonSize.xs,
              onPressed: context.read<SearchCubit>().clearRecent,
            ),
          ),
          Padding(
            padding: AppInsets.page,
            child: Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                for (final q in state.recent)
                  AppTag(label: q, onTap: () => onSubmit(q)),
              ],
            ),
          ),
        ],
        if (state.categories.isNotEmpty) ...[
          SectionHeader(
            title: l10n.searchCategories,
            titleStyle: _sectionTitle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
            child: GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              // Figma: 104pt row pitch.
              childAspectRatio: 0.86,
              children: [
                for (var i = 0; i < state.categories.length; i++)
                  CategoryItem(
                    category: state.categories[i],
                    onTap: () => onSubmit(
                      state.categories[i].name,
                      filter: RestaurantFilter(
                        categoryId: state.categories[i].id,
                      ),
                    ),
                  ).entrance(index: i),
              ],
            ),
          ),
        ],
        if (state.options.cuisines.isNotEmpty) ...[
          SectionHeader(
            title: l10n.searchTrendyCuisines,
            titleStyle: _sectionTitle,
          ),
          Padding(
            padding: AppInsets.page,
            child: Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.lg,
              children: [
                for (var i = 0; i < state.options.cuisines.length; i++)
                  SizedBox(
                    width: cuisineWidth,
                    child: CuisineCard(
                      cuisine: state.options.cuisines[i],
                      onTap: () => onSubmit(
                        state.options.cuisines[i].name,
                        filter: RestaurantFilter(
                          cuisineIds: {state.options.cuisines[i].id},
                        ),
                      ),
                    ),
                  ).entrance(index: i),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _Suggestions extends StatelessWidget {
  const _Suggestions({
    required this.state,
    required this.onSubmit,
    super.key,
  });

  final SearchState state;
  final void Function(String query, {RestaurantFilter? filter}) onSubmit;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final q = state.query.toLowerCase();
    final recent = state.recent
        .where((r) => r.toLowerCase().contains(q))
        .take(3)
        .toList();
    final suggestions = state.suggestions
        .where((s) => !recent.contains(s))
        .take(6)
        .toList();
    final rows = <(SvgGenImage, String, String)>[
      for (final r in recent) (Assets.icons.historyLinear, r, r),
      for (final s in suggestions) (Assets.icons.magniferLinear, s, s),
      (
        Assets.icons.magniferLinear,
        context.l10n.searchFor(state.query),
        state.query,
      ),
    ];
    return ListView.separated(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      // Figma: inset rows, text at x=72, dividers 72…348.
      padding: const EdgeInsets.only(left: 26, right: 27),
      itemCount: rows.length,
      separatorBuilder: (_, _) =>
          Divider(height: 1, indent: 46, color: colors.divider),
      itemBuilder: (context, i) {
        final (icon, label, query) = rows[i];
        return InkWell(
          onTap: () => onSubmit(query),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
            child: Row(
              children: [
                AppIcon(
                  icon,
                  size: AppSizes.iconMd,
                  color: colors.textTertiary,
                ),
                const SizedBox(width: 26),
                Expanded(
                  child: _Highlighted(text: label, query: state.query),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Suggestion text with the typed part dimmed, like iOS search.
class _Highlighted extends StatelessWidget {
  const _Highlighted({required this.text, required this.query});

  final String text;
  final String query;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final base = AppTypography.bodyMedium.copyWith(
      color: colors.textPrimary,
      fontWeight: FontWeight.w400,
    );
    final start = text.toLowerCase().indexOf(query.toLowerCase());
    if (start < 0 || query.isEmpty) return Text(text, style: base);
    final end = start + query.length;
    return Text.rich(
      TextSpan(
        style: base,
        children: [
          TextSpan(text: text.substring(0, start)),
          TextSpan(
            text: text.substring(start, end),
            style: base.copyWith(color: colors.textTertiary),
          ),
          TextSpan(text: text.substring(end)),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _Results extends StatelessWidget {
  const _Results({required this.state, super.key});

  final SearchState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final cubit = context.read<SearchCubit>();
    final f = state.filter;
    final cuisines = state.options.cuisines;
    final selectedCuisine = f.cuisineIds.length == 1
        ? cuisines.indexWhere((c) => c.id == f.cuisineIds.first) + 1
        : 0;

    final filters = <Widget>[
      AppFilterChip(
        label: l10n.homeFilterDiscounts,
        icon: Assets.icons.saleLinear,
        selected: f.discountsOnly,
        onTap: () =>
            cubit.setFilter(f.copyWith(discountsOnly: !f.discountsOnly)),
      ),
      AppFilterChip(
        label: l10n.homeFilterTopRated,
        icon: Assets.icons.medalStarLinear,
        selected: f.topRated,
        onTap: () => cubit.setFilter(f.copyWith(topRated: !f.topRated)),
      ),
      AppFilterChip(
        label: l10n.homeFilterUnder30,
        icon: Assets.icons.stopwatchLinear,
        selected: f.under30Minutes,
        onTap: () =>
            cubit.setFilter(f.copyWith(under30Minutes: !f.under30Minutes)),
      ),
      AppFilterChip(
        label: l10n.homeFilterDeliveryFee,
        icon: Assets.icons.bicyclingLinear,
        selected: f.maxDeliveryFee != null,
        showDropdown: true,
        onTap: () async {
          final fee = await showDeliveryFeeSheet(
            context,
            max: state.options.maxDeliveryFee,
            initial: f.maxDeliveryFee,
          );
          if (fee == null) return;
          cubit.setFilter(
            cubit.state.filter.copyWith(maxDeliveryFee: fee.isNaN ? null : fee),
          );
        },
      ),
    ];

    final hits = state.results?.hits ?? const <RestaurantSearchHit>[];
    final loading = state.status.isBusy;

    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: [
        if (cuisines.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: AppSpacing.md),
              child: AppTabChips(
                labels: [
                  l10n.searchAllAfrica,
                  for (final c in cuisines) c.name,
                ],
                selectedIndex: selectedCuisine,
                onSelected: (i) => cubit.setFilter(
                  f.copyWith(
                    cuisineIds: i == 0 ? const {} : {cuisines[i - 1].id},
                  ),
                ),
              ),
            ),
          ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(top: AppSpacing.md),
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(color: colors.divider),
              ),
            ),
            child: SizedBox(
              height: 32,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: AppInsets.page,
                itemCount: filters.length,
                separatorBuilder: (_, _) =>
                    const SizedBox(width: AppSpacing.sm),
                itemBuilder: (_, i) => filters[i],
              ),
            ),
          ),
        ),
        if (state.status.isFailure)
          SliverFillRemaining(
            hasScrollBody: false,
            child: ErrorStateView(failure: state.failure, onRetry: cubit.retry),
          )
        else if (!loading && hits.isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: EmptyState(
              title: l10n.searchNoResultsTitle(state.query),
              message: l10n.searchNoResultsMessage,
              image: Assets.images.categories.soupStews.path,
            ),
          )
        else
          AppSliverSkeleton(
            enabled: loading,
            child: SliverList.separated(
              itemCount: loading ? 2 : hits.length,
              separatorBuilder: (_, _) =>
                  Divider(height: 1, color: colors.divider),
              itemBuilder: (context, i) => loading
                  ? const _HitPlaceholder()
                  : _HitTile(hit: hits[i]).entrance(index: i),
            ),
          ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.paddingOf(context).bottom + AppSpacing.xl,
          ),
        ),
      ],
    );
  }
}

/// Restaurant header + a rail of its matching dishes.
class _HitTile extends StatelessWidget {
  const _HitTile({required this.hit});

  final RestaurantSearchHit hit;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final r = hit.restaurant;
    final cart = context.watch<CartBloc>().state;
    final meta = AppTypography.bodySmall.copyWith(color: colors.textSecondary);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PressableScale(
            onTap: () => context.push(AppRoutes.restaurant(r.id)),
            child: Padding(
              padding: AppInsets.page,
              child: Row(
                children: [
                  AppAvatar(imageUrl: r.logoUrl, size: 48),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(r.name, style: AppTypography.labelMedium),
                        const SizedBox(height: AppSpacing.xxs),
                        Row(
                          children: [
                            RatingLabel(
                              rating: r.rating,
                              count: r.ratingCount,
                              showTier: false,
                            ),
                            Text(
                              ' · ${l10n.commonMinutes(r.etaMinutes)}',
                              style: meta,
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.xxs),
                        Text(
                          r.deliveryFee.isZero
                              ? l10n.searchFreeDelivery
                              : l10n.searchDeliveryFee(
                                  r.deliveryFee.formatCompact(),
                                ),
                          style: meta,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (hit.dishes.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.lg),
            SizedBox(
              height: 168,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: AppInsets.page,
                itemCount: hit.dishes.length,
                separatorBuilder: (_, _) =>
                    const SizedBox(width: AppSpacing.md),
                itemBuilder: (context, i) {
                  final dish = hit.dishes[i];
                  return DishCard(
                    item: dish,
                    quantity: cart.quantityOf(r.id, dish.id),
                    onTap: () =>
                        context.push(AppRoutes.menuItem(r.id, dish.id)),
                    onAdd: () => quickAddToCart(
                      context,
                      item: dish,
                      store: r.cartStore,
                      restaurant: r,
                    ),
                  ).entranceX(index: i);
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _HitPlaceholder extends StatelessWidget {
  const _HitPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.gutter),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              SkeletonBox.circle(size: 48),
              SizedBox(width: AppSpacing.md),
              Expanded(child: SkeletonBox(height: 40)),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          // Clipped rail: three boxes are wider than a phone (no overflow).
          SizedBox(
            height: 112,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.md),
              itemBuilder: (_, _) => const SkeletonBox(width: 112, height: 112),
            ),
          ),
        ],
      ),
    );
  }
}
