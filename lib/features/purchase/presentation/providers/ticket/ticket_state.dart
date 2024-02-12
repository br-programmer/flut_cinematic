part of 'ticket_provider.dart';

@freezed
class TicketState with _$TicketState {
  const factory TicketState({
    @Default([]) List<String> seats,
    DateTime? date,
    DateTime? time,
    String? movieName,
  }) = _TicketState;
}
