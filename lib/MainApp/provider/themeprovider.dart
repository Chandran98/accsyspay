import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    loadCurrentTheme();
  }
  bool _darkTheme = true;
  get darkTheme => _darkTheme;
  Future<void> toggleTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _darkTheme = !_darkTheme;

    preferences.setBool("theme", _darkTheme);
    notifyListeners();
  }

  void loadCurrentTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    _darkTheme = preferences.getBool("theme") ?? false;
    notifyListeners();
  }

  Future removeTheme(status) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("Theme");
    notifyListeners();
  }
}
