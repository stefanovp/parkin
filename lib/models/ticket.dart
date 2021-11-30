// ignore_for_file: public_member_api_docs

import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:platform_channel_events/database/fields/ticket_fields.dart';
import 'package:platform_channel_events/models/parking.dart';

class Ticket extends Equatable {
  final int? id;
  final String parkingName;
  final String vehiclePlate;
  final int expirationDate;
  final int cost;
  bool isPaid;

  bool isValid() {
    return expirationDate >
        (DateTime.now().millisecondsSinceEpoch / 1000).round();
  }

  Ticket copyWith(
      {int? id,
      String? parkingName,
      String? vehiclePlate,
      int? expirationDate,
      int? cost,
      bool? isPaid}) {
    return Ticket(
        id: id ?? this.id,
        parkingName: parkingName ?? this.parkingName,
        vehiclePlate: vehiclePlate ?? this.vehiclePlate,
        expirationDate: expirationDate ?? this.expirationDate,
        cost: cost ?? this.cost,
        isPaid: isPaid ?? this.isPaid);
  }

  @override
  List<Object> get props => [
        id ?? 0,
        parkingName,
        vehiclePlate,
        expirationDate,
        cost,
        isPaid,
        isValid
      ];

  Ticket({
    this.id,
    required this.parkingName,
    required this.vehiclePlate,
    required this.expirationDate,
    required this.cost,
    required this.isPaid,
  });

  Map<String, Object?> toJson() => {
        TicketFields.id: id,
        TicketFields.parkingName: parkingName,
        TicketFields.vehiclePlate: vehiclePlate,
        TicketFields.cost: cost,
        TicketFields.isPaid: isPaid ? 1 : 0,
        TicketFields.expirationDate: expirationDate,
      };

  static Ticket fromJson(Map<String, Object?> json) => Ticket(
        id: json[TicketFields.id] as int,
        parkingName: json[TicketFields.parkingName] as String,
        vehiclePlate: json[TicketFields.vehiclePlate] as String,
        cost: json[TicketFields.cost] as int,
        isPaid: json[TicketFields.isPaid] == 1,
        expirationDate: json[TicketFields.expirationDate] as int,
      );
}
