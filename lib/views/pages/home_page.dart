import 'package:buahly/core/models/fruit.dart';
import 'package:buahly/core/models/nutritions.dart';
import 'package:buahly/themes/colors/primary_colors.dart';
import 'package:buahly/themes/icons/asset_icon.dart';
import 'package:buahly/views/layouts/base_layout.dart';
import 'package:buahly/views/widgets/fruit_item.dart';
import 'package:buahly/views/widgets/home_heading.dart';
import 'package:buahly/views/widgets/search_field.dart';
import 'package:flutter/material.dart';

var randomArr = List.generate(50, (i) => i + 1);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeHeading(), 
          const SizedBox(height: 16),
          const SearchField(),
          const SizedBox(height: 14),
          FruitItem(
            fruit: Fruit(
              name: "Banana", 
              genus: "Musa", 
              id: "6",
              family: "Musaceae",
              order: "Zingiberales",
              nutritions: Nutritions(
                carbohydrates: 22,
                protein: 1,
                fat: 0.2,
                calories: 96,
                sugar: 17.2
              )
            )
          ),
          const SizedBox(height: 14),
          FruitItem(
            fruit: Fruit(
              name: "Banana", 
              genus: "Musa", 
              id: "6",
              family: "Musaceae",
              order: "Zingiberales",
              nutritions: Nutritions(
                carbohydrates: 22,
                protein: 1,
                fat: 0.2,
                calories: 96,
                sugar: 17.2
              )
            )
          )
        ],
      )
    );
  }
}
