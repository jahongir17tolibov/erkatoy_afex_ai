import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class HomeCardsContainer extends StatelessWidget {
  const HomeCardsContainer({super.key, this.borderColor, this.borderWidth, required this.child});

  final Color? borderColor;
  final double? borderWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.screenWidth(context),
      padding: getPaddingAll20,
      decoration: BoxDecoration(
        color: context.themeColors.secondary,
        borderRadius: getBorderAll16,
        border: Border.all(color: borderColor ?? Colors.transparent, width: borderWidth ?? 0.0),
      ),
      child: child,
    );
  }
}
