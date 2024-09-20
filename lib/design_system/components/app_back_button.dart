import 'package:erkatoy_afex_ai/core/base/base_extensions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(48),
      onTap: () {
        context.unFocusingKeyboard(() {
          context.pop();
        });
      },
      child: SvgPicture.asset(
        ImagesConstants.backIconRounded,
        fit: BoxFit.scaleDown,
        colorFilter: ColorFilter.mode(context.themeColors.onSurface, BlendMode.srcIn),
      ),
    );
  }
}
