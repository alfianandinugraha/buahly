import 'package:flutter/material.dart';

class PrimaryColors {
  static const int main = 0xFF00A878;

  static const Map<int, Color> pallete = {
    50: Color(0xFFE0F5EF),
    100: Color(0xFFB3E5D7),
    200: Color(0xFF80D4BC),
    300: Color(0xFF4DC2A1),
    400: Color(0xFF26B58C),
    500: Color(PrimaryColors.main),
    600: Color(0xFF00A070),
    700: Color(0xFF009765),
    800: Color(0xFF008D5B),
    900: Color(0xFF007D48),
  };

  static const MaterialColor asMaterialColor = MaterialColor(
    PrimaryColors.main, PrimaryColors.pallete
  );
}
