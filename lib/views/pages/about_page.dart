import 'package:buahly/themes/base/text_base.dart';
import 'package:buahly/themes/colors/primary_colors.dart';
import 'package:buahly/themes/icons/asset_icon.dart';
import 'package:buahly/views/layouts/base_layout.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  static void go(BuildContext context) {
    Navigator.pushNamed(context, '/about');
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 46),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(AssetIcon.arrowLeft),
                ),
                Text(
                  "Buahly",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headline1?.fontSize,
                    fontWeight: Theme.of(context).textTheme.headline1?.fontWeight,
                  )
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text("Buahly is app to get information about fruit. The purpose of this app is for my learning path. Right now, I am learning Flutter for Android Development."),
          const SizedBox(height: 11),
          RichText(
            text: TextSpan(
              style: TextBase.bodyText2,
              children: [
                const TextSpan(
                  text: "All information about fruit are served from ",
                ),
                TextSpan(
                  text: "https://www.fruityvice.com/",
                  style: TextStyle(
                    color: PrimaryColors.pallete[500]
                  )
                ),
                const TextSpan(
                  text: " (Thank you Fruityvice 🎉)."
                )
              ]
            ),
          )
        ],
      )
    );
  }
}
