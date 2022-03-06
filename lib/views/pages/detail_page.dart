import 'package:buahly/themes/colors/primary_colors.dart';
import 'package:buahly/themes/icons/asset_icon.dart';
import 'package:buahly/views/layouts/base_layout.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        ],
      )
    );
  }
}
