import 'package:equatable/equatable.dart';

class Parking extends Equatable {
  final String name;
  final int totalSpots;
  final int availableSpots;

  @override
  List<Object> get props => [name, totalSpots, availableSpots];

  static const empty = Parking('-', 0, 0);

  const Parking(this.name, this.totalSpots, this.availableSpots);
}
