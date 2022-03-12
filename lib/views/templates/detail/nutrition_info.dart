import 'package:buahly/core/store/detail_fruit/bloc.dart';
import 'package:buahly/core/store/detail_fruit/state.dart';
import 'package:buahly/themes/colors/primary_colors.dart';
import 'package:buahly/views/templates/detail/nutrition_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NutritionInfo extends StatelessWidget {
  const NutritionInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailFruitBloc, DetailFruitState>(
      builder: (_, state) {
        if (state is DetailFruitLoaded) {
          final nutritions = state.fruit.nutritions;

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
                    NutritionProperty(label: "Sugar", total: nutritions.sugar),
                    NutritionProperty(label: "Protein", total: nutritions.protein),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    NutritionProperty(label: "Fat", total: nutritions.fat),
                    NutritionProperty(label: "Calories", total: nutritions.calories),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    NutritionProperty(label: "carbohydrates", total: nutritions.carbohydrates),
                  ],
                ),
              ],
            )
          );
        }

        return Container();
      }
    );
  }
}
