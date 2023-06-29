import 'package:get_it/get_it.dart';
import 'package:tourismo/bloc/user_bloc.dart';
import 'package:tourismo/repositories/user_repositories.dart';

final serviceLocator = GetIt.instance;

void setUpLocators() {
  serviceLocator.registerSingleton<UserBloc>(UserBloc(UserRepositories()));
}
