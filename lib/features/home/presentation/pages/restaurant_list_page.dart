import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant_filter.dart';
import 'package:tavada_eats/features/catalog/domain/repositories/catalog_repository.dart';
import 'package:tavada_eats/features/catalog/presentation/widgets/restaurant_card.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// "See all" list for a home rail ("Places near you", "Special discounts"…).
class RestaurantListPage extends StatefulWidget {
  const RestaurantListPage({required this.section, this.title, super.key});

  final String section;
  final String? title;

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  ViewStatus _status = ViewStatus.loading;
  List<Restaurant> _restaurants = const [];
  Failure? _failure;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    setState(() => _status = ViewStatus.loading);
    final result = await sl<CatalogRepository>().getRestaurants(
      filter: RestaurantFilter(section: widget.section),
    );
    if (!mounted) return;
    setState(() {
      result.fold(
        (f) {
          _status = ViewStatus.failure;
          _failure = f;
        },
        (list) {
          _status = ViewStatus.success;
          _restaurants = list;
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final loading = _status.isBusy;
    final items = loading
        ? List.generate(3, RestaurantCard.placeholderRestaurant)
        : _restaurants;
    return AppScaffold(
      appBar: AppTopBar(
        title: widget.title ?? l10n.navHome,
        alwaysShowDivider: true,
      ),
      body: AsyncView(
        status: _status,
        failure: _failure,
        onRetry: _load,
        isEmpty: _restaurants.isEmpty,
        empty: EmptyState(
          title: l10n.homeListEmptyTitle,
          message: l10n.homeListEmptyMessage,
          image: Assets.images.categories.lunch.path,
        ),
        loading: _list(context, items, loading: true),
        builder: (_) => _list(context, items, loading: false),
      ),
    );
  }

  Widget _list(
    BuildContext context,
    List<Restaurant> items, {
    required bool loading,
  }) {
    return AppSkeleton(
      enabled: loading,
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(
          AppSpacing.gutter,
          0,
          AppSpacing.gutter,
          MediaQuery.paddingOf(context).bottom + AppSpacing.xl,
        ),
        itemCount: items.length + 1,
        separatorBuilder: (_, i) =>
            SizedBox(height: i == 0 ? 0 : AppSpacing.xl),
        itemBuilder: (context, i) {
          if (i == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
              child: Text(
                context.l10n.commonResults(items.length),
                style: AppTypography.labelLarge,
              ),
            );
          }
          final restaurant = items[i - 1];
          return RestaurantCard(
            restaurant: restaurant,
            showCuisine: false,
            showDeliveryFee: false,
            enableHero: !loading,
            onTap: () => context.push(AppRoutes.restaurant(restaurant.id)),
          ).entrance(index: i);
        },
      ),
    );
  }
}
