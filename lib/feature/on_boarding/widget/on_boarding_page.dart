import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const Spacer(),
          Image.asset(image, height: 300, fit: BoxFit.cover),
          const Spacer(),
          TextView.boldStyle(
            text: title,
            textSize: 24.textSize(context),
            textColor: context.themeColors.onSurface,
          ),
          getHeightSize6,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.05.screenWidth(context)),
            child: TextView(
              text: subtitle,
              textColor: context.themeColors.onSurface,
              textSize: 16.textSize(context),
              textAlign: TextAlign.center,
            ),
          ),
          getHeightSize20,
        ],
      ),
    );
  }
}
