import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';
part 'video.g.dart';

@freezed
class Video with _$Video {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Video({
    required String name,
    required String key,
    required int size,
    required String site,
    required String id,
    required DateTime publishedAt,
  }) = _Video;

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}
