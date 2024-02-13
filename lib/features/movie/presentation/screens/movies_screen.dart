import 'package:flut_cinematic/i18n/translations.g.dart';
import 'package:flut_cinematic/lib.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MoviesScreen extends ConsumerStatefulWidget {
  const MoviesScreen._();

  static Widget builder(BuildContext _, GoRouterState __) {
    return const MoviesScreen._();
  }

  @override
  ConsumerState<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends ConsumerState<MoviesScreen> {
  late final ScrollController scrollController = ScrollController()
    ..addListener(listener);

  void listener() {
    final offsetPosition = scrollController.offset + 75 >=
        scrollController.position.maxScrollExtent;
    final outOfRange = scrollController.position.outOfRange;
    final loadingMore = switch (movies(MovieType.popular)) {
      final MoviesLoadedState state => state.loadingMore,
      _ => false,
    };
    if (offsetPosition && !outOfRange && !loadingMore) {
      ref.read(movies(MovieType.upcoming).notifier).loadMovies();
    }
  }

  Future<void> onRefresh() {
    ref.read(movies(MovieType.nowPlaying).notifier).loadMovies(refresh: true);
    ref.read(movies(MovieType.upcoming).notifier).loadMovies(refresh: true);
    ref.read(movies(MovieType.popular).notifier).loadMovies(refresh: true);
    return Future<void>.value();
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(listener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutCinematicBaseScreen(
      appBar: FlutCinematicAppBar(
        title: '${texts.movie.moviesFor}\n',
        subTitle: texts.movie.today,
        onArrowDown: () {},
        actions: [
          FlutCinematicIconButton(
            onPressed: () => context.pushNamed(Routes.search.name),
            iconData: FlutCinematicIcons.search,
          ),
          switch (ref.watch(authProvider)) {
            Authenticated() => Row(
                children: [
                  space16,
                  FlutCinematicIconButton(
                    onPressed: ref.read(authProvider.notifier).logout,
                    icon: const Icon(
                      Icons.logout,
                      color: Palette.white,
                    ),
                  ),
                ],
              ),
            _ => const SizedBox.shrink(),
          },
        ],
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: CustomScrollView(
          controller: scrollController,
          physics: switch (movies(MovieType.nowPlaying)) {
            MoviesLoadedState() => const NeverScrollableScrollPhysics(),
            _ => const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
          },
          slivers: [
            FlutCinematicStickyHeader(
              headerText: MovieType.nowPlaying.title,
              body: const MovieList(type: MovieType.nowPlaying),
            ),
            FlutCinematicStickyHeader(
              headerText: MovieType.popular.title,
              body: const MovieList(type: MovieType.popular),
            ),
            FlutCinematicStickyHeader(
              headerText: MovieType.upcoming.title,
              body: const MovieList(type: MovieType.upcoming),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MoviesBottomBar(),
    );
  }
}
