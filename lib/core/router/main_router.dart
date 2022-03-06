import 'package:buahly/views/pages/detail_page.dart';
import 'package:buahly/views/pages/home_page.dart';
import 'package:flutter/material.dart';

class MainRouter {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomePage()
        );
      case '/detail':
        return MaterialPageRoute(
          builder: (_) => const DetailPage()
        );
      default:
    }

    return null;
  }
}
