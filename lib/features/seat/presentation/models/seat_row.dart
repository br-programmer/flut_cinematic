import 'package:flut_cinematic/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'seat_row.freezed.dart';

@freezed
class SeatRow with _$SeatRow {
  factory SeatRow({required List<SeatItem> items}) = _SeatRow;
}

@freezed
class SeatItem with _$SeatItem {
  factory SeatItem({
    required SeatStatus status,
    required int index,
  }) = _SeatItem;
}
