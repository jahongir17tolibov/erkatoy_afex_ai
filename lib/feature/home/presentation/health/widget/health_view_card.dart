import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/svg_image_view.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class HealthViewCard extends StatelessWidget {
  const HealthViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: context.themeColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: getCircularRadius(26),
          bottomRight: getCircularRadius(26),
        ),
      ),
      child: Container(
        margin: getPaddingAll12,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        width: 1.screenWidth(context),
        decoration: BoxDecoration(
          color: context.themeColors.primaryContainer,
          borderRadius: getBorderAll20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SvgImageView(ImagesConstants.healthColoredIcon),
                getWidthSize8,
                TextView(
                  text: 'Kassaliklar va Maslahatlar',
                  textSize: 16,
                  textColor: context.themeColors.onPrimaryContainer,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            getHeightSize8,
            TextView(
              text: 'Bolalarda uchrashi mumkin bo’lgan kassalliklar',
              textSize: 16,
              textColor: context.themeColors.onPrimaryContainer,
            )
          ],
        ),
      ),
    );
  }
}
