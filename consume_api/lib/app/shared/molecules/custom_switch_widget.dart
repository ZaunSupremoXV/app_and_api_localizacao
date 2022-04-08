// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import '../../app_controller.dart';

class CustomSwitchWidget extends StatelessWidget {
  CustomSwitchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDark,
      onChanged: (value) {
        AppController.instance.changeThemeViewModel.changeTheme(value);
      },
    );
  }
}
