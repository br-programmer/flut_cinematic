import 'dart:async';

import 'package:flut_cinematic/lib.dart';
import 'package:flut_cinematic_common/flut_cinematic_common.dart';
import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'auth_provider.freezed.dart';
part 'auth_state.dart';

final authProvider = StateNotifierProvider<AuthProvider, AuthState>(
  (ref) => AuthProvider(
    const AuthState.unauthenticated(),
    authRepository: ref.read(Repositories.auth),
  )..init(),
);

class AuthProvider extends StateNotifier<AuthState> {
  AuthProvider(
    super.state, {
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  final IAuthRepository _authRepository;
  StreamSubscription<User>? _subscription;

  void init() {
    _subscription = _authRepository.onUserChanged.listen(_listen);
  }

  Future<void> login(String email, String password) async {
    state = const AuthState.authenticationInProgress();
    final result = await _authRepository.login(email, password);
    state = switch (result) {
      Right() => state,
      Left(value: final failure) => AuthState.authenticationFailed(
          failure: failure,
        ),
    };
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _authRepository.dispose();
    super.dispose();
  }

  void _listen(User user) {
    state = AuthState.authenticated(user: user);
  }

  Future<void> logout() async {
    await _authRepository.logout();
    state = const AuthState.unauthenticated();
  }
}
