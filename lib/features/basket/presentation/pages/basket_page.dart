import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/session/session_cubit.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/core/utils/formatters.dart';
import 'package:tavada_eats/features/cart/domain/entities/cart_item.dart';
import 'package:tavada_eats/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:tavada_eats/features/orders/domain/entities/order.dart';
import 'package:tavada_eats/features/orders/domain/entities/place_order_request.dart';
import 'package:tavada_eats/features/orders/domain/repositories/orders_repository.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Basket tab: open baskets per store, ongoing and completed orders.
class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  int _tab = 0;

  Future<void> _clearAll() async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AppDialog(
        title: l10n.basketClearAllTitle,
        message: l10n.basketClearAllMessage,
        actions: [
          AppButton(
            label: l10n.basketClearAllConfirm,
            onPressed: () => Navigator.pop(dialogContext, true),
          ),
          AppButton.secondary(
            label: l10n.commonCancel,
            onPressed: () => Navigator.pop(dialogContext, false),
          ),
        ],
      ),
    );
    if ((confirmed ?? false) && mounted) {
      context.read<CartBloc>().add(const CartCleared());
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final hasCarts = context.select<CartBloc, bool>((b) => !b.state.isEmpty);
    return AppScaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.gutter,
                AppSpacing.lg,
                AppSpacing.gutter,
                AppSpacing.lg,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.basketTitle,
                      style: AppTypography.headlineLarge,
                    ),
                  ),
                  if (_tab == 0 && hasCarts)
                    AppButton.tonal(
                      label: l10n.basketClearOrders,
                      size: AppButtonSize.xs,
                      onPressed: _clearAll,
                    ),
                ],
              ),
            ),
            Padding(
              padding: AppInsets.page,
              child: SegmentedTabs(
                segments: [
                  l10n.basketTabBaskets,
                  l10n.basketTabOngoing,
                  l10n.basketTabCompleted,
                ],
                selectedIndex: _tab,
                onChanged: (i) => setState(() => _tab = i),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Expanded(
              child: ColoredBox(
                color: context.colors.surfaceMuted,
                child: AnimatedSwitcher(
                  duration: AppDurations.fast,
                  child: switch (_tab) {
                    0 => const _Baskets(key: ValueKey('baskets')),
                    1 => const _Orders(
                      key: ValueKey('ongoing'),
                      type: OrderListType.ongoing,
                    ),
                    _ => const _Orders(
                      key: ValueKey('completed'),
                      type: OrderListType.completed,
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

EdgeInsets _listPadding(BuildContext context) => EdgeInsets.only(
  top: AppSpacing.sm,
  bottom:
      MediaQuery.paddingOf(context).bottom +
      AppSizes.bottomNavHeight +
      AppSpacing.xl,
);

class _Baskets extends StatelessWidget {
  const _Baskets({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final carts = context.select<CartBloc, List<StoreCart>>(
      (b) => b.state.storeCarts,
    );
    if (carts.isEmpty) {
      return EmptyState(
        title: l10n.basketEmptyTitle,
        message: l10n.basketEmptyMessage,
        illustration: AppIcon(
          Assets.icons.cartLarge2Linear,
          size: 56,
          color: context.colors.textDisabled,
        ),
        actionLabel: l10n.basketBrowse,
        onAction: () => context.go(AppRoutes.home),
      );
    }
    return ListView.separated(
      padding: _listPadding(context),
      itemCount: carts.length,
      separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
      itemBuilder: (context, i) =>
          _StoreCartCard(cart: carts[i]).entrance(index: i),
    );
  }
}

class _StoreCartCard extends StatelessWidget {
  const _StoreCartCard({required this.cart});

  final StoreCart cart;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final address = context.select<SessionCubit, String?>(
      (c) => c.state.address?.fullAddress,
    );
    final meta = AppTypography.bodySmall.copyWith(color: colors.textSecondary);
    return Container(
      color: colors.surface,
      padding: const EdgeInsets.all(AppSpacing.gutter),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppAvatar(imageUrl: cart.restaurantLogoUrl, size: 44),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cart.restaurantName, style: AppTypography.labelLarge),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      l10n.basketItemsTotal(
                        l10n.commonItems(cart.itemCount),
                        cart.subtotal.format(),
                      ),
                      style: meta,
                    ),
                    if (address != null) ...[
                      const SizedBox(height: AppSpacing.xxs),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: l10n.basketDeliverTo,
                              style: TextStyle(color: colors.textPrimary),
                            ),
                            TextSpan(text: address),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: meta,
                      ),
                    ],
                  ],
                ),
              ),
              AppIconButton(
                icon: Assets.icons.trashBinMinimalisticLinear,
                size: 32,
                iconSize: AppSizes.iconSm,
                tooltip: l10n.checkoutClearConfirm,
                onPressed: () => _removeWithUndo(context, cart),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              Expanded(
                child: AppButton.secondary(
                  label: l10n.basketVisitStore,
                  size: AppButtonSize.sm,
                  onPressed: () =>
                      context.push(AppRoutes.restaurant(cart.restaurantId)),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: AppButton(
                  label: l10n.basketCheckout,
                  size: AppButtonSize.sm,
                  onPressed: () =>
                      context.push(AppRoutes.checkout(cart.restaurantId)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Orders extends StatefulWidget {
  const _Orders({required this.type, super.key});

  final OrderListType type;

  @override
  State<_Orders> createState() => _OrdersState();
}

class _OrdersState extends State<_Orders> {
  ViewStatus _status = ViewStatus.loading;
  List<Order> _orders = const [];
  Failure? _failure;

  /// Ongoing orders move on their own: refresh while the list is open.
  Timer? _poll;

  bool get _isGuest => context.read<SessionCubit>().state.isGuest;

  @override
  void initState() {
    super.initState();
    if (!_isGuest) unawaited(_load());
    if (widget.type == OrderListType.ongoing) {
      _poll = Timer.periodic(const Duration(seconds: 15), (_) {
        if (!_isGuest && _status.isSuccess) unawaited(_load(silent: true));
      });
    }
  }

  @override
  void dispose() {
    _poll?.cancel();
    super.dispose();
  }

  Future<void> _load({bool silent = false}) async {
    if (!silent) setState(() => _status = ViewStatus.loading);
    final result = await sl<OrdersRepository>().getOrders(widget.type);
    if (!mounted) return;
    setState(() {
      result.fold(
        (f) {
          _status = ViewStatus.failure;
          _failure = f;
        },
        (orders) {
          _status = ViewStatus.success;
          _orders = orders;
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final ongoing = widget.type == OrderListType.ongoing;
    // Orders belong to an account: guests are asked to sign in instead.
    final isGuest = context.select<SessionCubit, bool>((c) => c.state.isGuest);
    if (isGuest) {
      return EmptyState(
        title: l10n.signInRequiredTitle,
        message: l10n.signInRequiredMessage,
        image: Assets.images.illustrations.riderDelivered.path,
        imageSize: 120,
        actionLabel: l10n.signInRequiredAction,
        onAction: () => context.push(
          Uri(
            path: AppRoutes.login,
            queryParameters: {'from': AppRoutes.basket},
          ).toString(),
        ),
      );
    }
    return BlocListener<SessionCubit, SessionState>(
      // Signed in from the prompt above: load this account's orders.
      listenWhen: (a, b) => a.user?.id != b.user?.id,
      listener: (_, _) => unawaited(_load()),
      child: _list(context, l10n, ongoing: ongoing),
    );
  }

  Widget _list(
    BuildContext context,
    AppLocalizations l10n, {
    required bool ongoing,
  }) {
    return RefreshIndicator(
      onRefresh: _load,
      child: AsyncView(
        status: _status,
        failure: _failure,
        onRetry: _load,
        isEmpty: _orders.isEmpty,
        empty: EmptyState(
          title: ongoing
              ? l10n.basketNoOngoingTitle
              : l10n.basketNoCompletedTitle,
          message: ongoing
              ? l10n.basketNoOngoingMessage
              : l10n.basketNoCompletedMessage,
          image: Assets.images.illustrations.riderDelivered.path,
          imageSize: 120,
        ),
        loading: AppSkeleton(
          enabled: true,
          child: ListView(
            padding: _listPadding(context),
            children: [
              for (var i = 0; i < 3; i++)
                const Padding(
                  padding: EdgeInsets.only(bottom: AppSpacing.sm),
                  child: SkeletonBox(
                    height: 80,
                    borderRadius: BorderRadius.zero,
                  ),
                ),
            ],
          ),
        ),
        builder: (_) => ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: _listPadding(context),
          itemCount: _orders.length,
          separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
          itemBuilder: (context, i) =>
              _OrderRow(order: _orders[i]).entrance(index: i),
        ),
      ),
    );
  }
}

class _OrderRow extends StatelessWidget {
  const _OrderRow({required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final meta = AppTypography.bodySmall.copyWith(color: colors.textSecondary);
    final completed = !order.isActive;
    final when = order.deliveredAt ?? order.placedAt;
    return Material(
      color: colors.surface,
      child: InkWell(
        onTap: () => context.push(
          completed
              ? AppRoutes.orderTimeline(order.id)
              : AppRoutes.order(order.id),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.gutter),
          child: Row(
            children: [
              AppAvatar(imageUrl: order.restaurant.logoUrl, size: 44),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.restaurant.name,
                      style: AppTypography.labelLarge,
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      l10n.basketItemsTotal(
                        l10n.commonItems(order.itemCount),
                        order.total.format(),
                      ),
                      style: meta,
                    ),
                    if (!completed) ...[
                      const SizedBox(height: AppSpacing.xxs),
                      Text(
                        l10n.basketOrderEta(
                          _statusLabel(l10n, order.status),
                          Formatters.time(
                            order.estimatedArrival,
                            locale: l10n.localeName,
                          ),
                        ),
                        style: meta.copyWith(color: colors.brand),
                      ),
                    ],
                    if (completed) ...[
                      const SizedBox(height: AppSpacing.xxs),
                      Text(
                        '${Formatters.longDate(when, locale: l10n.localeName)}'
                        ' · ${Formatters.time(when, locale: l10n.localeName)}',
                        style: meta,
                      ),
                    ],
                  ],
                ),
              ),
              if (completed)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(l10n.basketOrderNumber(order.id), style: meta),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      l10n.basketViewTimeline,
                      style: AppTypography.labelMedium.copyWith(
                        color: colors.brand,
                      ),
                    ),
                  ],
                )
              else
                AppIconButton(
                  icon: Assets.icons.altArrowRightLinear,
                  size: 32,
                  iconSize: AppSizes.iconSm,
                  onPressed: () => context.push(AppRoutes.order(order.id)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

String _statusLabel(AppLocalizations l10n, OrderStatus status) =>
    switch (status) {
      OrderStatus.placed => l10n.ordersStatusPlaced,
      OrderStatus.preparing => l10n.ordersStatusPreparing,
      OrderStatus.riderPicked => l10n.ordersStatusRiderPicked,
      OrderStatus.dispatched => l10n.ordersStatusDispatched,
      OrderStatus.delivered => l10n.ordersStatusDelivered,
      OrderStatus.cancelled => l10n.ordersStatusCancelled,
    };

/// Removes a store basket with an "Undo" toast (no silent data loss).
void _removeWithUndo(BuildContext context, StoreCart cart) {
  final bloc = context.read<CartBloc>()
    ..add(CartStoreCleared(cart.restaurantId));
  final l10n = context.l10n;
  AppToast.show(
    context,
    l10n.basketRemoved(cart.restaurantName),
    actionLabel: l10n.basketUndo,
    duration: const Duration(seconds: 4),
    onAction: () {
      final store = CartStoreInfo(
        id: cart.restaurantId,
        name: cart.restaurantName,
        logoUrl: cart.restaurantLogoUrl,
      );
      for (final item in cart.items) {
        bloc.add(CartItemAdded(store: store, item: item));
      }
    },
  );
}
