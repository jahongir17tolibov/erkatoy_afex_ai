import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/scale_on_press_button.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/health/health_tips_screen.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/home/widget/home_cards_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HealthCard extends StatelessWidget {
  const HealthCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleOnPress(
      onTap: () {
        HealthTipsScreen.open(context);
      },
      child: HomeCardsContainer(
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              ImagesConstants.healthIconSvg,
              width: 32,
              height: 32,
              colorFilter: ColorFilter.mode(context.themeColors.onSecondary, BlendMode.srcIn),
            ),
            getWidthSize16,
            TextView.boldStyle(
              text: 'Salomatlik',
              textSize: 20.textSize(context),
              textColor: context.themeColors.onSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
