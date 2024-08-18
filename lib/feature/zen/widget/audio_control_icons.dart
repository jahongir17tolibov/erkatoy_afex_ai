import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/scale_on_press_button.dart';
import 'package:flutter/material.dart';

class AudioControlIcons extends StatelessWidget {
  const AudioControlIcons({super.key, required this.assetPath, required this.onPressed});

  final String assetPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ScaleOnPress(
      onTap: onPressed,
      child: Padding(
        padding: getPaddingAll16,
        child: Image.asset(
          assetPath,
          width: 48,
          height: 48,
          fit: BoxFit.cover,
          color: Colors.orangeAccent,
        ),
      ),
    );
  }
}
