import 'package:flutter/material.dart';

class TextBase {
  static TextStyle base = const TextStyle(fontFamily: 'Lato');

  static TextStyle bodyText2 = TextBase.base;

  static TextStyle headline1 = TextBase.base.copyWith(
    fontSize: 24
  );

  static TextStyle caption = TextBase.base.copyWith(
    fontSize: 12
  );

  static TextTheme theme = TextTheme(
    bodyText2: TextBase.bodyText2,
    headline1: TextBase.headline1,
    caption: TextBase.caption
  );
}
