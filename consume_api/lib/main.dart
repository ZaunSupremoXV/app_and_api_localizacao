import 'package:consume_api/app/app_controller.dart';
import 'package:flutter/material.dart';

import 'app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppController.instance.changeThemeViewModel.init();
  runApp(AppWidget());
}
