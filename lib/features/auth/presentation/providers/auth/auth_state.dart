part of 'auth_provider.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.authenticated() = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.authenticationInProgress() = AuthenticationInProgress;
  const factory AuthState.authenticationFailed() = AuthenticationFailed;
}
