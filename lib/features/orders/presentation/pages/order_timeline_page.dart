import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/core/utils/formatters.dart';
import 'package:tavada_eats/features/cart/domain/entities/cart_item.dart';
import 'package:tavada_eats/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:tavada_eats/features/cart/presentation/cart_actions.dart';
import 'package:tavada_eats/features/catalog/domain/entities/menu.dart';
import 'package:tavada_eats/features/catalog/domain/repositories/catalog_repository.dart';
import 'package:tavada_eats/features/orders/domain/entities/order.dart';
import 'package:tavada_eats/features/orders/presentation/bloc/order_cubit.dart';
import 'package:tavada_eats/features/orders/presentation/widgets/order_widgets.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';
import 'package:uuid/uuid.dart';

/// Completed order: delivery time, milestone timeline, details and
/// "Repeat order".
class OrderTimelinePage extends StatelessWidget {
  const OrderTimelinePage({required this.orderId, super.key});

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = OrderCubit(sl(), orderId);
        unawaited(cubit.load());
        return cubit;
      },
      child: const _TimelineView(),
    );
  }
}

class _TimelineView extends StatelessWidget {
  const _TimelineView();

  /// "Repeat order": re-prices every line from the store's CURRENT menu,
  /// leaves out dishes / options that no longer exist, and asks whether to
  /// replace or add to an existing basket for that store.
  Future<void> _repeat(BuildContext context, Order order) async {
    final l10n = context.l10n;
    final cart = context.read<CartBloc>();
    final router = GoRouter.of(context);
    final menu = await sl<CatalogRepository>().getMenu(order.restaurant.id);
    if (!context.mounted) return;
    final sections = menu.fold<List<MenuSection>?>((failure) {
      AppToast.show(
        context,
        failure.localizedMessage(l10n),
        type: ToastType.error,
      );
      return null;
    }, (sections) => sections);
    if (sections == null) return;
    final items = {
      for (final section in sections)
        for (final item in section.items) item.id: item,
    };

    const uuid = Uuid();
    var unavailable = 0;
    final lines = <CartItem>[];
    for (final line in order.items) {
      final item = items[line.menuItemId];
      if (item == null) {
        unavailable++;
        continue;
      }
      final options = <SelectedOption>[
        for (final o in line.options)
          for (final g in item.optionGroups.where((g) => g.id == o.groupId))
            for (final current in g.options.where((c) => c.id == o.optionId))
              o.copyWith(price: current.price, name: current.name),
      ];
      lines.add(
        cartLineFor(
          item,
          quantity: line.quantity,
          options: options,
          note: line.note,
        ).copyWith(id: uuid.v4()),
      );
    }
    if (lines.isEmpty) {
      AppToast.show(
        context,
        l10n.ordersRepeatUnavailable(unavailable),
        type: ToastType.error,
      );
      return;
    }

    final existing = cart.state.cartFor(order.restaurant.id);
    if (existing != null && existing.items.isNotEmpty) {
      final replace = await showDialog<bool>(
        context: context,
        builder: (dialogContext) => AppDialog(
          title: l10n.ordersRepeatTitle(order.restaurant.name),
          message: l10n.ordersRepeatMessage,
          actions: [
            AppButton(
              label: l10n.ordersRepeatReplace,
              onPressed: () => Navigator.pop(dialogContext, true),
            ),
            AppButton.secondary(
              label: l10n.ordersRepeatAdd,
              onPressed: () => Navigator.pop(dialogContext, false),
            ),
          ],
        ),
      );
      if (replace == null || !context.mounted) return;
      if (replace) cart.add(CartStoreCleared(order.restaurant.id));
    }
    final store = CartStoreInfo(
      id: order.restaurant.id,
      name: order.restaurant.name,
      logoUrl: order.restaurant.logoUrl,
    );
    for (final line in lines) {
      cart.add(CartItemAdded(store: store, item: line));
    }
    AppToast.show(
      context,
      unavailable == 0
          ? l10n.ordersRepeated
          : l10n.ordersRepeatUnavailable(unavailable),
      type: unavailable == 0 ? ToastType.success : ToastType.info,
    );
    unawaited(router.push(AppRoutes.checkout(order.restaurant.id)));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        final order = state.order;
        return AppScaffold(
          appBar: AppTopBar(
            actions: [
              if (order != null)
                AppButton.tonal(
                  label: l10n.ordersRepeat,
                  trailing: AppIcon(
                    Assets.icons.repeatLinear,
                    size: AppSizes.iconSm,
                    color: colors.brand,
                  ),
                  onPressed: () => unawaited(_repeat(context, order)),
                ),
              const SizedBox(width: AppSpacing.gutter),
            ],
          ),
          body: order == null
              ? (state.status.isFailure
                    ? ErrorStateView(
                        failure: state.failure,
                        onRetry: context.read<OrderCubit>().load,
                      )
                    : const Center(child: CircularProgressIndicator()))
              : ListView(
                  padding: EdgeInsets.only(
                    bottom:
                        MediaQuery.paddingOf(context).bottom + AppSpacing.xxl,
                  ),
                  children: [
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      order.deliveredAt == null
                          ? l10n.ordersEstimatedDelivery
                          : l10n.ordersTimeOfDelivery,
                      textAlign: TextAlign.center,
                      style: AppTypography.bodyMedium.copyWith(
                        color: colors.textSecondary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      Formatters.time(
                        (order.deliveredAt ?? order.estimatedArrival).toLocal(),
                        locale: l10n.localeName,
                      ),
                      textAlign: TextAlign.center,
                      style: AppTypography.displayMedium,
                    ).popIn(),
                    const SizedBox(height: AppSpacing.xxl),
                    Padding(
                      padding: AppInsets.page,
                      child: _Timeline(order: order),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    const SectionGap(),
                    OrderSectionTitle(l10n.ordersDeliveryInfo),
                    OrderDeliveryInfo(order: order),
                    const SectionGap(),
                    OrderSectionTitle(l10n.ordersSummary),
                    OrderSummary(order: order),
                  ],
                ),
        );
      },
    );
  }
}

class _Timeline extends StatelessWidget {
  const _Timeline({required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final entries = order.timeline;
    String text(OrderMilestone m) => switch (m) {
      OrderMilestone.confirmed => l10n.ordersMilestoneConfirmed(
        order.restaurant.name,
      ),
      OrderMilestone.riderAssigned => l10n.ordersMilestoneRiderAssigned,
      OrderMilestone.readyForPickup => l10n.ordersMilestoneReady,
      OrderMilestone.pickedUp => l10n.ordersMilestonePickedUp,
      OrderMilestone.arrived => l10n.ordersMilestoneArrived,
    };
    return Column(
      children: [
        for (var i = 0; i < entries.length; i++)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 64,
                  child: Text(
                    Formatters.time(
                      entries[i].at.toLocal(),
                      locale: l10n.localeName,
                    ),
                    style: AppTypography.bodySmall.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                ),
                Column(
                  children: [
                    AppIcon(
                      Assets.icons.checkCircleBold,
                      size: AppSizes.iconMd,
                      color: colors.success,
                    ),
                    if (i < entries.length - 1)
                      Expanded(
                        child: Container(
                          width: 2,
                          margin: const EdgeInsets.symmetric(vertical: 2),
                          color: colors.success,
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.xl),
                    child: Text(
                      text(entries[i].milestone),
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ).entrance(index: i),
      ],
    );
  }
}
