import 'package:buahly/themes/icons/asset_icon.dart';
import 'package:buahly/views/layouts/base_layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Buahly".toUpperCase(),
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.caption?.fontSize,
              fontWeight: Theme.of(context).textTheme.caption?.fontWeight,
              color: Theme.of(context).textTheme.caption?.color,
            )
          ),
          const Icon(AssetIcon.duoChevron, color: Colors.amber),
          ElevatedButton(onPressed: () {}, child: Text("Click me")),
          OutlinedButton(onPressed: () {}, child: Text("Click me")),
        ],
      )
    );
  }
}
