import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Movie({
    required double voteAverage,
    required int voteCount,
    required String title,
    required double popularity,
    required String overview,
    required String originalTitle,
    required int id,
    String? posterPath,
    @JsonKey(fromJson: _releaseDateFromJson) DateTime? releaseDate,
    String? backdropPath,
    String? tagline,
    int? budget,
    @Default(false) bool adult,
    @Default([]) List<Gender> genres,
    int? runtime,
    @Default('') String tag,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

DateTime? _releaseDateFromJson(String value) {
  if (value.isNotEmpty) {
    return DateTime.parse(value);
  }
  return null;
}
