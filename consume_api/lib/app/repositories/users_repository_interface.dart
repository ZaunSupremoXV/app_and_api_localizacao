import '../models/user_model.dart';
import '../models/users_model.dart';

abstract class IApiGithub {
  Future<UserModel> findOne(String login);
  Future<List<UsersModel>> findAll(String login);
}
