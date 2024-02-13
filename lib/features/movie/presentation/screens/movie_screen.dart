import 'package:flut_cinematic/i18n/translations.g.dart';
import 'package:flut_cinematic/lib.dart';
import 'package:flut_cinematic_common/flut_cinematic_common.dart';
import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen._({required this.movie});

  final Movie movie;

  static Widget builder(BuildContext _, GoRouterState state) {
    final movie = (state.extra! as Json)['movie'] as Movie;
    return MovieScreen._(movie: movie);
  }

  @override
  Widget build(BuildContext context) {
    return FlutCinematicBaseScreen(
      appBar: FlutCinematicAppBar(
        title: '${texts.misc.dubbedStandar}\n',
        subTitle: movie.title,
        onBack: context.pop,
        button: const DateSelector(),
      ),
      body: Padding(
        padding: edgeInsetsH20.add(edgeInsetsT12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MovieAnimatedPoster(movie: movie),
              gap8,
              MovieDetailCard(movie: movie),
              gap8,
              SelectCinemaAndHour(movie: movie),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ChooseSeatsButton(movie: movie),
    );
  }
}
