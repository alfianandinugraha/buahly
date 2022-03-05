import 'package:buahly/views/layouts/base_layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Text(
        "Buahly",
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.headline1?.fontSize,
        )
      )
    );
  }
}
