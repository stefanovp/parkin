// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:platform_channel_events/models/parking.dart';

part 'park_event.dart';
part 'park_state.dart';

class ParkBloc extends Bloc<ParkEvent, ParkState> {
  ParkBloc({required Parking parking})
      : super(ParkState(selectedParking: parking)) {
    on<ParkSelectedEvent>((event, emit) {
      emit(state.copyWith(parking: event.parking));
    });

    on<ClearSelectionEvent>((event, emit) {
      emit(state.copyWith(parking: Parking.empty));
    });

    on<VehiclePlateChangedEvent>((event, emit) {
      emit(state.copyWith(plate: event.plate));
    });
  }
}
