// ignore_for_file: public_member_api_docs, omit_local_variable_types

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:platform_channel_events/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required User user}) : super(UserState(user: user)) {
    //User user = User('-', '-', 0, 0);

    on<BuyCreditsEvent>((event, emit) {
      User updatedUser =
          state.user.copyWith(credits: state.user.credits + event.quantity);
      emit(state.copyWith(user: updatedUser));
    });

    on<UseCreditsEvent>((event, emit) {
      User updatedUser =
          state.user.copyWith(credits: state.user.credits - event.used);
      emit(state.copyWith(user: updatedUser));
    });
  }
}
