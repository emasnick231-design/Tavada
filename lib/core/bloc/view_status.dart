/// Generic async status used by screen states.
///
/// ```dart
/// @freezed
/// abstract class HomeState with _$HomeState {
///   const factory HomeState({
///     @Default(ViewStatus.initial) ViewStatus status,
///     HomeFeed? feed,
///     Failure? failure,
///   }) = _HomeState;
/// }
/// ```
enum ViewStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == ViewStatus.initial;
  bool get isLoading => this == ViewStatus.loading;
  bool get isSuccess => this == ViewStatus.success;
  bool get isFailure => this == ViewStatus.failure;

  /// True while nothing has been shown yet (initial or first load).
  bool get isBusy => isInitial || isLoading;
}

/// Status for one-shot form submissions (sign in, place order, …).
enum SubmitStatus {
  idle,
  submitting,
  success,
  failure;

  bool get isSubmitting => this == SubmitStatus.submitting;
  bool get isSuccess => this == SubmitStatus.success;
  bool get isFailure => this == SubmitStatus.failure;
}
