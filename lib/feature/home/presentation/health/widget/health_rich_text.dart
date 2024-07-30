import 'package:erkatoy_afex_ai/design_system/components/google_font_style.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class HealthRichText extends StatelessWidget {
  const HealthRichText({super.key, required this.leftText, required this.rightText});

  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$leftText: ',
        style: googleFontStyle(
          fontColor: context.themeColors.onSecondary,
          fontSize: 16.textSize(context),
          fontWeight: FontWeight.w500,
        ),
        children: <TextSpan>[
          TextSpan(
            text: rightText,
            style: googleFontStyle(
              fontColor: context.themeColors.onSecondary,
              fontSize: 16.textSize(context),
            ),
          )
        ],
      ),
    );
  }
}
