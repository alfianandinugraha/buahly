import 'package:buahly/themes/colors/primary_colors.dart';
import 'package:buahly/themes/icons/asset_icon.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Icon(
              AssetIcon.search,
              size: 16,
              color: PrimaryColors.pallete[500]!,
            )
          )
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: const Color(0xFFE3E3E3)
            )
          ),
          child: const TextField(
            decoration: InputDecoration.collapsed(
              hintText: "Search Fruit",
              hintStyle: TextStyle(
                color: Color(0xFFE3E3E3)
              )
            ),
            style: TextStyle(
              fontSize: 14
            ),
          ),
        )
      ],
    );
  }
}
