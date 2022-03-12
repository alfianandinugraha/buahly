import 'package:buahly/core/router/main_router.dart';
import 'package:buahly/themes/mode/light_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MainRouter _router = MainRouter();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: LightMode.theme(),
      initialRoute: "/",
      onGenerateRoute: _router.generate,
    );
  }
}