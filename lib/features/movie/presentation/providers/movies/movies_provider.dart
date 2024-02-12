import 'package:flut_cinematic/lib.dart';
import 'package:flut_cinematic_common/flut_cinematic_common.dart';
import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'movies_provider.freezed.dart';
part 'movies_state.dart';

final movies =
    StateNotifierProviderFamily<MoviesProvider, MoviesState, MovieType>(
  (ref, type) => MoviesProvider(
    const MoviesState.loading(),
    movieRepository: ref.read(Repositories.movie),
    type: type,
  )..loadMovies(),
);

class MoviesProvider extends StateNotifier<MoviesState> {
  MoviesProvider(
    super.state, {
    required IMovieRepository movieRepository,
    required MovieType type,
  })  : _movieRepository = movieRepository,
        _type = type;

  final IMovieRepository _movieRepository;
  final MovieType _type;

  MoviesState _loadingState(bool refresh) {
    if (refresh) {
      return const MoviesState.loading();
    }
    return switch (state) {
      final MoviesLoadedState state => state.copyWith(loadingMore: true),
      _ => const MoviesState.loading(),
    };
  }

  MoviesState _fromSucces(MovieResponse movieResponse) {
    final movieRequest = MovieRequest(page: movieResponse.page + 1);
    return switch (state) {
      final MoviesLoadedState state => state.copyWith(
          movies: [...state.movies, ...movieResponse.movies],
          loadingMore: false,
          movieRequest: movieRequest,
        ),
      _ => MoviesState.loaded(
          movies: movieResponse.movies,
          movieRequest: movieRequest,
        ),
    };
  }

  MoviesState _fromError(HttpRequestFailure failure) {
    return switch (state) {
      final MoviesLoadedState state => state.copyWith(loadingMore: false),
      _ => MoviesState.error(failure: failure),
    };
  }

  MovieRequest get _movieRequest => switch (state) {
        final MoviesLoadedState state => state.movieRequest,
        _ => MovieRequest(),
      };
  Future<void> loadMovies({bool refresh = false}) async {
    state = _loadingState(refresh);
    final result = await _movies(_movieRequest);
    state = switch (result) {
      Right(value: final movieResponse) => _fromSucces(movieResponse),
      Left(value: final failure) => _fromError(failure),
    };
  }

  FutureHttpRequest<MovieResponse> _movies(MovieRequest request) {
    switch (_type) {
      case MovieType.nowPlaying:
        return _movieRepository.nowPlaying(request: request);
      case MovieType.popular:
        return _movieRepository.popular(request: request);
      case MovieType.upcoming:
        return _movieRepository.upcoming(request: request);
    }
  }
}
