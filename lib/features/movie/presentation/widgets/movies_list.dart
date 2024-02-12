import 'package:flut_cinematic/features/features.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MovieList extends HookConsumerWidget {
  const MovieList({super.key, required this.type});
  final MovieType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (ref.watch(movies(type))) {
      MoviesLoadedState(movies: final movies) => MoviesLoadedWidget(
          movies: movies,
          type: type,
        ),
      _ => const MoviesLoadingWidget(),
    };
  }
}
