import 'package:flut_cinematic/i18n/translations.g.dart';
import 'package:flut_cinematic/lib.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookTicketsAndSeatStatusInfo extends StatelessWidget {
  const BookTicketsAndSeatStatusInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: context.theme.scaffoldBackgroundColor),
      child: Padding(
        padding: edgeInsets20,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _SeatStatusIndicator(seatStatus: SeatStatus.aviable),
                  _SeatStatusIndicator(seatStatus: SeatStatus.notAviable),
                  _SeatStatusIndicator(seatStatus: SeatStatus.selected),
                ],
              ),
              gap16,
              HookConsumer(
                builder: (_, WidgetRef ref, __) {
                  final seats = ref.watch(ticketProvider).seats;
                  final total = (seats.length * 5.6).money;
                  return FlutCinematicPrimaryButton(
                    text: texts.seat.bookTickets(money: total),
                    onPressed: seats.isNotEmpty
                        ? () => context.goNamed(Routes.ticketPurchase.name)
                        : null,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SeatStatusIndicator extends StatelessWidget {
  const _SeatStatusIndicator({required this.seatStatus});
  final SeatStatus seatStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FlutCinematicDot(color: seatStatus.color),
        space8,
        Text(
          seatStatus.text,
          style: context.textTheme.labelMedium,
        ),
      ],
    );
  }
}
