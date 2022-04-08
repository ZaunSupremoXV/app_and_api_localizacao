import 'package:consume_api/app/pages/users/users_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../app_controller.dart';
import '../../app_theme.dart';
import '../../models/users_model.dart';
import '../../repositories/users_repository.dart';
import '../../services/client_http_service.dart';
import '../../shared/molecules/card_users_widget.dart.dart';
import '../../shared/molecules/custom_switch_widget.dart';
import '../../viewmodels/apigithub_viewmodel.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final controller = UsersController(
    ApiGithubViewModel(
      ApiGithubRepository(
        ClientHttpService(),
      ),
    ),
  );

  bool isLoading = false;
  String name = '';

  init() async {
    setState(() {
      isLoading = true;
    });

    if (name != null) {
      await controller.getFindAll(name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppController.instance.themeSwitch,
      builder: (context, isDark, child) {
        return Scaffold(
          appBar: AppBar(
            title: Card(
              child: TextFormField(
                decoration: const InputDecoration(
                  // prefixIcon: Icon(Icons.search),
                  hintText: ' Procurar...',
                ),
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
              ),
            ),
            toolbarHeight: 100,
            flexibleSpace: Image.asset(
              isDark ? "assets/images/night.jpg" : "assets/images/light.jpg",
              fit: BoxFit.cover,
            ),
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                  onPressed: () {
                    init();
                  },
                  icon: const Icon(FontAwesomeIcons.search)),
              CustomSwitchWidget(),
            ],
          ),
          body: ValueListenableBuilder<List<UsersModel>?>(
              valueListenable: controller.findAll,
              builder: (context, users, child) {
                if (users == null || users.isEmpty || name == null) {
                  return Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Center(
                        child: Text(
                      "Insira algum nome em procurar e clique na lupa.",
                      style: AppTheme.textBody,
                      textAlign: TextAlign.center,
                    )),
                  );
                }
                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return CardUsersWidget(model: users[index]);
                    });
              }),
        );
      },
    );
  }
}
