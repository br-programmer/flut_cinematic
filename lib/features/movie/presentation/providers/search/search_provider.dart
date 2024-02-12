import 'package:flut_cinematic/core/core.dart';
import 'package:flut_cinematic_common/flut_cinematic_common.dart';
import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'search_provider.freezed.dart';
part 'search_state.dart';

final searchProvider =
    StateNotifierProvider.autoDispose<SearchProvider, SearchState>(
  (ref) => SearchProvider(
    const SearchState.initial(),
    movieRepository: ref.read(Repositories.movie),
  ),
);

class SearchProvider extends StateNotifier<SearchState> {
  SearchProvider(
    super.state, {
    required IMovieRepository movieRepository,
  }) : _movieRepository = movieRepository;
  final IMovieRepository _movieRepository;

  Future<void> search(String query) async {
    if (query.isEmpty) {
      state = const SearchState.initial();
    } else {
      state = const SearchState.searching();
      final request = MovieRequest(query: query, includeAdult: true);
      final result = await _movieRepository.search(request: request);
      state = switch (result) {
        Right(value: final moviesResponse) => SearchState.result(
            movies: moviesResponse.movies,
          ),
        Left(value: final failure) => SearchState.error(failure: failure),
      };
    }
  }
}
