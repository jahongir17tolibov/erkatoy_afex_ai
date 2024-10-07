import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/svg_image_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class RotatedArrow extends StatelessWidget {
  const RotatedArrow({super.key, required this.isExpanded});

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: AnimatedRotation(
        turns: isExpanded ? 1 / 2 : 0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
        child: RotatedBox(
          quarterTurns: 135,
          child: SvgImageView(
            ImagesConstants.backIconRounded,
            color: context.themeColors.onSurface,
          ),
        ),
      ),
    );
  }
}
