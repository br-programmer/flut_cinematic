import 'package:flut_cinematic/features/features.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchMoviesScreen extends HookConsumerWidget {
  const SearchMoviesScreen._();

  static Widget builder(BuildContext _, GoRouterState __) {
    return const SearchMoviesScreen._();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FlutCinematicBaseScreen(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FlutCinematicSearchTextField(
            hintText: 'Search movies'.hardCode,
            padding: edgeInsetsH20.add(edgeInsetsV12),
            duration: duration500ms,
            onChanged: ref.read(searchProvider.notifier).search,
          ),
          const FlutCinematicDivider(),
          gap12,
          switch (ref.watch(searchProvider)) {
            SearchResultState(movies: final movies) when movies.isEmpty =>
              SearchMovieWidget(text: 'No movie found'.hardCode),
            SearchResultState(movies: final movies) =>
              SearchMovieResult(movies: movies),
            SearchingState() => const SearchMovieResult(movies: []),
            _ => const SearchMovieWidget(),
          },
        ],
      ),
    );
  }
}
