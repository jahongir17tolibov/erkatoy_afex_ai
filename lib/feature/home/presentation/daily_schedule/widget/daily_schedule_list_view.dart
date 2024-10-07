import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/entity/activity_schedule.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/daily_schedule/bloc/daily_schedule_bloc.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/daily_schedule/widget/schedule_card.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/daily_schedule/widget/schedule_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyScheduleListView extends StatelessWidget {
  const DailyScheduleListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DailyScheduleBloc, DailyScheduleState, List<ActivitySchedule>>(
      selector: (state) => state.schedule,
      builder: (context, schedulesList) {
        return Column(
          children: <Widget>[
            const ScheduleCard(),
            Expanded(
              child: ListView.separated(
                itemCount: schedulesList.length,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                itemBuilder: (context, index) {
                  final item = schedulesList[index];
                  return ScheduleListItem(
                    time: item.time,
                    activity: item.activity,
                    isCurrent: item.isCurrent,
                  );
                },
                separatorBuilder: (context, index) => getHeightSize8,
              ),
            ),
          ],
        );
      },
    );
  }
}
