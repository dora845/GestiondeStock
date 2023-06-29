import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourismo/repositories/user_repositories.dart';

import '../models/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepositories _userRepositories;
  UserBloc(this._userRepositories) : super(UserLoadingState()) {
    on<UserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await _userRepositories.getUsers();
        emit(UserLoadedState(users: users));
      } catch (e) {
        emit(UserErrorState(error: e.toString()));
      }
    });
  }
}
