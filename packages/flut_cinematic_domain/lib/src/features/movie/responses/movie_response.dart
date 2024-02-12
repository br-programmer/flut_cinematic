import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_response.freezed.dart';
part 'movie_response.g.dart';

@freezed
class MovieResponse with _$MovieResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory MovieResponse({
    required int page,
    required int totalPages,
    required int totalResults,
    @JsonKey(name: 'results') required List<Movie> movies,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}
