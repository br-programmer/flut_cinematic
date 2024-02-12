import 'package:flut_cinematic_common/flut_cinematic_common.dart';
import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';

abstract interface class IMovieRepository {
  FutureHttpRequest<MovieResponse> nowPlaying({required MovieRequest request});
  FutureHttpRequest<MovieResponse> popular({required MovieRequest request});
  FutureHttpRequest<MovieResponse> upcoming({required MovieRequest request});
  FutureHttpRequest<MovieResponse> search({required MovieRequest request});
  FutureHttpRequest<VideoResponse> videos({required int movieId});
  FutureHttpRequest<Movie> movie({required int movieId});
}
