import 'package:buahly/themes/colors/primary_colors.dart';
import 'package:flutter/material.dart';

class ButtonBase {
  static ButtonStyle base = ButtonStyle(
    padding: MaterialStateProperty.all(
      const EdgeInsets.all(16)
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      )
    )
  );

  static ButtonStyle elevated = base.copyWith(
    elevation: MaterialStateProperty.all(0),
  );

  static ButtonStyle outlined = base.copyWith(
    side: MaterialStateProperty.all(
      BorderSide(
        color: PrimaryColors.pallete[500]!
      )
    )
  );
}
