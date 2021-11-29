part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Parking selectedParking;

  @override
  List<Object> get props => [selectedParking];

  const HomeState({required Parking this.selectedParking});

  HomeState copyWith({
    required Parking parking,
  }) {
    return HomeState(selectedParking: parking);
  }
}
