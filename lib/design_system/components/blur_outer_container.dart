import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class BlurOuterContainer extends StatelessWidget {
  const BlurOuterContainer({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.width,
    this.height,
  });

  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final double? borderRadius;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 12,
            blurStyle: BlurStyle.outer,
            color: context.themeColors.onSurface.withOpacity(0.2),
          )
        ],
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: child,
      ),
    );
  }
}
