part of 'ticket_bloc.dart';

abstract class TicketEvent extends Equatable {
  const TicketEvent();

  @override
  List<Object> get props => [];
}

class CreateTicketEvent extends TicketEvent {
  final Ticket ticket;

  CreateTicketEvent({required this.ticket});
}
