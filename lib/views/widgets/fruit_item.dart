import 'package:buahly/core/models/fruit.dart';
import 'package:buahly/themes/colors/primary_colors.dart';
import 'package:buahly/themes/icons/asset_icon.dart';
import 'package:buahly/views/pages/detail_page.dart';
import 'package:flutter/material.dart';

class FruitItem extends StatelessWidget {
  final Fruit fruit;

  const FruitItem({Key? key, required this.fruit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DetailPage.go(
          context, 
          DetailPageArguments(
            id: fruit.id
          )
        );
      },
      child: SizedBox(
        height: 41,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 18
              ),
              margin: const EdgeInsets.only(
                right: 11
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4)
                  )
                ]
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(fruit.name),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 6,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: PrimaryColors.pallete[500],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4)
                  )
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: PrimaryColors.pallete[500],
                  borderRadius: BorderRadius.circular(22)
                ),
                child: const Icon(
                  AssetIcon.duoChevron, 
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
