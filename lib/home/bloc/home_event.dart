part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class ParkSelectedEvent extends HomeEvent {
  final Parking parking;

  ParkSelectedEvent({required this.parking});
}

class ClearSelectionEvent extends HomeEvent {}
