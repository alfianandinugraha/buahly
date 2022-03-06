import 'package:buahly/core/models/fruit.dart';
import 'package:buahly/core/models/nutritions.dart';
import 'package:buahly/views/layouts/base_layout.dart';
import 'package:buahly/views/widgets/fruit_item.dart';
import 'package:buahly/views/widgets/home_heading.dart';
import 'package:buahly/views/widgets/search_field.dart';
import 'package:flutter/material.dart';

var randomArr = List.generate(50, (i) => i + 1);

var dummyFruit = Fruit(
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
);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: CustomScrollView(
        scrollBehavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: const [
                SizedBox(height: 46),
                HomeHeading(),
                SizedBox(height: 16),
                SearchField(),
                SizedBox(height: 16),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: [
                    FruitItem(fruit: dummyFruit),
                    const SizedBox(height: 14)
                  ],
                );
              },
              childCount: randomArr.length
            )
          )
        ],
      )
    );
  }
}
