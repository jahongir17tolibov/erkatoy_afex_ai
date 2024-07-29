import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

import 'scale_on_press_button.dart';

class RetryButton extends StatelessWidget {
  const RetryButton({super.key, required this.onPressed, this.color});

  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleOnPress(
        child: TextButton.icon(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: context.themeColors.surface,
            shape: RoundedRectangleBorder(
              borderRadius: getFullBorder(context),
              side: BorderSide(color: color ?? context.themeColors.primary),
            ),
          ),
          icon: Icon(Icons.replay_rounded, color: color ?? context.themeColors.primary),
          label: TextView(
            text: 'Qaytadan urinish',
            textColor: color ?? context.themeColors.primary,
          ),
        ),
      ),
    );
  }
}
