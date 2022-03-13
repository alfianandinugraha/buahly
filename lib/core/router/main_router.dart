import 'package:buahly/core/store/detail_fruit/bloc.dart';
import 'package:buahly/core/store/list_fruit/bloc.dart';
import 'package:buahly/views/pages/about_page.dart';
import 'package:buahly/views/pages/detail_page.dart';
import 'package:buahly/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainRouter {
  Route? generate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ListFruitBloc>(
            create: (_) => ListFruitBloc(),
            child: const HomePage(),
          ),
          settings: settings
        );
      case '/detail':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => DetailFruitBloc(),
            child: const DetailPage(),
          ),
          settings: settings
        );
      case '/about':
        return MaterialPageRoute(
          builder: (_) => const AboutPage()
        );
      default:
        return null;
    }
  }
}
