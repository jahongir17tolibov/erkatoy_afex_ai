import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/scale_on_press_button.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    super.key,
    required this.text,
    this.onPressed,
    this.removePadding = false,
    this.enableScale = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool removePadding;
  final bool enableScale;

  @override
  Widget build(BuildContext context) {
    return ScaleOnPress(
      scaleValue: enableScale ? 0.95 : 1,
      onTap: onPressed,
      child: ListTile(
        title: Padding(
          padding: removePadding ? EdgeInsets.zero : getPaddingAll10,
          child: TextView(
            text: text,
            textSize: 18.textSize(context),
            textColor: context.themeColors.onSecondary,
          ),
        ),
        tileColor: context.themeColors.secondary,
        shape: RoundedRectangleBorder(borderRadius: getBorderAll16),
        trailing: Icon(
          Icons.keyboard_arrow_right_rounded,
          color: context.themeColors.onSecondary,
          size: 36,
        ),
      ),
    );
  }
}
