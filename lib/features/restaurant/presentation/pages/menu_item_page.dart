import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/models/money.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/cart/domain/entities/cart_item.dart';
import 'package:tavada_eats/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:tavada_eats/features/cart/presentation/cart_actions.dart';
import 'package:tavada_eats/features/catalog/domain/entities/menu.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant.dart';
import 'package:tavada_eats/features/catalog/domain/repositories/catalog_repository.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Dish details: options, quantity and "Add for £x".
class MenuItemPage extends StatefulWidget {
  const MenuItemPage({
    required this.restaurantId,
    required this.itemId,
    super.key,
    this.editLineId,
  });

  final String restaurantId;
  final String itemId;

  /// Basket line being edited ("Edit selection" at checkout).
  final String? editLineId;

  @override
  State<MenuItemPage> createState() => _MenuItemPageState();
}

class _MenuItemPageState extends State<MenuItemPage> {
  ViewStatus _status = ViewStatus.loading;
  Failure? _failure;
  MenuItem? _item;
  Restaurant? _restaurant;

  /// groupId → chosen option ids.
  final _selected = <String, Set<String>>{};
  final _groupKeys = <String, GlobalKey>{};
  int _quantity = 1;

  /// True when [MenuItemPage.editLineId] still exists in the basket.
  bool _isEditing = false;

  /// "Special instructions" for the kitchen (stored on the basket line).
  String _note = '';

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    setState(() => _status = ViewStatus.loading);
    final repository = sl<CatalogRepository>();
    final (item, restaurant) = await (
      repository.getMenuItem(
        restaurantId: widget.restaurantId,
        itemId: widget.itemId,
      ),
      repository.getRestaurant(widget.restaurantId),
    ).wait;
    if (!mounted) return;
    setState(() {
      item.fold(
        (f) {
          _status = ViewStatus.failure;
          _failure = f;
        },
        (item) {
          _status = ViewStatus.success;
          _item = item;
          _restaurant = restaurant.toNullable();
          final line = _editedLine;
          _isEditing = line != null;
          for (final g in item.optionGroups) {
            final free = g.options.where((o) => o.price.isZero).firstOrNull;
            _selected[g.id] = line != null
                ? {
                    for (final o in line.options)
                      if (o.groupId == g.id) o.optionId,
                  }
                : {
                    // Required single choices start on their first FREE
                    // option; paid choices are never picked for the
                    // customer (they'd pay more than the menu price).
                    if (g.isRequired && g.isSingleChoice && free != null)
                      free.id,
                  };
          }
          if (line != null) {
            _quantity = line.quantity;
            _note = line.note ?? '';
          }
        },
      );
    });
  }

  void _toggle(OptionGroup group, MenuOption option) {
    setState(() {
      final current = _selected[group.id] ?? {};
      if (group.isSingleChoice) {
        _selected[group.id] = current.contains(option.id) && !group.isRequired
            ? {}
            : {option.id};
      } else if (current.contains(option.id)) {
        current.remove(option.id);
      } else if (current.length < group.maxSelect) {
        current.add(option.id);
      } else {
        AppToast.show(context, context.l10n.dishMaxReached(group.maxSelect));
      }
    });
  }

  /// First required group that still needs a choice.
  OptionGroup? get _missingGroup => _item!.optionGroups
      .where(
        (g) =>
            g.isRequired &&
            (_selected[g.id]?.length ?? 0) <
                (g.minSelect > 0 ? g.minSelect : 1),
      )
      .firstOrNull;

  /// "Add" tapped before every required choice is made: say which one and
  /// scroll to it.
  void _showMissing(OptionGroup group) {
    AppToast.show(context, context.l10n.dishChooseRequired(group.title));
    final target = _groupKeys[group.id]?.currentContext;
    if (target != null) {
      unawaited(
        Scrollable.ensureVisible(
          target,
          duration: AppDurations.normal,
          alignment: 0.1,
        ),
      );
    }
  }

  /// Closes the dish page; opened by a link it may be the only page.
  void _close() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(AppRoutes.restaurant(widget.restaurantId));
    }
  }

  List<SelectedOption> get _options => [
    for (final g in _item!.optionGroups)
      for (final o in g.options)
        if (_selected[g.id]?.contains(o.id) ?? false)
          SelectedOption(
            groupId: g.id,
            groupTitle: g.title,
            optionId: o.id,
            name: o.name,
            price: o.price,
          ),
  ];

  Money get _total {
    final unit = _options.fold(_item!.price, (sum, o) => sum + o.price);
    return unit * _quantity;
  }

  CartItem? get _editedLine {
    final id = widget.editLineId;
    if (id == null) return null;
    return context
        .read<CartBloc>()
        .state
        .cartFor(widget.restaurantId)
        ?.items
        .where((i) => i.id == id)
        .firstOrNull;
  }

  void _add() {
    final item = _item!;
    final missing = _missingGroup;
    if (missing != null) {
      _showMissing(missing);
      return;
    }
    final line = _editedLine;
    if (line != null) {
      context.read<CartBloc>().add(
        CartItemUpdated(
          line.copyWith(
            quantity: _quantity,
            options: _options,
            note: _note.trim().isEmpty ? null : _note.trim(),
          ),
        ),
      );
      _close();
      return;
    }
    final store =
        _restaurant?.cartStore ??
        CartStoreInfo(
          id: item.restaurantId,
          name: item.restaurantName ?? '',
          logoUrl: '',
        );
    context.read<CartBloc>().add(
      CartItemAdded(
        store: store,
        item: cartLineFor(
          item,
          quantity: _quantity,
          options: _options,
          note: _note.trim().isEmpty ? null : _note.trim(),
        ),
      ),
    );
    showAddedToCartToast(context);
    _close();
  }

  @override
  Widget build(BuildContext context) {
    final item = _item;
    if (item == null) {
      return AppScaffold(
        appBar: const AppTopBar(useCloseIcon: true),
        body: _status.isFailure
            ? ErrorStateView(failure: _failure, onRetry: _load)
            : const Center(child: CircularProgressIndicator()),
      );
    }
    final l10n = context.l10n;
    // A closed store can be browsed but takes no orders.
    final closed = !_isEditing && !(_restaurant?.isOpen ?? true);
    return AppScaffold(
      bottomBar: StickyBottomBar(
        showShadow: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            QuantityStepper(
              value: _quantity,
              style: QuantityStepperStyle.large,
              onChanged: (v) => setState(() => _quantity = v),
            ),
            const SizedBox(height: AppSpacing.md),
            AppButton(
              label: closed
                  ? l10n.restaurantClosedOpensAt(_restaurant?.opensAt ?? '')
                  : _isEditing
                  ? l10n.dishUpdateFor(_total.format())
                  : l10n.dishAddFor(_total.format()),
              // Stays tappable while choices are missing so we can say which.
              onPressed: closed ? null : _add,
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _Hero(item: item)),
          SliverToBoxAdapter(
            child: _Details(item: item, restaurant: _restaurant),
          ),
          for (final group in item.optionGroups) ...[
            SliverToBoxAdapter(
              child: _GroupHeader(
                key: _groupKeys.putIfAbsent(group.id, GlobalKey.new),
                group: group,
              ),
            ),
            // Figma: options sit on a Gray/50 band with white dividers.
            DecoratedSliver(
              decoration: BoxDecoration(color: context.colors.surfaceMuted),
              sliver: SliverList.list(
                children: [
                  for (final option in group.options)
                    AppSelectionTile(
                      dividerColor: context.colors.surface,
                      title: option.name,
                      isRadio: group.isSingleChoice,
                      selected:
                          _selected[group.id]?.contains(option.id) ?? false,
                      trailingText: option.price.isZero
                          ? null
                          : '+${option.price.format()}',
                      onTap: () => _toggle(group, option),
                    ),
                ],
              ),
            ),
          ],
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SectionGap(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.gutter,
                    AppSpacing.lg,
                    AppSpacing.gutter,
                    0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        l10n.dishNoteTitle,
                        style: AppTypography.titleMedium.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      AppTextField(
                        initialValue: _note,
                        hint: l10n.dishNoteHint,
                        maxLines: 3,
                        minLines: 1,
                        maxLength: 140,
                        textCapitalization: TextCapitalization.sentences,
                        onChanged: (v) => _note = v,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),
        ],
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero({required this.item});

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    return SizedBox(
      // Figma: 218pt including the status bar.
      height: 171 + top,
      child: Stack(
        children: [
          Positioned.fill(
            child: AppImage(item.imageUrl, heroTag: item.heroTag),
          ),
          Positioned(
            top: top + 18,
            left: AppSpacing.gutter,
            child: const AppBackButton(
              useCloseIcon: true,
              variant: AppIconButtonVariant.elevated,
            ),
          ),
        ],
      ),
    );
  }
}

class _Details extends StatelessWidget {
  const _Details({required this.item, required this.restaurant});

  final MenuItem item;
  final Restaurant? restaurant;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final r = restaurant;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.gutter,
        AppSpacing.xl,
        AppSpacing.gutter,
        AppSpacing.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.name,
            style: AppTypography.headlineSmall.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ).entrance(),
          const SizedBox(height: AppSpacing.xs),
          Row(
            children: [
              PriceText(
                price: item.price,
                originalPrice: item.originalPrice,
                style: AppTypography.titleMedium,
              ),
              if (item.hasDiscount) ...[
                const SizedBox(width: AppSpacing.sm),
                AppIcon(
                  Assets.icons.saleBold,
                  size: AppSizes.iconSm,
                  color: colors.error,
                ),
                const SizedBox(width: AppSpacing.xxs),
                Text(
                  l10n.dishPercentOff(item.discountPercent),
                  style: AppTypography.labelMedium,
                ),
              ],
            ],
          ).entrance(index: 1),
          const SizedBox(height: AppSpacing.sm),
          Text(
            item.description,
            style: AppTypography.caption.copyWith(
              color: colors.textSecondary,
            ),
          ).entrance(index: 2),
          if (r != null) ...[
            const SizedBox(height: AppSpacing.lg),
            PressableScale(
              onTap: () => context.canPop()
                  ? context.pop()
                  : context.go(AppRoutes.restaurant(r.id)),
              child: Row(
                children: [
                  // Figma shows the restaurant's food photo here.
                  AppAvatar(imageUrl: r.coverUrl, size: AppSizes.avatarSm),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(r.name, style: AppTypography.labelLarge),
                        Text(
                          r.deliveryFee.isZero
                              ? l10n.dishFreeDeliveryMeta(
                                  l10n.commonMinutes(r.etaMinutes),
                                )
                              : l10n.dishDeliveryMeta(
                                  r.deliveryFee.formatCompact(),
                                  l10n.commonMinutes(r.etaMinutes),
                                ),
                          style: AppTypography.bodySmall.copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppIcon(
                    Assets.icons.altArrowRightLinear,
                    size: AppSizes.iconMd,
                    color: colors.textTertiary,
                  ),
                ],
              ),
            ).entrance(index: 3),
          ],
          const SizedBox(height: AppSpacing.lg),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: colors.surfaceWarm,
              borderRadius: AppRadii.lgAll,
              border: Border.all(color: AppColors.primary100),
            ),
            child: Text.rich(
              TextSpan(
                style: AppTypography.bodySmall.copyWith(
                  color: colors.textSecondary,
                ),
                children: [
                  TextSpan(text: l10n.dishAllergenNotice),
                  TextSpan(
                    text: l10n.dishContactRestaurant,
                    style: TextStyle(color: colors.brand),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => context.push(AppRoutes.supportChat),
                  ),
                ],
              ),
            ),
          ).entrance(index: 4),
        ],
      ),
    );
  }
}

class _GroupHeader extends StatelessWidget {
  const _GroupHeader({required this.group, super.key});

  final OptionGroup group;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final hint = group.isRequired
        ? l10n.dishRequired
        : group.maxSelect > 1
        ? l10n.dishChooseUpTo(group.maxSelect)
        : l10n.dishOptional;
    return Column(
      children: [
        const SectionGap(),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.gutter,
            AppSpacing.lg,
            AppSpacing.gutter,
            AppSpacing.sm,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  group.title,
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                hint,
                style: AppTypography.bodySmall.copyWith(
                  color: group.isRequired
                      ? colors.textPrimary
                      : colors.textTertiary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
