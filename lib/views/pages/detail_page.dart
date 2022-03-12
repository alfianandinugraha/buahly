import 'package:buahly/themes/colors/primary_colors.dart';
import 'package:buahly/themes/icons/asset_icon.dart';
import 'package:buahly/views/layouts/base_layout.dart';
import 'package:buahly/views/widgets/nutrition_property.dart';
import 'package:buahly/views/widgets/property.dart';
import 'package:flutter/material.dart';

class DetailPageArguments {
  final String id;

  const DetailPageArguments({required this.id});
}

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  static void go(BuildContext context, DetailPageArguments arguments) {
    Navigator.pushNamed(context, '/detail', arguments: arguments);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailPageArguments;
    final id = args.id;
    
    print("Fetcing fruit $id");

    return BaseLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 46),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              AssetIcon.arrowLeft,
              size: 24,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            "Banana",
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline1?.fontSize,
              fontWeight: Theme.of(context).textTheme.headline1?.fontWeight,
              color: PrimaryColors.pallete[500]
            )
          ),
          const SizedBox(height: 20),
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
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: PrimaryColors.pallete[100]?.withOpacity(0.075),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: PrimaryColors.pallete[500]!,
                width: 1
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nutritions",
                  style: TextStyle(
                    color: PrimaryColors.pallete[500],
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    NutritionProperty(label: "Sugar", total: 30),
                    NutritionProperty(label: "Protein", total: 1),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    NutritionProperty(label: "Fat", total: 0.2),
                    NutritionProperty(label: "Calories", total: 96),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    NutritionProperty(label: "carbohydrates", total: 22),
                  ],
                ),
              ],
            )
          )
        ],
      )
    );
  }
}
