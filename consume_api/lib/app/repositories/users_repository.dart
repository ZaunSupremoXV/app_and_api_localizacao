import 'package:consume_api/app/repositories/users_repository_interface.dart';

import '../interfaces/client_http_interface.dart';
import '../models/user_model.dart';
import '../models/users_model.dart';

class ApiGithubRepository implements IApiGithub {
  final IClientHttp client;

  ApiGithubRepository(this.client);

  @override
  Future<UserModel> findOne(String login) async {
    var json = await client.get('https://api.github.com/users/${login}');
    UserModel model = UserModel.fromMap(json);
    return model;
  }

  @override
  Future<List<UsersModel>> findAll(String login) async {
    if (login != null) {
      var json =
          await client.get('https://api.github.com/search/users?q=${login}');
      return List<UsersModel>.from(
          json["items"].map((e) => UsersModel.fromMap(e)));
    } else {
      var json = await client.get('https://api.github.com/users');
      return List<UsersModel>.from(
          json["items"].map((e) => UsersModel.fromMap(e)));
    }
  }
}
