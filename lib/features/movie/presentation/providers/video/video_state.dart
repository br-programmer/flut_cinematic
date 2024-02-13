part of 'video_provider.dart';

@freezed
class VideoState with _$VideoState {
  factory VideoState.loading() = _LoadingVideoState;
  factory VideoState.loaded({required List<Video> videos}) = LoadedVideoState;
  factory VideoState.error({required HttpRequestFailure failure}) =
      _ErrorVideoState;
}
