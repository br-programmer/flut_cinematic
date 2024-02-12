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
    final name = '${ticketState.movieName}, Doblada, Regular 2D, Room 2\n';
    final date = 'Date: ${ticketState.date!.formatWithYear('en')}\n';
    final time = 'Hour: ${ticketState.date!.myHour.toLowerCase()}\n';
    final seats = 'Seats: ${ticketState.seats.join(', ')}';
    final data = '$name$date$time$seats'.hardCode;
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
