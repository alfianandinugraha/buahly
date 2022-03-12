import 'package:buahly/themes/colors/primary_colors.dart';
import 'package:buahly/views/templates/detail/property.dart';
import 'package:flutter/material.dart';

class NutritionProperty extends StatelessWidget {
  final String label;
  final double total;

  const NutritionProperty({
    Key? key,
    required this.label,
    required this.total
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Property(
      label: label,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            total.toString(),
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline1?.fontSize,
              fontWeight: Theme.of(context).textTheme.headline1?.fontWeight,
              color: PrimaryColors.pallete[500]
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2, bottom: 2),
            child: Text(
              "mg",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.caption?.fontSize,
              ),
            ),
          )
        ],
      ) 
    );
  } 
}
