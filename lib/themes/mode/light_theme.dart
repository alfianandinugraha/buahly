import 'package:buahly/themes/base/button_base.dart';
import 'package:buahly/themes/base/text_base.dart';
import 'package:buahly/themes/colors/primary_colors.dart';
import 'package:flutter/material.dart';

class LightMode {
  static ThemeData theme() {
    return ThemeData(
      textTheme: TextBase.theme,
      primarySwatch: PrimaryColors.asMaterialColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonBase.elevated
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonBase.outlined
      )
    );
  }
}