import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class OnBoardingPageNavigatorButton extends StatelessWidget {
  const OnBoardingPageNavigatorButton({super.key, required this.onPressed, required this.text});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: getBorderAll8,
      onTap: onPressed,
      child: Padding(
        padding: getPaddingAll10,
        child: TextView(
          text: text,
          textColor: context.themeColors.onSurface,
          textSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
