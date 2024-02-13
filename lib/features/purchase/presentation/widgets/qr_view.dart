import 'package:flut_cinematic/i18n/translations.g.dart';
import 'package:flut_cinematic/lib.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrView extends HookConsumerWidget {
  const QrView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketState = ref.watch(ticketProvider);
    final name = '${ticketState.movieName}, ${texts.misc.dubbedStandar}\n';
    final date =
        '${texts.misc.date}: ${ticketState.date!.formatWithYear(LocaleSettings.currentLocale.languageCode)}\n';
    final time =
        '${texts.misc.time}: ${ticketState.time!.myHour(LocaleSettings.currentLocale.languageCode).toLowerCase()}\n';
    final seats =
        '${texts.seat.seats(n: ticketState.seats.length)}: ${ticketState.seats.join(', ')}';
    final data = '$name$date$time$seats';
    return SizedBox.square(
      dimension: context.mediaQuery.size.width * .5,
      child: Center(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: borderRadius12,
            color: Palette.white,
          ),
          child: Padding(
            padding: edgeInsets4,
            child: QrImageView(data: data),
          ),
        ),
      ),
    );
  }
}
