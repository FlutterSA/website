import 'package:flutterdevsa_website/src/app/services/shared_prefs/shared_prefs_service.dart';
import 'package:flutterdevsa_website/src/app/utils/constants.dart';
import 'package:theme_mode_handler/theme_mode_manager_interface.dart';

class ThemeModeService extends SharedPrefsService implements IThemeModeManager {
  @override
  Future<String> loadThemeMode() async {
    return await getTheme();
  }

  @override
  Future<bool> saveThemeMode(String value) async {
    return await saveTheme(value);
  }

  String _themeMode;
  String get themeMode => _themeMode;

  Future getTheme() async {
    return await getValue(Constants.themeModeKey);
  }

  Future<bool> saveTheme(String value) async {
    _themeMode = value;
    return await saveValue(Constants.themeModeKey, value);
  }

  Future<bool> removeTheme(String value) async {
    return await removeValue(Constants.themeModeKey);
  }
}
