import 'package:buahly/themes/colors/primary_colors.dart';
import 'package:buahly/themes/icons/asset_icon.dart';
import 'package:buahly/views/layouts/base_layout.dart';
import 'package:buahly/views/widgets/search_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
          ), 
          const SizedBox(height: 16),
          const SearchField()
        ],
      )
    );
  }
}
