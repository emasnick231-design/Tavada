import 'dart:math' as math;

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/session/session_cubit.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/core/utils/haptics.dart';
import 'package:tavada_eats/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Scaffold hosting the four bottom-navigation tabs.
class AppShell extends StatelessWidget {
  const AppShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  void _onTap(int index) {
    Haptics.selection();
    navigationShell.goBranch(
      index,
      // Tapping the active tab pops it back to its root.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTap,
      ),
    );
  }
}

/// Bottom navigation bar with animated selection, a live basket
/// badge and the user's avatar on the Profile tab.
class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    final bottom = math.max(
      MediaQuery.viewPaddingOf(context).bottom,
      MediaQuery.paddingOf(context).bottom,
    );
    final basketCount = context.select<CartBloc, int>(
      (b) => b.state.totalItems,
    );
    final avatar = context.select<SessionCubit, String?>(
      (c) => c.state.user?.avatarUrl,
    );

    // Figma: solid white bar, 24pt icons 9pt below its top edge, 12pt
    // labels right under them, then the full home-indicator inset.
    return Material(
      color: colors.surface,
      child: Padding(
        padding: EdgeInsets.only(
          top: 9,
          bottom: bottom > 0 ? bottom - 2 : AppSpacing.sm,
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _NavItem(
                label: l10n.navHome,
                icon: Assets.icons.homeSmileLinear,
                activeIcon: Assets.icons.homeSmileBold,
                selected: currentIndex == 0,
                onTap: () => onTap(0),
              ),
              _NavItem(
                label: l10n.navStores,
                icon: Assets.icons.shop2Linear,
                activeIcon: Assets.icons.shop2Bold,
                selected: currentIndex == 1,
                onTap: () => onTap(1),
              ),
              _NavItem(
                label: l10n.navBasket,
                icon: Assets.icons.cartLarge2Linear,
                activeIcon: Assets.icons.cartLarge2Bold,
                selected: currentIndex == 2,
                badge: basketCount,
                onTap: () => onTap(2),
              ),
              _NavItem(
                label: l10n.navProfile,
                selected: currentIndex == 3,
                onTap: () => onTap(3),
                custom: _ProfileAvatar(
                  imageUrl: avatar ?? Assets.images.avatars.parrot.path,
                  selected: currentIndex == 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.selected,
    required this.onTap,
    this.icon,
    this.activeIcon,
    this.custom,
    this.badge = 0,
  });

  final String label;
  final SvgGenImage? icon;
  final SvgGenImage? activeIcon;
  final Widget? custom;
  final bool selected;
  final int badge;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final color = selected ? colors.brand : colors.textTertiary;
    var glyph =
        custom ??
        AnimatedSwitcher(
          duration: AppDurations.fast,
          transitionBuilder: (c, a) => ScaleTransition(scale: a, child: c),
          child: AppIcon(
            selected ? activeIcon! : icon!,
            key: ValueKey(selected),
            color: color,
          ),
        );
    if (selected) {
      glyph = glyph
          .animate(key: ValueKey('nav-$label'))
          .scale(
            begin: const Offset(0.8, 0.8),
            end: const Offset(1, 1),
            duration: AppDurations.slow,
            curve: AppCurves.spring,
          );
    }

    return Expanded(
      child: Semantics(
        selected: selected,
        button: true,
        label: label,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: AppSizes.iconLg,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    glyph,
                    if (badge > 0)
                      Positioned(
                        right: -8,
                        top: -4,
                        child: CountBadge(count: badge),
                      ),
                  ],
                ),
              ),
              AnimatedDefaultTextStyle(
                duration: AppDurations.fast,
                style: AppTypography.bodySmall.copyWith(
                  color: color,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                ),
                child: Text(label, maxLines: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({required this.imageUrl, required this.selected});

  final String imageUrl;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedContainer(
          duration: AppDurations.normal,
          padding: const EdgeInsets.all(1.5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: selected ? colors.brand : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: AppAvatar(imageUrl: imageUrl, size: 22),
        ),
        // No unread-notification source exists yet, so no badge (an
        // always-on red dot reads as "something needs your attention").
      ],
    );
  }
}

/// Keeps every tab alive and cross-fades between them (Material fade-through
/// feel) instead of the default hard swap.
class AnimatedBranchContainer extends StatelessWidget {
  const AnimatedBranchContainer({
    required this.currentIndex,
    required this.children,
    super.key,
  });

  final int currentIndex;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < children.length; i++)
          IgnorePointer(
            ignoring: i != currentIndex,
            // The fade/scale must sit outside TickerMode: a muted ticker would
            // freeze the outgoing tab at full opacity on top of the new one.
            child: AnimatedOpacity(
              opacity: i == currentIndex ? 1 : 0,
              duration: AppDurations.normal,
              curve: AppCurves.standard,
              child: AnimatedScale(
                scale: i == currentIndex ? 1 : 0.985,
                duration: AppDurations.normal,
                curve: AppCurves.emphasized,
                child: TickerMode(
                  enabled: i == currentIndex,
                  // Hidden tabs stay mounted; keep their heroes (same
                  // restaurant/search tags as the visible tab) out of flights.
                  child: HeroMode(
                    enabled: i == currentIndex,
                    child: children[i],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
