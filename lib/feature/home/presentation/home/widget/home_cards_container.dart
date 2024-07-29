import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class HomeCardsContainer extends StatelessWidget {
  const HomeCardsContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.screenWidth(context),
      padding: getPaddingAll20,
      decoration: BoxDecoration(
        color: context.themeColors.secondary,
        borderRadius: getBorderAll16,
      ),
      child: child,
    );
  }
}
