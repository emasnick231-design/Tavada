import 'dart:async';
import 'dart:ui' show ImageFilter;

import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';

/// Shows a design-system bottom sheet over a blurred, dimmed backdrop.
///
/// * [title] renders the header: grey band with the drag handle and a
///   SemiBold 16 title (pickers/lists), or with [plainHeader] the white
///   18pt header over a 4pt grey band and no handle (info & form sheets).
/// * [expand] makes the sheet take ~92% of the screen (lists, pickers).
/// * The sheet lifts above the keyboard automatically.
Future<T?> showAppBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  String? title,
  Widget? headerTrailing,
  Widget? headerIllustration,
  bool showHandle = true,
  bool plainHeader = false,
  bool isDismissible = true,
  bool enableDrag = true,
  bool expand = false,
  bool useRootNavigator = true,
  Color? backgroundColor,
}) {
  final navigator = Navigator.of(context, rootNavigator: useRootNavigator);
  return navigator.push(
    _BlurredSheetRoute<T>(
      capturedThemes: InheritedTheme.capture(
        from: context,
        to: navigator.context,
      ),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      scrim: context.colors.scrim,
      builder: (sheetContext) => AppSheet(
        title: title,
        headerTrailing: headerTrailing,
        headerIllustration: headerIllustration,
        showHandle: showHandle && !plainHeader,
        plainHeader: plainHeader,
        expand: expand,
        backgroundColor: backgroundColor,
        child: builder(sheetContext),
      ),
    ),
  );
}

class _BlurredSheetRoute<T> extends ModalBottomSheetRoute<T> {
  _BlurredSheetRoute({
    required super.builder,
    required super.capturedThemes,
    required super.barrierLabel,
    required super.isDismissible,
    required super.enableDrag,
    required this.scrim,
  }) : super(
         isScrollControlled: true,
         backgroundColor: Colors.transparent,
         elevation: 0,
         modalBarrierColor: Colors.transparent,
         sheetAnimationStyle: const AnimationStyle(
           duration: AppDurations.slow,
           reverseDuration: AppDurations.normal,
         ),
       );

  final Color scrim;

  @override
  Widget buildModalBarrier() {
    return AnimatedBuilder(
      animation: animation!,
      builder: (context, _) {
        final t = Curves.easeOut.transform(animation!.value);
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: AppBlur.sm * t,
            sigmaY: AppBlur.sm * t,
          ),
          child: ModalBarrier(
            color: scrim.withValues(alpha: scrim.a * t),
            dismissible: isDismissible,
            semanticsLabel: barrierLabel,
            onDismiss: () {
              if (isDismissible) unawaited(Navigator.of(context).maybePop());
            },
          ),
        );
      },
    );
  }
}

/// Sheet chrome: rounded top, drag handle, optional bold title + divider.
/// Exposed so feature code can build custom sheets with the same look.
class AppSheet extends StatelessWidget {
  const AppSheet({
    required this.child,
    super.key,
    this.title,
    this.headerTrailing,
    this.headerIllustration,
    this.showHandle = true,
    this.plainHeader = false,
    this.expand = false,
    this.backgroundColor,
  });

  final Widget child;
  final String? title;
  final Widget? headerTrailing;

  /// Decorative widget overlapping the header (e.g. the gift illustration).
  final Widget? headerIllustration;
  final bool showHandle;

  /// White header without handle, separated by a 4pt grey band (Figma
  /// "Allergy & Dietary Info", "Delivery instructions").
  final bool plainHeader;
  final bool expand;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final media = MediaQuery.of(context);
    final maxHeight = media.size.height - media.viewPadding.top - 24;

    final handle = Padding(
      padding: const EdgeInsets.only(top: AppSpacing.lg),
      child: Center(
        child: Container(
          width: AppSizes.dragHandleWidth,
          height: AppSizes.dragHandleHeight,
          decoration: BoxDecoration(
            color: colors.borderStrong,
            borderRadius: AppRadii.pillAll,
          ),
        ),
      ),
    );

    final header = title == null
        ? null
        : Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                color: plainHeader ? null : colors.surfaceMuted,
                padding: plainHeader
                    ? const EdgeInsets.symmetric(
                        horizontal: AppSpacing.gutter,
                        vertical: 19,
                      )
                    : EdgeInsets.fromLTRB(
                        AppSpacing.xl,
                        showHandle ? 0 : AppSpacing.xl,
                        AppSpacing.xl,
                        AppSpacing.lg,
                      ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (showHandle) ...[
                      handle,
                      const SizedBox(height: AppSpacing.xxl),
                    ],
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title!,
                            // Figma: 16 SemiBold under a handle, 18
                            // SemiBold on handle-less sheets.
                            style: showHandle
                                ? AppTypography.titleMedium
                                : AppTypography.headlineSmall.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                          ),
                        ),
                        ?headerTrailing,
                      ],
                    ),
                  ],
                ),
              ),
              if (headerIllustration != null)
                Positioned(
                  right: AppSpacing.xl,
                  bottom: 0,
                  child: headerIllustration!,
                ),
            ],
          );

    final body = Column(
      mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (showHandle && header == null)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: handle,
          ),
        if (header != null) ...[
          header,
          if (plainHeader)
            Container(height: AppSpacing.xs, color: colors.surfaceMuted)
          else
            Divider(color: colors.divider),
        ],
        if (expand) Expanded(child: child) else Flexible(child: child),
        SizedBox(
          height: media.viewPadding.bottom > 0
              ? media.viewPadding.bottom
              : AppSpacing.lg,
        ),
      ],
    );

    return Padding(
      padding: EdgeInsets.only(bottom: media.viewInsets.bottom),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: SizedBox(
          height: expand ? maxHeight * 0.92 : null,
          child: Material(
            color: backgroundColor ?? colors.surface,
            borderRadius: AppRadii.sheetTop,
            clipBehavior: Clip.antiAlias,
            child: body,
          ),
        ),
      ),
    );
  }
}
