part of 'movies_provider.dart';

@freezed
class MoviesState with _$MoviesState {
  const factory MoviesState.loading() = _MoviesLoadingState;
  const factory MoviesState.loaded({
    @Default([]) List<Movie> movies,
    @Default(false) bool loadingMore,
    required MovieRequest movieRequest,
  }) = MoviesLoadedState;
  const factory MoviesState.error({
    required HttpRequestFailure failure,
  }) = MoviesErrorState;
}
