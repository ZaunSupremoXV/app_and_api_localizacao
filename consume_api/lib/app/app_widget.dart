import 'package:consume_api/app/pages/introduction/introduction_page.dart';
import 'package:flutter/material.dart';

import 'app_controller.dart';
import 'app_theme.dart';
import 'pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppController.instance.themeSwitch,
      builder: (context, isDark, child) {
        return MaterialApp(
          title: 'Flutter App',
          debugShowCheckedModeBanner: false,
          theme: isDark ? AppTheme.darkMode : AppTheme.lightMode,
          // ignore: prefer_const_constructors
          home: AppController.instance.isShowHome
              ? const HomePage()
              : const IntroductionPage(),
        );
      },
    );
  }
}
