import 'dart:math';

import 'package:flut_cinematic/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'seat_column.freezed.dart';

@freezed
class SeatColumn with _$SeatColumn {
  factory SeatColumn({required List<SeatRow> rows}) = _SeatColumn;

  static SeatColumn seatColumn = SeatColumn(
    rows: List.generate(
      12,
      (index) {
        if (index == 2 || index == 7) {
          return SeatRow(
            items: [SeatItem(status: SeatStatus.empty, index: -1)],
          );
        }
        return SeatRow(
          items: [
            SeatItem(status: SeatStatus.other, index: index),
            ...List.generate(
              9,
              (index) => SeatItem(
                status: SeatStatus.values[Random().nextInt(2)],
                index: index,
              ),
            ),
          ],
        );
      },
    ),
  );
}
