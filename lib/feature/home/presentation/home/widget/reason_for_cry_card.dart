import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/scale_on_press_button.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/home/widget/home_cards_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReasonForCryCard extends StatelessWidget {
  const ReasonForCryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeCardsContainer(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextView.boldStyle(
                text: 'Yig`i sababini\naniqlash',
                textSize: 20.textSize(context),
                textColor: context.themeColors.onSecondary,
                maxLines: 2,
              ),
              ScaleOnPress(
                onTap: () {},
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: context.themeColors.surface.withOpacity(0.8),
                    borderRadius: getBorderAll16,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      ImagesConstants.voiceIconSvg,
                      width: 48,
                      height: 48,
                      colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 0.05.screenHeight(context)),
          Container(
            width: 1.screenWidth(context),
            padding: getPaddingAll10,
            decoration: BoxDecoration(
              color: context.themeColors.surface.withOpacity(0.8),
              borderRadius: getBorderAll16,
            ),
            child: TextView(
              text: 'Sabab: ',
              textColor: context.themeColors.onSurface,
              textSize: 16.textSize(context),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
