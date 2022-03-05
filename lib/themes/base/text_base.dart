import 'package:flutter/material.dart';

class TextBase {
  static TextStyle base = const TextStyle(
    fontFamily: 'Lato', 
    color: Color(0xFF6D6D6D)
  );

  static TextStyle bodyText2 = TextBase.base;

  static TextStyle headline1 = TextBase.base.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w700
  );

  static TextStyle caption = TextBase.base.copyWith(
    fontSize: 12,
    color: const Color(0xFFC6C6C6),
    fontWeight: FontWeight.w900
  );

  static TextTheme theme = TextTheme(
    bodyText2: TextBase.bodyText2,
    headline1: TextBase.headline1,
    caption: TextBase.caption
  );
}
