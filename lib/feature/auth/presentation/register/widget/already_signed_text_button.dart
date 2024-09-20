import 'package:erkatoy_afex_ai/core/base/base_extensions.dart';
import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/scale_on_press_button.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/login/login_screen.dart';
import 'package:flutter/material.dart';

class AlreadySignedTextButton extends StatelessWidget {
  const AlreadySignedTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleOnPress(
      child: InkWell(
        borderRadius: getBorderAll12,
        onTap: () {
          context.unFocusingKeyboard(() {
            LoginScreen.open(context);
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: TextView(
            text: 'Profilga kirish',
            textSize: 14,
            fontWeight: FontWeight.w500,
            textColor: context.themeColors.primary,
            textDecorations: AppTextDecorations(
              decoration: TextDecoration.underline,
              color: context.themeColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
