part of 'user_bloc.dart';

class UserState extends Equatable {
  final User user;

  @override
  List<Object> get props => [user];

  const UserState({required User this.user});

  UserState copyWith({
    required User user,
  }) {
    return UserState(user: user);
  }
}
