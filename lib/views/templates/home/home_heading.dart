import 'package:buahly/themes/icons/asset_icon.dart';
import 'package:flutter/material.dart';

class HomeHeading extends StatelessWidget {
  const HomeHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Buahly",
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.headline1?.fontSize,
            fontWeight: Theme.of(context).textTheme.headline1?.fontWeight,
          )
        ),
        const Icon(
          AssetIcon.info,
          size: 18,
          color: Color(0xFFC6C6C6),
        )
      ],
    );
  }
}
