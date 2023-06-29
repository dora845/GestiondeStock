import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourismo/bloc/user_bloc.dart';
import 'package:tourismo/models/user_model.dart';
import 'package:tourismo/repositories/user_repositories.dart';
import 'package:tourismo/service_locator.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = serviceLocator.get<UserBloc>();
    return BlocBuilder<UserBloc, UserState>(
      bloc: userBloc,
      builder: (context, state) {
        if (state is UserLoadedState) {
          List<UserModel> userList = state.users;
          return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (_, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: ListTile(
                    title: Text('${userList[index].name}'),
                  ),
                );
              });
        }
        if (state is UserErrorState) {
          return Center(
            child: Text(state.error),
          );
        }
        return const LinearProgressIndicator();
      },
    );
  }
}
