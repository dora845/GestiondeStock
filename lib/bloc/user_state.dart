part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
  
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {}
class UserLoadedState extends UserState {
  final List<UserModel> users;
  const UserLoadedState({required this.users});
}
class UserErrorState extends UserState {
  final String error;
  const UserErrorState({required this.error});
}
class UserDeletedState extends UserState {
  final String message;
  const UserDeletedState({required this.message});
}