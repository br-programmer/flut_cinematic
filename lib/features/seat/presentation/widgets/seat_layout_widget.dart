import 'package:flut_cinematic/features/features.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SeatLayoutWidget extends HookConsumerWidget {
  const SeatLayoutWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rows = ref.watch(seatProvider).rows;
    return Expanded(
      child: Padding(
        padding: edgeInsetsH4,
        child: FittedBox(
          fit: BoxFit.cover,
          child: InteractiveViewer(
            minScale: 1,
            maxScale: 2,
            clipBehavior: Clip.none,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: rows.mapList(
                (row) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: row.items.mapList(
                      (item) {
                        final index = rows.indexOf(row);
                        return item.status.child(
                          index: index,
                          onPressed: (value) {
                            final letter = leters[index];
                            final seat = '$letter${item.index + 1}';
                            ref.read(ticketProvider.notifier).newSeat(seat);
                            ref.read(seatProvider.notifier).update(
                                  indexR: item.index + 1,
                                  indexC: index,
                                  status: value,
                                );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
