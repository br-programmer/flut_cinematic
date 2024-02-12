part of 'auth_provider.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.authenticated({required User user}) = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.authenticationInProgress() = AuthenticationInProgress;
  const factory AuthState.authenticationFailed({
    required HttpRequestFailure failure,
  }) = AuthenticationFailed;
}
