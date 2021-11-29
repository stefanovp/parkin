// ignore_for_file: public_member_api_docs

part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class BuyCreditsEvent extends UserEvent {
  final int quantity;

  BuyCreditsEvent({required this.quantity});
}

class UseCreditsEvent extends UserEvent {
  final int used;

  UseCreditsEvent({required this.used});
}

class ChangeNameEvent extends UserEvent {
  final String name;

  ChangeNameEvent({required this.name});
}
