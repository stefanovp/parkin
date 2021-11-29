// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final int age;
  final String email;

  final int credits;

  User copyWith(
      {String? id, String? name, int? age, int? credits, String? email}) {
    return User(id ?? this.id, name ?? this.name, age ?? this.age,
        credits ?? this.credits, email ?? this.email);
  }

  static const empty = User('-', '-', 0, 0, '-');

  @override
  List<Object> get props => [id, name, age, credits, email];

  const User(this.id, this.name, this.age, this.credits, this.email);
}
