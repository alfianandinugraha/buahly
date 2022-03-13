import 'package:buahly/themes/base/text_base.dart';
import 'package:buahly/themes/colors/primary_colors.dart';
import 'package:buahly/themes/icons/asset_icon.dart';
import 'package:buahly/views/layouts/base_layout.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  static void go(BuildContext context) {
    Navigator.pushNamed(context, '/about');
  }

  void openLink(String url) async {
    if (!await launch(url)) print("Failed to open source code");
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {
                    openLink("https://www.fruityvice.com/");
                  }
                ),
                const TextSpan(
                  text: " using "
                ),
                TextSpan(
                  text: "https://allorigins.win",
                  style: TextStyle(
                    color: PrimaryColors.pallete[500]
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {
                    openLink("https://allorigins.win");
                  }
                ),
                const TextSpan(
                  text: " (Thank you Fruityvice and allOrigins 🎉)."
                )
              ]
            ),
          ),
          const SizedBox(height: 28),
          ElevatedButton.icon(
            onPressed: () => openLink("https://github.com/alfianandinugraha/buahly"),
            label: const Text("Source code"),
            icon: const Icon(
              AssetIcon.github,
              size: 14,
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () => openLink("https://alfianandi.dev"),
            label: const Text("About me"),
            icon: const Icon(
              AssetIcon.user,
              size: 14,
            ),
          ),
        ],
      )
    );
  }
}
