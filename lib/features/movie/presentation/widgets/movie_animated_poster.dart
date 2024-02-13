import 'package:flut_cinematic/features/features.dart';
import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MovieAnimatedPoster extends StatefulHookConsumerWidget {
  const MovieAnimatedPoster({super.key, required this.movie});
  final Movie movie;

  @override
  ConsumerState<MovieAnimatedPoster> createState() =>
      _MovieAnimatedPosterState();
}

class _MovieAnimatedPosterState extends ConsumerState<MovieAnimatedPoster> {
  var percent = .5;
  var expanded = true;

  void onTap() {
    if (expanded) {
      percent = .2;
    } else {
      percent = .5;
    }
    setState(() => expanded = !expanded);
  }

  @override
  Widget build(BuildContext context) {
    final movie = ref.watch(movieProvider(widget.movie));
    return AnimatedContainer(
      height: context.mediaQuery.size.height * percent,
      width: double.infinity,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubicEmphasized,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Hero(
              tag: movie.tag,
              child: FlutCinematicImage(
                onTap: onTap,
                fit: BoxFit.fitWidth,
                imageUrl: movie.poster,
                borderRadius: borderRadius12,
              ),
            ),
          ),
          WatchTrailerButton(movieId: movie.id),
        ],
      ),
    );
  }
}
