import 'package:consume_api/app/pages/user/user_controller.dart';
import 'package:flutter/material.dart';
import '../../app_controller.dart';
import '../../app_theme.dart';
import '../../models/user_model.dart';
import '../../models/users_model.dart';
import '../../repositories/users_repository.dart';
import '../../services/client_http_service.dart';
import '../../shared/molecules/custom_switch_widget.dart';
import '../../viewmodels/apigithub_viewmodel.dart';

class UserPage extends StatefulWidget {
  UsersModel? usersModel;
  UserPage({Key? key, this.usersModel}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final controller = UserController(
    ApiGithubViewModel(
      ApiGithubRepository(
        ClientHttpService(),
      ),
    ),
  );

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller.getFindOne(widget.usersModel!.login);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppController.instance.themeSwitch,
      builder: (context, isDark, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'E o tempo?',
              style: AppTheme.titleAppBar,
            ),
            toolbarHeight: 100,
            flexibleSpace: Image.asset(
              isDark ? "assets/images/night.jpg" : "assets/images/light.jpg",
              fit: BoxFit.cover,
            ),
            backgroundColor: Colors.transparent,
            actions: [
              CustomSwitchWidget(),
            ],
          ),
          body: ValueListenableBuilder<UserModel?>(
              valueListenable: controller.findOne,
              builder: (context, model, child) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 85,
                          backgroundColor: const Color(0xffFDCF09),
                          child: CircleAvatar(
                            radius: 80,
                            backgroundImage: NetworkImage(
                                "https://avatars.githubusercontent.com/${model?.login}"),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text("Nickname: ${model?.login}"),
                        Text("e-Mail: ${model?.email}"),
                        Text("Localizacao: ${model?.location}"),
                        const SizedBox(height: 20),
                        Text(
                          "bio: ${model?.bio}",
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
