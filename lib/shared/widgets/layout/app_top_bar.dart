import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/shared/widgets/buttons/app_icon_button.dart';
import 'package:tavada_eats/shared/widgets/layout/frosted.dart';

/// Header used by pushed screens: circular back button, centered title,
/// trailing actions and a hairline/blur once content scrolls underneath.
///
/// Pass [scrollController] to animate the divider in only after scrolling.
class AppTopBar extends StatefulWidget implements PreferredSizeWidget {
  const AppTopBar({
    super.key,
    this.title,
    this.titleWidget,
    this.leading,
    this.actions = const [],
    this.showBack = true,
    this.useCloseIcon = false,
    this.onBack,
    this.scrollController,
    this.alwaysShowDivider = false,
    this.frosted = false,
    this.backgroundColor,
    this.bottom,
  });

  final String? title;
  final Widget? titleWidget;
  final Widget? leading;
  final List<Widget> actions;
  final bool showBack;
  final bool useCloseIcon;
  final VoidCallback? onBack;
  final ScrollController? scrollController;
  final bool alwaysShowDivider;

  /// Blurs content scrolling beneath (use with `extendBodyBehindAppBar`).
  final bool frosted;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize => Size.fromHeight(
    AppSizes.appBarHeight + 8 + (bottom?.preferredSize.height ?? 0),
  );

  @override
  State<AppTopBar> createState() => _AppTopBarState();
}

class _AppTopBarState extends State<AppTopBar> {
  bool _scrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController?.addListener(_onScroll);
  }

  @override
  void didUpdateWidget(covariant AppTopBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scrollController != widget.scrollController) {
      oldWidget.scrollController?.removeListener(_onScroll);
      widget.scrollController?.addListener(_onScroll);
    }
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final scrolled =
        (widget.scrollController?.hasClients ?? false) &&
        widget.scrollController!.offset > 4;
    if (scrolled != _scrolled) setState(() => _scrolled = scrolled);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final canPop = GoRouter.of(context).canPop();
    final showDivider = widget.alwaysShowDivider || _scrolled;

    final leading =
        widget.leading ??
        (widget.showBack && (canPop || widget.onBack != null)
            ? AppBackButton(
                onPressed: widget.onBack,
                useCloseIcon: widget.useCloseIcon,
              )
            : const SizedBox(width: AppSizes.circleButton));

    final bar = SafeArea(
      bottom: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: AppSizes.appBarHeight + 8,
            child: Padding(
              padding: AppInsets.page,
              child: NavigationToolbar(
                leading: leading,
                middle:
                    widget.titleWidget ??
                    (widget.title == null
                        ? null
                        : Text(
                            widget.title!,
                            style: AppTypography.labelLarge,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                trailing: widget.actions.isEmpty
                    ? const SizedBox(width: AppSizes.circleButton)
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (var i = 0; i < widget.actions.length; i++) ...[
                            if (i > 0) const SizedBox(width: AppSpacing.sm),
                            widget.actions[i],
                          ],
                        ],
                      ),
                middleSpacing: AppSpacing.md,
              ),
            ),
          ),
          ?widget.bottom,
        ],
      ),
    );

    final decorated = AnimatedContainer(
      duration: AppDurations.normal,
      decoration: BoxDecoration(
        color: widget.frosted
            ? Colors.transparent
            : widget.backgroundColor ?? colors.surface,
        boxShadow: showDivider ? AppShadows.hairline : AppShadows.none,
      ),
      child: bar,
    );

    if (!widget.frosted) return decorated;
    return Frosted(
      tint: colors.surface.withValues(alpha: _scrolled ? 0.86 : 0.0),
      sigma: _scrolled ? AppBlur.lg : 0,
      child: decorated,
    );
  }
}
