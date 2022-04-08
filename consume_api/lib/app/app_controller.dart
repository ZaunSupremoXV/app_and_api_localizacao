import 'package:flutter/material.dart';

import 'services/shared_local_storage_service.dart';
import 'viewmodels/change_theme_viewmodel.dart';

class AppController {
  static final AppController instance = AppController._();
  AppController._() {
    changeThemeViewModel.init();
  }

  final AppConfigViewModel changeThemeViewModel =
      AppConfigViewModel(storage: SharedLocalStorageService());

  bool get isDark => changeThemeViewModel.config.themeSwitch.value;
  bool get isShowHome => changeThemeViewModel.config.showHome.value;
  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewModel.config.themeSwitch;
}
