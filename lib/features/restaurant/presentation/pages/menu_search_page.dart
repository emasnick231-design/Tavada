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
import 'package:tavada_eats/features/catalog/domain/entities/menu.dart';
import 'package:tavada_eats/features/catalog/presentation/widgets/dish_widgets.dart';
import 'package:tavada_eats/features/restaurant/presentation/bloc/restaurant_cubit.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Searches one restaurant's menu (filtered locally).
class MenuSearchPage extends StatelessWidget {
  const MenuSearchPage({required this.restaurantId, super.key});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = RestaurantCubit(sl(), restaurantId);
        unawaited(cubit.load());
        return cubit;
      },
      child: const _MenuSearchView(),
    );
  }
}

class _MenuSearchView extends StatefulWidget {
  const _MenuSearchView();

  @override
  State<_MenuSearchView> createState() => _MenuSearchViewState();
}

class _MenuSearchViewState extends State<_MenuSearchView> {
  String _query = '';

  List<MenuSection> _filter(List<MenuSection> menu) {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return const [];
    bool matches(MenuItem i) =>
        i.name.toLowerCase().contains(q) ||
        i.description.toLowerCase().contains(q) ||
        i.tags.any((t) => t.toLowerCase().contains(q));
    return [
      for (final s in menu)
        if (s.items.any(matches))
          s.copyWith(items: s.items.where(matches).toList()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
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
                hint: l10n.restaurantSearchMenuHint,
                autofocus: true,
                onChanged: (v) => setState(() => _query = v),
                onClear: () => setState(() => _query = ''),
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
              child: BlocBuilder<RestaurantCubit, RestaurantState>(
                builder: (context, state) {
                  final restaurant = state.restaurant;
                  if (_query.trim().isEmpty || restaurant == null) {
                    // Figma: yellow soup bowl in the upper third.
                    return EmptyState(
                      title: l10n.restaurantSearchMenu,
                      message: l10n.restaurantSearchMenuMessage,
                      alignment: const Alignment(0, -0.62),
                      illustration: Assets.images.illustrations.soupBowl.svg(
                        width: 64,
                        height: 64,
                      ),
                    );
                  }
                  final sections = _filter(state.menu);
                  if (sections.isEmpty) {
                    return EmptyState(
                      title: l10n.restaurantNoDishesTitle,
                      message: l10n.restaurantNoDishesMessage,
                      image: Assets.images.categories.soupStews.path,
                    );
                  }
                  final cart = context.watch<CartBloc>().state;
                  // Figma: white results over a Gray/50 page.
                  return ColoredBox(
                    color: colors.surfaceMuted,
                    child: ListView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      padding: EdgeInsets.only(
                        bottom:
                            MediaQuery.paddingOf(context).bottom +
                            AppSpacing.xl,
                      ),
                      children: [
                        ColoredBox(
                          color: colors.surface,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              for (var s = 0; s < sections.length; s++) ...[
                                if (s > 0) const SectionGap(),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    AppSpacing.gutter,
                                    AppSpacing.xxl,
                                    AppSpacing.gutter,
                                    AppSpacing.sm,
                                  ),
                                  child: Text(
                                    sections[s].name,
                                    style: AppTypography.headlineSmall.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                for (final item in sections[s].items)
                                  MenuItemTile(
                                    item: item,
                                    quantity: cart.quantityOf(
                                      restaurant.id,
                                      item.id,
                                    ),
                                    onTap: () => context.push(
                                      AppRoutes.menuItem(
                                        restaurant.id,
                                        item.id,
                                      ),
                                    ),
                                    onAdd: () => quickAddToCart(
                                      context,
                                      item: item,
                                      store: restaurant.cartStore,
                                      restaurant: restaurant,
                                    ),
                                  ).entrance(),
                              ],
                            ],
                          ),
                        ),
                      ],
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
