import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/svg_image_view.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeCardsContainer extends StatelessWidget {
  const HomeCardsContainer({
    super.key,
    required this.child,
    required this.iconAsset,
    required this.title,
    required this.extraTitle,
    required this.backgroundColor,
    required this.onBackgroundColor,
    required this.image,
  });

  final String iconAsset;
  final String title;
  final String extraTitle;
  final Color backgroundColor;
  final Color onBackgroundColor;
  final Widget child;
  final String image;

  @override
  Widget build(BuildContext context) {
    final currentThemeMode = MediaQuery.of(context).platformBrightness;
    return Container(
      width: 1.screenWidth(context),
      padding: getPaddingAll16,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: getBorderAll16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgImageView(iconAsset),
              getWidthSize8,
              TextView(
                text: title,
                textSize: 18,
                textColor: onBackgroundColor,
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
                    text: extraTitle,
                    fontWeight: FontWeight.w500,
                    textSize: 14,
                    textColor: onBackgroundColor,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 0.5.screenWidth(context),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: context.themeColors.surface,
                  borderRadius: getBorderAll12,
                ),
                child: child,
              ),
              SvgPicture.asset(image, fit: BoxFit.scaleDown)
            ],
          )
        ],
      ),
    );
  }
}
