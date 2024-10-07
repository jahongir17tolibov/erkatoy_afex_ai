import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class ErkatoyButton extends StatelessWidget {
  const ErkatoyButton({
    super.key,
    required this.onPressed,
    this.buttonWidth,
    this.buttonHeight,
    this.buttonColor,
    required this.text,
    this.textColor,
    this.textSize,
    this.borderRadius = 12,
    this.textToLeft = false,
    this.boldStyledTextEnabled = false,
    this.elevation,
    this.borderSideWidth,
  })  : isOutlined = false,
        borderSideColor = null,
        icon = null;

  const ErkatoyButton.outlined({
    super.key,
    this.buttonWidth,
    this.buttonHeight,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.textSize,
    this.borderRadius = 12,
    this.borderSideColor,
    this.textToLeft = false,
    this.boldStyledTextEnabled = false,
    this.elevation,
    this.borderSideWidth,
  })  : isOutlined = true,
        buttonColor = null,
        icon = null;

  const ErkatoyButton.withIcon({
    super.key,
    this.buttonWidth,
    this.buttonHeight,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.textSize,
    this.borderRadius = 12,
    this.borderSideColor,
    this.boldStyledTextEnabled = false,
    this.elevation,
    this.isOutlined = false,
    this.buttonColor,
    required this.icon,
    this.borderSideWidth,
  }) : textToLeft = false;

  final VoidCallback? onPressed;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? buttonColor;
  final String text;
  final Color? textColor;
  final double? textSize;
  final double borderRadius;
  final bool isOutlined;
  final Color? borderSideColor;
  final bool textToLeft;
  final bool boldStyledTextEnabled;
  final double? elevation;
  final Widget? icon;
  final double? borderSideWidth;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      disabledColor: context.themeColors.onSurface.withOpacity(0.4),
      disabledTextColor: context.themeColors.surface,
      minWidth: buttonWidth,
      height: buttonHeight,
      elevation: elevation,
      highlightElevation: elevation,
      hoverElevation: elevation,
      color: isOutlined ? context.themeColors.surface : buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: isOutlined
            ? BorderSide(color: borderSideColor ?? Colors.grey, width: borderSideWidth ?? 1.0)
            : BorderSide.none,
      ),
      child: icon == null
          ? Align(
              alignment: textToLeft ? Alignment.centerLeft : Alignment.center,
              child: TextView(
                text: text,
                textColor: textColor,
                textSize: textSize,
                fontWeight: boldStyledTextEnabled ? FontWeight.bold : null,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextView(
                  text: text,
                  textColor: textColor,
                  textSize: textSize,
                  fontWeight: boldStyledTextEnabled ? FontWeight.w500 : null,
                ),
                icon!,
              ],
            ),
    );
  }
}
