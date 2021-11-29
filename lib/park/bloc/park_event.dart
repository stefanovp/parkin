part of 'park_bloc.dart';

abstract class ParkEvent extends Equatable {
  const ParkEvent();

  @override
  List<Object> get props => [];
}

class ParkSelectedEvent extends ParkEvent {
  final Parking parking;

  ParkSelectedEvent({required this.parking});
}

class ClearSelectionEvent extends ParkEvent {}

class VehiclePlateChangedEvent extends ParkEvent {
  final String plate;

  VehiclePlateChangedEvent({required this.plate});
}

class GenerateTicketEvent extends ParkEvent {}
