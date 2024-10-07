import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/scale_on_press_button.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/health/health_tips_screen.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/home/widget/home_cards_container.dart';
import 'package:flutter/material.dart';

class HealthCard extends StatelessWidget {
  const HealthCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleOnPress(
      onTap: () {
        HealthTipsScreen.open(context);
      },
      child: HomeCardsContainer(
        title: 'Salomatlik',
        extraTitle: 'Har kunlik',
        iconAsset: ImagesConstants.healthColoredIcon,
        image: ImagesConstants.homeHealthImg,
        backgroundColor: context.themeColors.primaryContainer,
        onBackgroundColor: context.themeColors.onPrimaryContainer,
        child: TextView(
          text: "Bolalarda uchrashi\nmumkin bo`lgan\nkassalliklar",
          textSize: 14,
          fontWeight: FontWeight.w500,
          textColor: context.themeColors.onSurface.withOpacity(0.5),
        ),
      ),
    );
  }
}
