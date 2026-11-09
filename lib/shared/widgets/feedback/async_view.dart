import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/shared/widgets/feedback/error_state.dart';

/// Cross-fades between loading → content / empty / error for a [ViewStatus].
///
/// ```dart
/// AsyncView(
///   status: state.status,
///   failure: state.failure,
///   onRetry: () => bloc.add(const HomeRefreshed()),
///   isEmpty: state.items.isEmpty,
///   loading: const HomeSkeleton(),
///   empty: EmptyState(title: …),
///   builder: (context) => HomeContent(state.items),
/// )
/// ```
class AsyncView extends StatelessWidget {
  const AsyncView({
    required this.status,
    required this.builder,
    required this.loading,
    super.key,
    this.isEmpty = false,
    this.empty,
    this.failure,
    this.onRetry,
    this.keepContentOnReload = true,
    this.hasContent = false,
  });

  final ViewStatus status;
  final WidgetBuilder builder;
  final Widget loading;
  final bool isEmpty;
  final Widget? empty;
  final Failure? failure;
  final VoidCallback? onRetry;

  /// When reloading with data already on screen, keep showing it.
  final bool keepContentOnReload;
  final bool hasContent;

  @override
  Widget build(BuildContext context) {
    final Widget child;
    if (status.isLoading && keepContentOnReload && hasContent) {
      child = KeyedSubtree(
        key: const ValueKey('content'),
        child: builder(context),
      );
    } else {
      child = switch (status) {
        ViewStatus.initial || ViewStatus.loading => KeyedSubtree(
          key: const ValueKey('loading'),
          child: loading,
        ),
        ViewStatus.failure => KeyedSubtree(
          key: const ValueKey('failure'),
          child: ErrorStateView(failure: failure, onRetry: onRetry),
        ),
        ViewStatus.success when isEmpty && empty != null => KeyedSubtree(
          key: const ValueKey('empty'),
          child: empty!,
        ),
        ViewStatus.success => KeyedSubtree(
          key: const ValueKey('content'),
          child: builder(context),
        ),
      };
    }

    return AnimatedSwitcher(
      duration: AppDurations.normal,
      switchInCurve: AppCurves.standard,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween(
            begin: const Offset(0, 0.015),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
      layoutBuilder: (current, previous) => Stack(
        alignment: Alignment.topCenter,
        children: [...previous, ?current],
      ),
      child: child,
    );
  }
}
