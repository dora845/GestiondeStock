part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUserEvent extends UserEvent {
}
class CreateUserEvent extends UserEvent {
  final String creertest;
  const CreateUserEvent({required this.creertest});
}