import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tavada_eats/core/models/delivery_address.dart';
import 'package:tavada_eats/core/models/user_profile.dart';
import 'package:tavada_eats/core/storage/secure_storage.dart';

part 'session_cubit.freezed.dart';
part 'session_cubit.g.dart';

/// App-wide session: who is using the app and where we deliver to.
///
/// Persisted with HydratedBloc, observed by the router for redirects.
@freezed
abstract class SessionState with _$SessionState {
  const factory SessionState({
    /// Set once the user passed the welcome screen (signed in or as guest).
    @Default(false) bool hasCompletedWelcome,

    /// Signed-in customer; `null` means guest.
    UserProfile? user,

    /// Current delivery address chosen in onboarding/home/checkout.
    DeliveryAddress? address,
  }) = _SessionState;

  const SessionState._();

  factory SessionState.fromJson(Map<String, dynamic> json) =>
      _$SessionStateFromJson(json);

  bool get isAuthenticated => user != null;
  bool get isGuest => user == null;
  bool get needsAddress => address == null;
}

class SessionCubit extends HydratedCubit<SessionState> {
  SessionCubit(this._secureStorage) : super(const SessionState());

  final SecureStorage _secureStorage;

  /// "Continue as guest" on the welcome screen. Only lasts for this launch:
  /// see [fromJson].
  void continueAsGuest() => emit(state.copyWith(hasCompletedWelcome: true));

  /// Called by the auth feature after a successful sign in / sign up.
  Future<void> signIn({
    required UserProfile user,
    required String accessToken,
    String? refreshToken,
  }) async {
    await _secureStorage.writeTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    emit(state.copyWith(user: user, hasCompletedWelcome: true));
  }

  void updateUser(UserProfile user) => emit(state.copyWith(user: user));

  void setAddress(DeliveryAddress address) =>
      emit(state.copyWith(address: address));

  /// Clears credentials and returns the user to the welcome screen. The
  /// delivery address is kept so browsing keeps working after sign out.
  Future<void> signOut() async {
    await _secureStorage.clear();
    emit(state.copyWith(user: null, hasCompletedWelcome: false));
  }

  @override
  SessionState? fromJson(Map<String, dynamic> json) {
    final restored = SessionState.fromJson(json);
    // Anyone without an account starts every launch on the welcome screen
    // (sign up / log in / continue as guest); only signed-in customers go
    // straight to the app. The delivery address is kept either way.
    return restored.isGuest
        ? restored.copyWith(hasCompletedWelcome: false)
        : restored;
  }

  @override
  Map<String, dynamic>? toJson(SessionState state) => state.toJson();
}
