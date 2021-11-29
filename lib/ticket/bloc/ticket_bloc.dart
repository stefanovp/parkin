// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:platform_channel_events/database/database.dart';
import 'package:platform_channel_events/models/ticket.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc() : super(TicketState()) {
    on<CreateTicketEvent>((event, emit) {
      TicketsDatabase.instance.create(event.ticket);
    });
  }
}
