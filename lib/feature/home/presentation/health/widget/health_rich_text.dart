import 'package:erkatoy_afex_ai/core/constants/app_constants.dart';
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
        style: TextStyle(
          color: context.themeColors.onSurface,
          fontFamily: AppConstants.appFontStyle,
          fontSize: 12.textSize(context),
          fontWeight: FontWeight.w600,
        ),
        children: <TextSpan>[
          TextSpan(
            text: rightText,
            style: TextStyle(
              fontFamily: AppConstants.appFontStyle,
              color: context.themeColors.onSurface,
              fontSize: 12.textSize(context),
              fontWeight: FontWeight.w400
            ),
          )
        ],
      ),
    );
  }
}
