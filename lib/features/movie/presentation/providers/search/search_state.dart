part of 'search_provider.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _SearchInitialState;
  const factory SearchState.searching() = SearchingState;
  const factory SearchState.result({
    @Default([]) List<Movie> movies,
  }) = SearchResultState;
  const factory SearchState.error({
    required HttpRequestFailure failure,
  }) = SearchErrorState;
}
