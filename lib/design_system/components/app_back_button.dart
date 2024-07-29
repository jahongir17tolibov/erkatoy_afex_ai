import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(96),
      onTap: () {
        context.pop();
      },
      child: Card(
        color: context.themeColors.secondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(96)),
        child: Icon(Icons.arrow_back_rounded, color: context.themeColors.onSecondary),
      ),
    );
  }
}
