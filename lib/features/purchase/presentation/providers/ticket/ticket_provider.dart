import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'ticket_provider.freezed.dart';
part 'ticket_state.dart';

final ticketProvider =
    StateNotifierProvider.autoDispose<TicketProvider, TicketState>(
  (ref) => TicketProvider(const TicketState()),
);

class TicketProvider extends StateNotifier<TicketState> {
  TicketProvider(super.state);

  void newSeat(String seat) {
    final seats = [...state.seats];
    if (seats.contains(seat)) {
      seats.remove(seat);
    } else {
      seats.add(seat);
    }
    state = state.copyWith(seats: seats);
  }

  void dateSelect(DateTime date) {
    state = state.copyWith(date: date, time: null);
  }

  void timeSelect(DateTime time) {
    state = state.copyWith(time: time);
  }

  void resetSeats() {
    state = state.copyWith(seats: []);
  }

  void movieName(String name) {
    state = state.copyWith(movieName: name);
  }
}
