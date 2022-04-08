import 'package:flutter/cupertino.dart';

import '../../models/users_model.dart';
import '../../viewmodels/apigithub_viewmodel.dart';

class UsersController {
  final ApiGithubViewModel githubViewModel;

  UsersController(this.githubViewModel);

  ValueNotifier<List<UsersModel>?> get findAll => githubViewModel.usersModel;

  getFindAll(String login) {
    githubViewModel.findAll(login);
  }
}
