import 'package:buahly/views/widgets/property.dart';
import 'package:flutter/material.dart';

class FruitInfo extends StatelessWidget {
  const FruitInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Property(
              label: "id",
              child: Text("6")
            ),
            Property(
              label: "genus",
              child: Text("Musa")
            )
          ],
        ),
        const SizedBox(
          height: 18,
        ),
        Row(
          children: const [
            Property(
              label: "family",
              child: Text("Musaceae")
            ),
            Property(
              label: "order",
              child: Text("Zingiberales")
            )
          ],
        )
      ],
    );
  }
}
