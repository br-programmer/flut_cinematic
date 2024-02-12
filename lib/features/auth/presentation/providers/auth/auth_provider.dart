import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'auth_provider.freezed.dart';
part 'auth_state.dart';

final authProvider = StateNotifierProvider<AuthProvider, AuthState>(
  (ref) => AuthProvider(const AuthState.unauthenticated()),
);

class AuthProvider extends StateNotifier<AuthState> {
  AuthProvider(super.state);
}
