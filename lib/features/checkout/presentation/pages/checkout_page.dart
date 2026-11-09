import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/session/session_cubit.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/cart/domain/entities/cart_item.dart';
import 'package:tavada_eats/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:tavada_eats/features/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:tavada_eats/features/checkout/presentation/widgets/checkout_delivery_section.dart';
import 'package:tavada_eats/features/checkout/presentation/widgets/checkout_packs_section.dart';
import 'package:tavada_eats/features/checkout/presentation/widgets/checkout_payment_section.dart';
import 'package:tavada_eats/features/checkout/presentation/widgets/checkout_sheets.dart';
import 'package:tavada_eats/features/checkout/presentation/widgets/checkout_summary_section.dart';
import 'package:tavada_eats/features/location/presentation/location_flow.dart';
import 'package:tavada_eats/features/orders/domain/entities/order.dart';
import 'package:tavada_eats/features/restaurant/presentation/widgets/restaurant_widgets.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

List<OrderLine> _linesOf(StoreCart? cart) => [
  for (final i in cart?.items ?? const <CartItem>[])
    OrderLine(
      id: i.id,
      menuItemId: i.menuItemId,
      name: i.name,
      imageUrl: i.imageUrl,
      quantity: i.quantity,
      basePrice: i.basePrice,
      options: i.options,
      note: i.note,
    ),
];

/// Checkout for one store's basket: packs, delivery/pickup, payment,
/// extras and the live quote.
class CheckoutPage extends StatelessWidget {
  const CheckoutPage({required this.restaurantId, super.key});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          CheckoutBloc(
            restaurantId: restaurantId,
            checkoutRepository: sl(),
            ordersRepository: sl(),
            catalogRepository: sl(),
          )..add(
            CheckoutStarted(
              _linesOf(context.read<CartBloc>().state.cartFor(restaurantId)),
            ),
          ),
      child: _CheckoutView(restaurantId: restaurantId),
    );
  }
}

class _CheckoutView extends StatefulWidget {
  const _CheckoutView({required this.restaurantId});

  final String restaurantId;

  @override
  State<_CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<_CheckoutView> {
  bool _showDelivery = false;

  /// A guest tapped "Make payment" and was sent to log in: pay as soon as
  /// this page is back on top with a signed-in user (choices intact).
  bool _payAfterSignIn = false;

  CheckoutBloc get _bloc => context.read<CheckoutBloc>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Subscribes to the route's "current" status, so this runs again when
    // the auth pages above are popped.
    final isCurrent = ModalRoute.isCurrentOf(context) ?? false;
    if (!_payAfterSignIn || !isCurrent) return;
    _payAfterSignIn = false;
    final session = context.read<SessionCubit>().state;
    if (session.isGuest) return;
    _bloc.add(CheckoutAccountChanged(submit: true, address: session.address));
  }

  Future<void> _confirmClear(String store) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AppDialog(
        title: l10n.checkoutClearTitle,
        message: l10n.checkoutClearMessage(store),
        actions: [
          AppButton(
            label: l10n.checkoutClearConfirm,
            onPressed: () => Navigator.pop(dialogContext, true),
          ),
          AppButton.secondary(
            label: l10n.commonCancel,
            onPressed: () => Navigator.pop(dialogContext, false),
          ),
        ],
      ),
    );
    if (!(confirmed ?? false) || !mounted) return;
    context.read<CartBloc>().add(CartStoreCleared(widget.restaurantId));
    // Checkout can be the only page (deep link, restored after sign-in).
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(AppRoutes.home);
    }
  }

  Future<void> _editInstructions(String? current) async {
    final text = await showDeliveryInstructionsSheet(context, initial: current);
    if (text == null) return;
    _bloc.add(CheckoutInstructionsChanged(text.isEmpty ? null : text));
  }

  Future<void> _editGift(GiftDetails? current) async {
    final gift = await showGiftSheet(
      context,
      initial: current,
      senderName: context.read<SessionCubit>().state.user?.firstName,
    );
    if (gift == null) return;
    _bloc.add(CheckoutGiftChanged(gift.senderName.isEmpty ? null : gift));
  }

  String? _blockedReason(CheckoutState state, AppLocalizations l10n) {
    final restaurant = state.restaurant;
    if (state.isClosed && restaurant != null) {
      return l10n.checkoutClosedShort(
        restaurant.name,
        restaurant.opensAt ?? '',
      );
    }
    if (state.blockedByWallet) return l10n.checkoutWalletBlocked;
    if (state.quoteFailure != null) return _quoteError(state, l10n);
    return null;
  }

  /// The server's reason ("doesn't deliver to this address") when it gave
  /// one, else a generic "couldn't update your total".
  String _quoteError(CheckoutState state, AppLocalizations l10n) =>
      switch (state.quoteFailure) {
        final ValidationFailure f => f.localizedMessage(l10n),
        _ => l10n.checkoutQuoteFailed,
      };

  void _pay() {
    final session = context.read<SessionCubit>().state;
    if (session.isGuest) {
      _payAfterSignIn = true;
      unawaited(
        context.push(
          Uri(
            path: AppRoutes.login,
            queryParameters: {'from': AppRoutes.checkout(widget.restaurantId)},
          ).toString(),
        ),
      );
      return;
    }
    _bloc.add(CheckoutSubmitted(address: session.address));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    return MultiBlocListener(
      listeners: [
        // Keep the quote in sync with quantity edits / removals.
        BlocListener<CartBloc, CartState>(
          listenWhen: (a, b) =>
              a.cartFor(widget.restaurantId) != b.cartFor(widget.restaurantId),
          listener: (context, cart) => _bloc.add(
            CheckoutLinesChanged(_linesOf(cart.cartFor(widget.restaurantId))),
          ),
        ),
        // A new delivery address can change the price or whether the store
        // delivers at all: re-quote.
        BlocListener<SessionCubit, SessionState>(
          listenWhen: (a, b) => a.address != b.address,
          listener: (context, _) => _bloc.add(const CheckoutQuoteRetried()),
        ),
        BlocListener<CheckoutBloc, CheckoutState>(
          listenWhen: (a, b) => a.submitStatus != b.submitStatus,
          listener: (context, state) {
            final order = state.placedOrder;
            if (state.submitStatus.isSuccess && order != null) {
              context.read<CartBloc>().add(
                CartStoreCleared(widget.restaurantId),
              );
              context.go(AppRoutes.order(order.id));
            } else if (state.submitStatus.isFailure) {
              AppToast.show(
                context,
                state.submitFailure!.localizedMessage(l10n),
                type: ToastType.error,
              );
            }
          },
        ),
      ],
      child: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          final cart = context.watch<CartBloc>().state.cartFor(
            widget.restaurantId,
          );
          final restaurant = state.restaurant;
          if (cart == null || cart.isEmpty) {
            return AppScaffold(
              appBar: AppTopBar(title: l10n.checkoutTitle),
              body: EmptyState(
                title: l10n.checkoutEmptyTitle,
                message: l10n.checkoutEmptyMessage,
                illustration: AppIcon(
                  Assets.icons.cartLarge2Linear,
                  size: 56,
                  color: colors.textDisabled,
                ),
                actionLabel: l10n.checkoutBackToStore,
                onAction: () => context.pushReplacement(
                  AppRoutes.restaurant(widget.restaurantId),
                ),
              ),
            );
          }
          if (state.status.isFailure) {
            return AppScaffold(
              appBar: AppTopBar(title: l10n.checkoutTitle),
              body: ErrorStateView(
                failure: state.failure,
                onRetry: () => _bloc.add(CheckoutStarted(_linesOf(cart))),
              ),
            );
          }
          final quote = state.quote;
          final address = context.watch<SessionCubit>().state.address;
          return AppScaffold(
            appBar: AppTopBar(
              title: l10n.checkoutTitle,
              alwaysShowDivider: true,
              actions: [
                AppIconButton(
                  icon: Assets.icons.trashBinMinimalisticLinear,
                  tooltip: l10n.checkoutClearConfirm,
                  onPressed: () => _confirmClear(cart.restaurantName),
                ),
              ],
            ),
            bottomBar: StickyBottomBar(
              header: Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Why "Make payment" is disabled.
                    if (_blockedReason(state, l10n) case final reason?)
                      Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                        child: Text(
                          reason,
                          textAlign: TextAlign.center,
                          style: AppTypography.bodySmall.copyWith(
                            color: colors.error,
                          ),
                        ),
                      ),
                    const LegalConsentText(compact: true),
                  ],
                ),
              ),
              child: AppButton(
                label: l10n.checkoutMakePayment,
                trailingLabel: quote?.total.format(),
                isLoading: state.submitStatus.isSubmitting,
                onPressed:
                    state.canSubmit &&
                        (state.mode == DeliveryMode.pickup || address != null)
                    ? _pay
                    : null,
              ),
            ),
            body: ListView(
              padding: const EdgeInsets.only(bottom: AppSpacing.xl),
              children: [
                CheckoutPacksSection(cart: cart),
                if (restaurant != null && !restaurant.isOpen)
                  Padding(
                    padding: AppInsets.pageAll,
                    child: InfoBanner(
                      message: l10n.checkoutClosedBanner(
                        restaurant.name,
                        restaurant.opensAt ?? '',
                      ),
                    ),
                  ),
                const SectionGap(),
                ExpandableSection(
                  expanded: _showDelivery,
                  onExpansionChanged: (v) => setState(() => _showDelivery = v),
                  header: Text(
                    l10n.checkoutDeliveryInfo,
                    style: AppTypography.labelLarge,
                  ),
                  child: CheckoutDeliverySection(
                    mode: state.mode,
                    restaurant: restaurant,
                    address: address,
                    instructions: state.instructions,
                    etaMinutes: quote?.etaMinutes ?? 20,
                    distanceMiles: quote?.distanceMiles ?? 0.5,
                    onModeChanged: (m) => _bloc.add(CheckoutModeChanged(m)),
                    onAddressTap: () => context.push(
                      AppRoutes.locationPicker,
                      extra: LocationPickerArgs(
                        center: address?.location,
                        popOnSelect: true,
                      ),
                    ),
                    onInstructionsTap: () =>
                        _editInstructions(state.instructions),
                    onAllergyTap: restaurant == null
                        ? () {}
                        : () => showAllergySheet(context, restaurant),
                  ),
                ),
                const SectionGap(),
                CheckoutPaymentSection(
                  method: state.paymentMethod,
                  options: state.paymentOptions,
                  walletTooLow: state.walletTooLow,
                  onChanged: (m) => _bloc.add(CheckoutPaymentMethodChanged(m)),
                  onTopUp: () async {
                    await context.push(AppRoutes.addMoney);
                    if (!mounted) return;
                    _bloc.add(const CheckoutAccountChanged(submit: false));
                  },
                ),
                const SectionGap(),
                CheckoutExtrasSection(
                  cutlery: state.cutlery,
                  gift: state.gift,
                  onCutleryChanged: (v) =>
                      _bloc.add(CheckoutCutleryToggled(requested: v)),
                  onGiftTap: () => _editGift(state.gift),
                ),
                const SectionGap(),
                if (state.quoteFailure != null)
                  Padding(
                    padding: AppInsets.pageAll,
                    child: InfoBanner(
                      message: _quoteError(state, l10n),
                      actionLabel: l10n.commonRetry,
                      onAction: () => _bloc.add(const CheckoutQuoteRetried()),
                    ),
                  ),
                if (quote != null)
                  AnimatedOpacity(
                    opacity: state.isQuoting ? 0.5 : 1,
                    duration: AppDurations.fast,
                    child: CheckoutSummarySection(quote: quote),
                  )
                else if (state.quoteFailure == null)
                  const Padding(
                    padding: AppInsets.pageAll,
                    child: AppSkeleton(
                      enabled: true,
                      child: SkeletonBox(height: 120),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
