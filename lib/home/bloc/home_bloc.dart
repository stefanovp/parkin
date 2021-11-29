// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:platform_channel_events/models/parking.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required Parking parking})
      : super(HomeState(selectedParking: parking)) {
    on<ParkSelectedEvent>((event, emit) {
      emit(state.copyWith(parking: event.parking));
    });
  }
}
