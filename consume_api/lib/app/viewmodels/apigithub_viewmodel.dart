import 'package:flutter/foundation.dart';

import '../models/user_model.dart';
import '../models/users_model.dart';
import '../repositories/users_repository_interface.dart';

class ApiGithubViewModel {
  final IApiGithub repository;

  final userModel = ValueNotifier<UserModel?>(null);
  final usersModel = ValueNotifier<List<UsersModel>?>(null);

  ApiGithubViewModel(this.repository);

  findOne(String login) async {
    try {
      userModel.value = await repository.findOne(login);
    } catch (e) {
      return (e);
    }
  }

  findAll(String login) async {
    try {
      usersModel.value = await repository.findAll(login);
    } catch (e) {
      return (e);
    }
  }
}
