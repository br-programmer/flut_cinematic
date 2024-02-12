import 'package:flut_cinematic_common/flut_cinematic_common.dart';
import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';

abstract interface class IAuthRepository {
  void init();
  Stream<User> get onUserChanged;
  FutureHttpRequest<User> login(String email, String password);
  Future<void> logout();
  void dispose();
}
