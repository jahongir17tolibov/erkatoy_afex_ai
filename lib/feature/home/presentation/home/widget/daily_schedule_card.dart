import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/scale_on_press_button.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/daily_schedule/daily_schedule_screen.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/home/bloc/home_bloc.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/home/widget/home_cards_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DailyScheduleCard extends StatelessWidget {
  const DailyScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, String>(
      selector: (state) => state.currentActivity,
      builder: (context, currentActivity) {
        return ScaleOnPress(
          onTap: () {
            DailyScheduleScreen.open(context, currentTime: currentActivity.substring(0, 5));
          },
          child: HomeCardsContainer(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      ImagesConstants.dailyScheduleIconSvg,
                      width: 32,
                      height: 32,
                      colorFilter:
                          ColorFilter.mode(context.themeColors.onSecondary, BlendMode.srcIn),
                    ),
                    getWidthSize16,
                    TextView.boldStyle(
                      text: 'Kunlik jadval',
                      textSize: 20.textSize(context),
                      textColor: context.themeColors.onSecondary,
                    ),
                  ],
                ),
                getHeightSize20,
                Container(
                  width: 1.screenWidth(context),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                    color: context.themeColors.surface.withOpacity(0.8),
                    borderRadius: getBorderAll16,
                  ),
                  child: TextView(
                    text: currentActivity,
                    textSize: 14.textSize(context),
                    textColor: context.themeColors.onSurface,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
