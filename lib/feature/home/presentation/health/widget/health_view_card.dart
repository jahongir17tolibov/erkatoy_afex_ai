import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class HealthViewCard extends StatelessWidget {
  const HealthViewCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: context.themeColors.secondary,
        shape: RoundedRectangleBorder(borderRadius: getBorderAll16),
        child: child,
      ),
    );
  }
}
