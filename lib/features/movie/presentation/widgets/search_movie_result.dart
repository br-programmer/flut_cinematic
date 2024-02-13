import 'package:flut_cinematic/i18n/translations.g.dart';
import 'package:flut_cinematic/lib.dart';
import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchMovieResult extends StatelessWidget {
  const SearchMovieResult({super.key, required this.movies});
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: edgeInsetsH20,
            child: Text(
              texts.movie.inPremiere,
              style: context.textTheme.bodyLarge,
            ),
          ),
          gap8,
          Expanded(
            child: Builder(
              builder: (_) {
                if (movies.isEmpty) {
                  return ListView.separated(
                    itemBuilder: (_, index) => const _SearchingMovieItem(),
                    separatorBuilder: (_, __) => const FlutCinematicDivider(),
                    itemCount: 5,
                  );
                }
                return ListView.separated(
                  itemBuilder: (_, index) =>
                      _SearchMovieItem(movie: movies[index]),
                  separatorBuilder: (_, __) => const FlutCinematicDivider(),
                  itemCount: movies.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchMovieItem extends HookConsumerWidget {
  const _SearchMovieItem({required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tag = '${this.movie.id}-search';
    final movie = ref.watch(movieProvider(this.movie.copyWith(tag: tag)));
    return InkWell(
      onTap: () => context.pushNamed(
        Routes.movie.name,
        pathParameters: {'id': movie.id.toString()},
        extra: {'movie': movie},
      ),
      child: AbsorbPointer(
        child: Padding(
          padding: edgeInsetsH20.add(edgeInsetsV12),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: AspectRatio(
                  aspectRatio: .8,
                  child: Hero(
                    tag: movie.tag,
                    child: FlutCinematicImage(
                      imageUrl: movie.poster,
                      borderRadius: borderRadius8,
                    ),
                  ),
                ),
              ),
              space12,
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MovieGendersDurationAndAdult(
                      genres: movie.genres,
                      runtime: movie.runtime,
                    ),
                    gap8,
                    Text(
                      movie.title,
                      style: context.textTheme.bodyLarge,
                    ),
                    gap4,
                    Text(
                      movie.overview,
                      style: context.textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchingMovieItem extends StatelessWidget {
  const _SearchingMovieItem();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsetsH20.add(edgeInsetsV12),
      child: Row(
        children: [
          const Expanded(
            flex: 2,
            child: AspectRatio(
              aspectRatio: .8,
              child: ClipRRect(
                borderRadius: borderRadius12,
                child: FlutCinematicBaseShimmer(
                  child: ColoredBox(color: Palette.dark),
                ),
              ),
            ),
          ),
          space12,
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieGendersDurationAndAdult(
                  firstColor: Palette.grey,
                  secondColor: Palette.grey.withOpacity(.9),
                ),
                gap8,
                FlutCinematicBaseShimmer(
                  child: ColoredBox(
                    color: Palette.dark,
                    child: Text(
                      '                       ',
                      style: context.textTheme.bodyLarge,
                    ),
                  ),
                ),
                gap4,
                FlutCinematicBaseShimmer(
                  child: ColoredBox(
                    color: Palette.dark,
                    child: Text(
                      '                                                 ',
                      style: context.textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
