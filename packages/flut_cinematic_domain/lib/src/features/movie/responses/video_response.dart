import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_response.freezed.dart';
part 'video_response.g.dart';

@freezed
class VideoResponse with _$VideoResponse {
  factory VideoResponse({
    required int id,
    @JsonKey(name: 'results') required List<Video> videos,
  }) = _VideoResponse;

  factory VideoResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoResponseFromJson(json);
}
