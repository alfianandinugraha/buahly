import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Hello, world!",
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.headline1?.fontSize,
          )
        ),
      ),
    );
  }
}
