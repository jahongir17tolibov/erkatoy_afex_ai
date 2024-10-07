import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/blur_outer_container.dart';
import 'package:erkatoy_afex_ai/design_system/components/scale_on_press_button.dart';
import 'package:erkatoy_afex_ai/design_system/components/svg_image_view.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/creating_account/creating_account_screen.dart';
import 'package:flutter/material.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleOnPress(
      onTap: () {
        CreatingAccountScreen.openPush(context);
      },
      child: BlurOuterContainer(
        padding: getPaddingAll16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextView(
              text: 'Ma`lumotlarni o’zgartirish',
              textColor: context.themeColors.onSurface,
              textSize: 16,
              fontWeight: FontWeight.w500,
            ),
            SvgImageView(ImagesConstants.editProfileIcon, color: context.themeColors.onSurface),
          ],
        ),
      ),
    );
  }
}
