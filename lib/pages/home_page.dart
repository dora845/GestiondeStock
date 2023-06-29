import 'package:flutter/material.dart';
import 'package:tourismo/bloc/user_bloc.dart';
import 'package:tourismo/pages/content/user.dart';
import 'package:tourismo/service_locator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = serviceLocator.get<UserBloc>();
    userBloc.add(LoadUserEvent());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: User(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          userBloc
              .add(CreateUserEvent(creertest: "test creer bloc et get it "));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
