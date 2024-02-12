import 'package:flut_cinematic/lib.dart';
import 'package:flut_cinematic_data/flut_cinematic_data.dart';
import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';
import 'package:riverpod/riverpod.dart';

class Repositories {
  const Repositories._();

  static final movie = Provider<IMovieRepository>(
    (ref) => MovieRepository(
      http: ref.read(Providers.flutCinematicApi),
    ),
  );

  static final auth = Provider<IAuthRepository>(
    (ref) => AuthRepository(authService: ref.read(Services.auth))..init(),
  );
}
