import 'package:flut_cinematic/features/features.dart';
import 'package:flut_cinematic/i18n/translations.g.dart';
import 'package:flut_cinematic_common/flut_cinematic_common.dart';
import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SeatScreen extends HookConsumerWidget {
  const SeatScreen._({required this.movie});
  final Movie movie;

  static Widget builder(
    BuildContext _,
    GoRouterState state,
  ) {
    final movie = (state.extra! as Json)['movie'] as Movie;
    return SeatScreen._(movie: movie);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FlutCinematicBaseScreen(
      appBar: FlutCinematicAppBar(
        title: '${texts.misc.dubbedStandar}\n',
        subTitle: movie.title,
        onBack: context.pop,
        button: const DateTimeAndRoomSelected(),
      ),
      body: Padding(
        padding: edgeInsetsT16,
        child: Column(
          children: [
            ScreenPreview(movie: movie),
            gap32,
            const SeatLayoutWidget(),
          ],
        ),
      ),
      bottomNavigationBar: const BookTicketsAndSeatStatusInfo(),
    );
  }
}
