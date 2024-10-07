import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/svg_image_view.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

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
          color: context.themeColors.secondary,
          borderRadius: getBorderAll20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SvgImageView(ImagesConstants.calendarColoredIcon),
            getWidthSize8,
            TextView(
              text: 'Kunlik Jadval',
              textSize: 18,
              textColor: context.themeColors.onSecondary,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            Card(
              elevation: 0,
              color: context.themeColors.surface,
              shape: RoundedRectangleBorder(borderRadius: getBorderAll12),
              child: Padding(
                padding: getPaddingAll6,
                child: TextView(
                  text: 'Bugungi',
                  fontWeight: FontWeight.w500,
                  textSize: 14,
                  textColor: context.themeColors.onSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
