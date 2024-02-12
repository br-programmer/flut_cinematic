import 'package:flut_cinematic/lib.dart';
import 'package:flut_cinematic_common/flut_cinematic_common.dart';
import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';
import 'package:riverpod/riverpod.dart';

final movieProvider = StateNotifierProviderFamily<MovieProvider, Movie, Movie>(
  (ref, arg) => MovieProvider(
    arg,
    movieRepository: ref.read(Repositories.movie),
  )..loadMovie(),
);

class MovieProvider extends StateNotifier<Movie> {
  MovieProvider(
    super.state, {
    required IMovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  final IMovieRepository _movieRepository;

  Future<void> loadMovie() async {
    final result = await _movieRepository.movie(movieId: state.id);
    state = switch (result) {
      Right(value: final movie) => movie.copyWith(tag: state.tag),
      Left() => state,
    };
  }
}
