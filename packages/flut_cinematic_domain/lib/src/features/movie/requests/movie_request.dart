import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_request.freezed.dart';
part 'movie_request.g.dart';

@freezed
class MovieRequest with _$MovieRequest {
  @JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
  factory MovieRequest({
    @Default(1) int page,
    String? query,
    bool? includeAdult,
  }) = _MovieRequest;

  factory MovieRequest.fromJson(Map<String, dynamic> json) =>
      _$MovieRequestFromJson(json);
}
