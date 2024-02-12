import 'package:flut_cinematic/lib.dart';
import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviesLoadedWidget extends StatelessWidget {
  const MoviesLoadedWidget({
    super.key,
    required this.movies,
    required this.type,
  });

  final List<Movie> movies;
  final MovieType type;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: edgeInsetsH20,
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: .7,
        ),
        itemCount: movies.length,
        itemBuilder: (_, index) {
          final movie = movies[index].copyWith(
            tag: '${movies[index].id}-$type',
          );
          return Hero(
            tag: movie.tag,
            child: FlutCinematicImage(
              onTap: () => context.pushNamed(
                Routes.movie.name,
                pathParameters: {'id': movie.id.toString()},
                extra: {'movie': movie},
              ),
              imageUrl: movie.poster,
              borderRadius: borderRadius12,
            ),
          );
        },
      ),
    );
  }
}
