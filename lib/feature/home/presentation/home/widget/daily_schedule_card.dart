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

class DailyScheduleCard extends StatelessWidget {
  const DailyScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, List<String>>(
      selector: (state) => [state.currentTime, state.currentActivity],
      builder: (context, currentActivity) {
        return ScaleOnPress(
          onTap: () {
            onNavigateDailySchedule(context, currentActivity[0]);
          },
          child: HomeCardsContainer(
            title: 'Kunlik jadval',
            extraTitle: 'Bugungi',
            iconAsset: ImagesConstants.calendarColoredIcon,
            image: ImagesConstants.homeDailyScheduleImg,
            backgroundColor: context.themeColors.secondary,
            onBackgroundColor: context.themeColors.onSecondary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextView(
                  text: currentActivity[0],
                  textColor: context.themeColors.onSecondary,
                  fontWeight: FontWeight.w500,
                  textSize: 12,
                ),
                getHeightSize4,
                TextView(
                  text: currentActivity[1],
                  textSize: 12,
                  fontWeight: FontWeight.w500,
                  textColor: context.themeColors.onSurface.withOpacity(0.5),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void onNavigateDailySchedule(BuildContext context, String currentActivity) {
    String? argument;
    final List<String> parts = currentActivity.substring(0, 5).split(':');
    if (parts.length > 1) {
      final int hours = int.parse(parts[0]);
      final int minutes = int.parse(parts[1]);
      argument = minutes > 30 ? '$hours:30' : '$hours:00';
    }
    DailyScheduleScreen.open(context, currentTime: argument ?? '');
  }
}
