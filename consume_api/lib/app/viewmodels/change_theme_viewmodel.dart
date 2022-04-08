import '../interfaces/local_storage_interface.dart';
import '../models/app_config_model.dart';

class AppConfigViewModel {
  final ILocalStorage storage;
  final AppConfigModel config = AppConfigModel();

  AppConfigViewModel({required this.storage});

  Future init() async {
    await storage.get('isDark').then((value) {
      if (value != null) config.themeSwitch.value = value;
    });
    await storage.get('showHome').then((value) {
      if (value != null) config.showHome.value = value;
    });
  }

  changeTheme(bool value) {
    config.themeSwitch.value = value;
    storage.put('isDark', value);
  }

  changeShowHome(bool value) {
    config.showHome.value = value;
    storage.put('showHome', value);
  }
}
