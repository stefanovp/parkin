part of 'park_bloc.dart';

class ParkState extends Equatable {
  final Parking selectedParking;
  final String? plate;

  @override
  List<Object> get props => [selectedParking, plate ?? '-'];

  const ParkState({required Parking this.selectedParking, String? this.plate});

  ParkState copyWith({
    Parking? parking,
    String? plate,
  }) {
    return ParkState(
        selectedParking: parking ?? this.selectedParking,
        plate: plate ?? this.plate);
  }
}
