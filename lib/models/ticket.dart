// ignore_for_file: public_member_api_docs

import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:platform_channel_events/models/parking.dart';

class Ticket extends Equatable {
  final String id;
  final String parkingName;
  final String vehiclePlate;
  final DateTime expirationDate;
  final int cost;
  bool isValid;
  bool isPaid;

  Ticket copyWith(String? id, String? parkingName, String? vehiclePlate,
      DateTime? expirationDate, int? cost, bool? isValid, bool? isPaid) {
    return Ticket(
        id: id ?? this.id,
        parkingName: parkingName ?? this.parkingName,
        vehiclePlate: vehiclePlate ?? this.vehiclePlate,
        expirationDate: expirationDate ?? this.expirationDate,
        cost: cost ?? this.cost,
        isPaid: isPaid ?? this.isPaid,
        isValid: isValid ?? this.isValid);
  }

  @override
  List<Object> get props =>
      [id, parkingName, vehiclePlate, expirationDate, cost, isPaid, isValid];

  Ticket(
      {required this.id,
      required this.parkingName,
      required this.vehiclePlate,
      required this.expirationDate,
      required this.cost,
      required this.isPaid,
      required this.isValid});
}
