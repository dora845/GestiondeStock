import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourismo/bloc/user_bloc.dart';
import 'package:tourismo/models/user_model.dart';
import 'package:tourismo/repositories/user_repositories.dart';
import 'package:tourismo/service_locator.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
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
                return Dismissible(
                  key: Key(userList[index].id.toString()),
                  onDismissed: (direction)async {
                    userBloc.add(DeleteUserEvent(name:userList[index].name as String ));
                    setState(() {
                      userList.removeWhere((element) => element.id == userList[index].id);
                    });
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                      child: ListTile(
                        dense: true,
                        title: Text('${userList[index].name}'),
                        subtitle: Text('${userList[index].email}'),
                        leading: CircleAvatar(child: Text('${userList[index].id}'),),
                        trailing: const Icon(Icons.list),
                      ),
                    ),
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
