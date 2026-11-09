import 'package:animations/animations.dart';
import 'package:cupertino_ui/cupertino_ui.dart' show CupertinoPage;
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/theme/tokens/tokens.dart';

/// Page transitions used by the router.
///
/// * [adaptive] — default for pushed screens: native Cupertino slide with
///   swipe-back on iOS, Material shared-axis on Android.
/// * [modal] — screens that feel like sheets (product details, checkout
///   extras): slide up + fade.
/// * [fadeThrough] — sibling content swaps (tabs, step changes).
/// * [scale] — celebratory/standalone moments (order placed, splash exit).
/// * [fade] — quiet cross-fades (splash → welcome).
abstract final class AppTransitions {
  static Page<T> adaptive<T>(GoRouterState state, Widget child) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPage<T>(
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
        child: child,
      );
    }
    return sharedAxis<T>(state, child);
  }

  static Page<T> sharedAxis<T>(
    GoRouterState state,
    Widget child, {
    SharedAxisTransitionType type = SharedAxisTransitionType.horizontal,
  }) => CustomTransitionPage<T>(
    key: state.pageKey,
    name: state.name,
    arguments: state.extra,
    child: child,
    transitionDuration: AppDurations.page,
    reverseTransitionDuration: AppDurations.pageReverse,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: type,
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          child: child,
        ),
  );

  static Page<T> fadeThrough<T>(GoRouterState state, Widget child) =>
      CustomTransitionPage<T>(
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
        child: child,
        transitionDuration: AppDurations.page,
        reverseTransitionDuration: AppDurations.pageReverse,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              child: child,
            ),
      );

  static Page<T> modal<T>(GoRouterState state, Widget child) =>
      CustomTransitionPage<T>(
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
        child: child,
        fullscreenDialog: true,
        transitionDuration: AppDurations.slow,
        reverseTransitionDuration: AppDurations.normal,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curved = CurvedAnimation(
            parent: animation,
            curve: AppCurves.emphasized,
            reverseCurve: AppCurves.accelerate,
          );
          return SlideTransition(
            position: Tween(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(curved),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.6, end: 1).animate(curved),
              child: child,
            ),
          );
        },
      );

  static Page<T> scale<T>(GoRouterState state, Widget child) =>
      CustomTransitionPage<T>(
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
        child: child,
        transitionDuration: AppDurations.slow,
        reverseTransitionDuration: AppDurations.normal,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curved = CurvedAnimation(
            parent: animation,
            curve: AppCurves.emphasized,
          );
          return FadeTransition(
            opacity: curved,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.92, end: 1).animate(curved),
              child: child,
            ),
          );
        },
      );

  static Page<T> fade<T>(GoRouterState state, Widget child) =>
      CustomTransitionPage<T>(
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
        child: child,
        transitionDuration: AppDurations.slow,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      );

  static Page<T> none<T>(GoRouterState state, Widget child) =>
      NoTransitionPage<T>(
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
        child: child,
      );
}
