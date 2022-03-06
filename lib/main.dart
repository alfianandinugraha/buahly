import 'package:buahly/core/router/main_router.dart';
import 'package:buahly/themes/mode/light_theme.dart';
import 'package:buahly/views/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: LightMode.theme(),
      home: const Scaffold(
        body: HomePage(),
      ),
      onGenerateRoute: MainRouter.generate,
    );
  }
}