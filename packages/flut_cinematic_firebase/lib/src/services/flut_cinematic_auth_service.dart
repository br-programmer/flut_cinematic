import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flut_cinematic_common/flut_cinematic_common.dart';
import 'package:flut_cinematic_domain/flut_cinematic_domain.dart' as domain;

class FlutCinematicAuthService {
  FlutCinematicAuthService() {
    _auth = FirebaseAuth.instance;
  }

  late final FirebaseAuth _auth;

  StreamController<domain.User>? _streamController;

  StreamSubscription<User?>? _streamSubscription;

  void init() {
    _streamSubscription = _auth.authStateChanges().listen(_addToController);
  }

  FutureHttpRequest<domain.User> login(String email, String password) async {
    try {
      final credentials = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final currentUser = credentials.user;
      if (currentUser != null) {
        final user = domain.User(
          uid: currentUser.uid,
          phoneNumber: currentUser.phoneNumber,
          displayName: currentUser.displayName,
          photoURL: currentUser.photoURL,
          email: currentUser.email,
        );
        return Either.right(user);
      }
      return Either.left(HttpRequestFailure.unauthorized());
    } catch (_) {
      return Either.left(HttpRequestFailure.unauthorized());
    }
  }

  Stream<domain.User> get onUserChanged {
    _streamController ??= StreamController();
    return _streamController!.stream;
  }

  Future<void> logout() => _auth.signOut();

  void dispose() {
    _streamController?.close();
    _streamSubscription?.cancel();
  }

  void _addToController(User? currentUser) {
    if (_streamController != null &&
        _streamController!.hasListener &&
        currentUser != null) {
      final user = domain.User(
        uid: currentUser.uid,
        phoneNumber: currentUser.phoneNumber,
        displayName: currentUser.displayName,
        photoURL: currentUser.photoURL,
        email: currentUser.email,
      );
      _streamController!.sink.add(user);
    }
  }
}
