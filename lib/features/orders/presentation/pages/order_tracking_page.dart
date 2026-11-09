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
import 'package:tavada_eats/features/orders/domain/entities/order.dart';
import 'package:tavada_eats/features/orders/presentation/bloc/order_cubit.dart';
import 'package:tavada_eats/features/orders/presentation/widgets/order_widgets.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

/// Live order: ETA + progress, rider, delivery info and summary; turns into
/// the "Yay! Your food arrived" rating screen once delivered.
class OrderTrackingPage extends StatelessWidget {
  const OrderTrackingPage({required this.orderId, super.key});

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = OrderCubit(sl(), orderId);
        unawaited(cubit.load());
        return cubit;
      },
      child: const _OrderTrackingView(),
    );
  }
}

class _OrderTrackingView extends StatelessWidget {
  const _OrderTrackingView();

  void _back(BuildContext context) =>
      context.canPop() ? context.pop() : context.go(AppRoutes.basket);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        final order = state.order;
        if (order == null) {
          return AppScaffold(
            appBar: AppTopBar(onBack: () => _back(context)),
            body: state.status.isFailure
                ? ErrorStateView(
                    failure: state.failure,
                    onRetry: context.read<OrderCubit>().load,
                  )
                : const Center(child: CircularProgressIndicator()),
          );
        }
        final delivered = order.status == OrderStatus.delivered;
        return AppScaffold(
          backgroundColor: colors.surface,
          body: ListView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.paddingOf(context).bottom + AppSpacing.xxl,
            ),
            children: [
              AnimatedSwitcher(
                duration: AppDurations.slow,
                child: delivered
                    ? _Arrived(key: const ValueKey('arrived'), order: order)
                    : _Progress(
                        key: const ValueKey('progress'),
                        order: order,
                        onBack: () => _back(context),
                      ),
              ),
              if (!delivered && order.status.hasRider && order.rider != null)
                _RiderRow(rider: order.rider!),
              const SectionGap(),
              OrderSectionTitle(context.l10n.ordersDeliveryInfo),
              OrderDeliveryInfo(order: order, editable: !delivered),
              const SectionGap(),
              OrderSectionTitle(context.l10n.ordersSummary),
              OrderSummary(order: order, showPayment: false),
              const SectionGap(),
              OrderSectionTitle(context.l10n.ordersPaymentDetails),
              OrderPaymentDetails(order: order),
              const SizedBox(height: AppSpacing.xl),
              // Support asks for the order number; help is one tap away.
              Center(
                child: Column(
                  children: [
                    Text(
                      context.l10n.basketOrderNumber(order.id),
                      style: AppTypography.bodySmall.copyWith(
                        color: colors.textTertiary,
                      ),
                    ),
                    AppLinkButton(
                      label: context.l10n.ordersNeedHelp,
                      onPressed: () => context.push(AppRoutes.supportChat),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Progress extends StatelessWidget {
  const _Progress({required this.order, required this.onBack, super.key});

  final Order order;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final label = switch (order.status) {
      OrderStatus.placed => l10n.ordersStatusPlaced,
      OrderStatus.preparing => l10n.ordersStatusPreparing,
      OrderStatus.riderPicked => l10n.ordersStatusRiderPicked,
      OrderStatus.dispatched => l10n.ordersStatusDispatched,
      OrderStatus.delivered => l10n.ordersStatusDelivered,
      OrderStatus.cancelled => l10n.ordersStatusCancelled,
    };
    return ColoredBox(
      color: colors.surfaceMuted,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.gutter,
            AppSpacing.sm,
            AppSpacing.gutter,
            AppSpacing.xl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBackButton(onPressed: onBack),
              const SizedBox(height: AppSpacing.xxl),
              Text(
                l10n.ordersHangTight,
                style: AppTypography.titleMedium.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: AppRadii.xxlAll,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            l10n.ordersEstimatedArrival,
                            style: AppTypography.bodyMedium.copyWith(
                              color: colors.textSecondary,
                            ),
                          ),
                        ),
                        AnimatedSwitcher(
                          duration: AppDurations.normal,
                          child: StatusPill.dark(
                            key: ValueKey(order.status),
                            label: label,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      Formatters.time(
                        order.estimatedArrival.toLocal(),
                        locale: l10n.localeName,
                      ),
                      style: AppTypography.headlineMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Row(
                      children: [
                        for (var i = 1; i <= 5; i++) ...[
                          if (i > 1) const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: AnimatedContainer(
                              duration: AppDurations.slow,
                              curve: AppCurves.emphasized,
                              height: 4,
                              decoration: BoxDecoration(
                                color: i <= order.status.step
                                    ? colors.brand
                                    : colors.surfaceMuted,
                                borderRadius: AppRadii.pillAll,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RiderRow extends StatelessWidget {
  const _RiderRow({required this.rider});

  final OrderRider rider;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.gutter,
        vertical: AppSpacing.lg,
      ),
      child: Row(
        children: [
          AppAvatar(
            imageUrl: rider.avatarUrl,
            initials: rider.name.characters.first,
            size: AppSizes.avatarSm,
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(rider.name, style: AppTypography.labelLarge),
                Text(
                  rider.phone,
                  style: AppTypography.bodySmall.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          AppButton.tonal(
            label: context.l10n.ordersCallRider,
            leading: AppIcon(
              Assets.icons.phoneCallingRoundedLinear,
              size: AppSizes.iconSm,
              color: colors.brand,
            ),
            onPressed: () => launchUrl(Uri(scheme: 'tel', path: rider.phone)),
          ),
        ],
      ),
    ).entrance();
  }
}

class _Arrived extends StatelessWidget {
  const _Arrived({required this.order, super.key});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final cubit = context.read<OrderCubit>();
    final rider = order.rider?.name;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConfettiBurst(
          autoFire: order.rating == null,
          child: Stack(
            children: [
              // Figma crops the rider at the waist on white (0–295pt).
              SizedBox(
                width: double.infinity,
                height: 248 + MediaQuery.paddingOf(context).top,
                child: Assets.images.illustrations.riderDelivered.image(
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              Positioned(
                top: MediaQuery.paddingOf(context).top + AppSpacing.sm,
                left: AppSpacing.gutter,
                child: AppBackButton(
                  onPressed: () => context.canPop()
                      ? context.pop()
                      : context.go(AppRoutes.basket),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.gutter,
            AppSpacing.lg,
            AppSpacing.gutter,
            AppSpacing.xl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.ordersArrivedIn(order.deliveryMinutes),
                style: AppTypography.titleMedium,
              ).entrance(),
              if (rider != null) ...[
                const SizedBox(height: AppSpacing.xs),
                Text.rich(
                  TextSpan(
                    text: l10n.ordersRateBy,
                    children: [
                      TextSpan(
                        text: rider,
                        style: TextStyle(
                          color: colors.textPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  style: AppTypography.bodyMedium.copyWith(
                    color: colors.textSecondary,
                    fontWeight: FontWeight.w400,
                  ),
                ).entrance(index: 1),
              ],
              const SizedBox(height: AppSpacing.lg),
              RatingInput(
                value: order.rating ?? 0,
                onChanged: (v) async {
                  final failure = await cubit.rate(v);
                  if (!context.mounted) return;
                  AppToast.show(
                    context,
                    failure == null
                        ? l10n.ordersThanksRating
                        : failure.localizedMessage(l10n),
                    type: failure == null ? ToastType.success : ToastType.error,
                  );
                },
              ).entrance(index: 2),
            ],
          ),
        ),
      ],
    );
  }
}
