import 'package:flut_cinematic_api_client/flut_cinematic_api_client.dart';
import 'package:flut_cinematic_common/flut_cinematic_common.dart';
import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';

class MovieRepository implements IMovieRepository {
  MovieRepository({required Http http}) : _http = http;

  final Http _http;

  @override
  FutureHttpRequest<MovieResponse> nowPlaying({required MovieRequest request}) {
    return performHttpRequest(
      _http.send(
        APIPaths.nowPlaying,
        queryParameters: request.toJson(),
        parser: (_, json) => MovieResponse.fromJson(json as Json),
      ),
    );
  }

  @override
  FutureHttpRequest<MovieResponse> popular({required MovieRequest request}) {
    return performHttpRequest(
      _http.send(
        APIPaths.popular,
        queryParameters: request.toJson(),
        parser: (_, json) => MovieResponse.fromJson(json as Json),
      ),
    );
  }

  @override
  FutureHttpRequest<MovieResponse> upcoming({required MovieRequest request}) {
    return performHttpRequest(
      _http.send(
        APIPaths.upcoming,
        queryParameters: request.toJson(),
        parser: (_, json) => MovieResponse.fromJson(json as Json),
      ),
    );
  }

  @override
  FutureHttpRequest<MovieResponse> search({required MovieRequest request}) {
    return performHttpRequest(
      _http.send(
        APIPaths.search,
        queryParameters: request.toJson(),
        parser: (_, json) => MovieResponse.fromJson(json as Json),
        cancel: true,
      ),
    );
  }

  @override
  FutureHttpRequest<VideoResponse> videos({required int movieId}) {
    return performHttpRequest(
      _http.send(
        APIPaths.videos(movieId),
        parser: (_, json) => VideoResponse.fromJson(json as Json),
      ),
    );
  }

  @override
  FutureHttpRequest<Movie> movie({required int movieId}) {
    return performHttpRequest(
      _http.send(
        APIPaths.movie(movieId),
        parser: (_, json) => Movie.fromJson(json as Json),
      ),
    );
  }
}
