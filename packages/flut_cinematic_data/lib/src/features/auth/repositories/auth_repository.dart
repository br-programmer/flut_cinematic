import 'package:flut_cinematic_common/flut_cinematic_common.dart';
import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';
import 'package:flut_cinematic_firebase/flut_cinematic_firebase.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository({required FlutCinematicAuthService authService})
      : _authService = authService;

  final FlutCinematicAuthService _authService;

  @override
  void init() => _authService.init();

  @override
  Stream<User> get onUserChanged => _authService.onUserChanged;

  @override
  FutureHttpRequest<User> login(String email, String password) =>
      _authService.login(email, password);

  @override
  Future<void> logout() => _authService.logout();

  @override
  void dispose() => _authService.dispose();
}
