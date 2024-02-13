import 'package:flut_cinematic/features/features.dart';
import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MovieDetailCard extends HookConsumerWidget {
  const MovieDetailCard({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movie = ref.watch(movieProvider(this.movie));
    return FlutCinematicCustomCard(
      borderColor: Palette.transparent,
      backgroundColor: Palette.grey,
      padding: edgeInsets16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieGendersDurationAndAdult(
            adult: movie.adult,
            genres: movie.genres,
            runtime: movie.runtime,
          ),
          gap12,
          Text(
            movie.title,
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: AppFontWeight.semiBold,
            ),
          ),
          gap4,
          Text(
            movie.overview,
            style: context.textTheme.bodyMedium?.copyWith(
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
