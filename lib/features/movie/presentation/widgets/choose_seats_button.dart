import 'package:flut_cinematic/i18n/translations.g.dart';
import 'package:flut_cinematic/lib.dart';
import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChooseSeatsButton extends HookConsumerWidget {
  const ChooseSeatsButton({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketState = ref.watch(ticketProvider);
    final authState = ref.watch(authProvider);
    final enable = ticketState.date != null && ticketState.time != null;
    final ticketNotifier = ref.read(ticketProvider.notifier);
    return DecoratedBox(
      decoration: BoxDecoration(color: context.theme.scaffoldBackgroundColor),
      child: Padding(
        padding: edgeInsets20,
        child: SafeArea(
          child: FlutCinematicPrimaryButton(
            text: texts.seat.chooseSeats,
            onPressed: enable
                ? switch (authState) {
                    Unauthenticated() => () => context.pushNamed(
                          Routes.auth.name,
                        ),
                    _ => () {
                        ticketNotifier.movieName(movie.title);
                        context.pushNamed(
                          Routes.seat.name,
                          extra: {'movie': movie},
                        );
                      }
                  }
                : null,
          ),
        ),
      ),
    );
  }
}
