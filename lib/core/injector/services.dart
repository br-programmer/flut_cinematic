import 'package:flut_cinematic_firebase/flut_cinematic_firebase.dart';
import 'package:riverpod/riverpod.dart';

class Services {
  const Services._();

  static final auth = Provider<FlutCinematicAuthService>(
    (ref) => FlutCinematicAuthService(),
  );
}
