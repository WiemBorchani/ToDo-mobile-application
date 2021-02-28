import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class Mythemes {
  static const MaterialColor white = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );

  static final darkTheme = ThemeData(
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.grey.shade900,
      unselectedWidgetColor: Colors.grey.shade500,
      primaryTextTheme: TextTheme(
          headline6: TextStyle(
        color: Colors.yellow[800].withOpacity(0.7),
        fontWeight: FontWeight.w300,
      )));
  static final lightTheme = ThemeData(
      primaryColor: white,
      scaffoldBackgroundColor: Colors.grey.shade100,
      unselectedWidgetColor: Colors.grey.shade500,
      primaryTextTheme: TextTheme(
          headline6: TextStyle(
        color: Colors.yellow[800].withOpacity(0.7),
        fontWeight: FontWeight.w500,
      )));
}
