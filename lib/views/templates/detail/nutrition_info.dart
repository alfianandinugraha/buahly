import 'package:buahly/themes/colors/primary_colors.dart';
import 'package:buahly/views/widgets/nutrition_property.dart';
import 'package:flutter/material.dart';

class NutritionInfo extends StatelessWidget {
  const NutritionInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
