import 'package:flut_cinematic/features/features.dart';
import 'package:riverpod/riverpod.dart';

final seatProvider =
    StateNotifierProvider.autoDispose<SeatProvider, SeatColumn>(
  (ref) => SeatProvider(SeatColumn.seatColumn),
);

class SeatProvider extends StateNotifier<SeatColumn> {
  SeatProvider(super.state);

  void update({
    required int indexC,
    required int indexR,
    required SeatStatus status,
  }) {
    final rows = [...state.rows];
    final items = [...rows[indexC].items];
    items[indexR] = items[indexR].copyWith(status: status);
    rows[indexC] = rows[indexC].copyWith(items: items);
    state = SeatColumn(rows: rows);
  }
}
