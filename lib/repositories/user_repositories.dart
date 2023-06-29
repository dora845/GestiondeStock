import 'dart:convert';

import 'package:http/http.dart';

import '../models/user_model.dart';

class UserRepositories {
  String userUrl = "https://jsonplaceholder.typicode.com/users";

  Future<List<UserModel>> getUsers () async {
    Response response = await get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body).toList();
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}