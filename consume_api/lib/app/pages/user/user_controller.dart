import 'package:flutter/cupertino.dart';

import '../../models/user_model.dart';
import '../../viewmodels/apigithub_viewmodel.dart';

class UserController {
  final ApiGithubViewModel githubViewModel;

  UserController(this.githubViewModel);

  ValueNotifier<UserModel?> get findOne => githubViewModel.userModel;

  getFindOne(String? login) {
    githubViewModel.findOne(login!);
  }
}
