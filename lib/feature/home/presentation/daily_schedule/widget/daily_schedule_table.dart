import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/entity/activity_schedule.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/daily_schedule/bloc/daily_schedule_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyScheduleTable extends StatelessWidget {
  const DailyScheduleTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DailyScheduleBloc, DailyScheduleState, List<ActivitySchedule>>(
      selector: (state) => state.schedule,
      builder: (context, schedule) {
        return Container(
          width: 1.screenWidth(context),
          margin: getPaddingAll16,
          padding: getPaddingAll10,
          decoration: BoxDecoration(
            color: context.themeColors.secondary,
            borderRadius: getBorderAll16,
          ),
          child: SizedBox(
            child: Table(
              border: TableBorder.symmetric(
                inside: BorderSide(color: context.themeColors.onSecondary),
              ),
              defaultColumnWidth: FixedColumnWidth(0.2.screenWidth(context)),
              children: [
                ...List.generate(
                  schedule.length,
                  (index) {
                    final item = schedule[index];
                    return TableRow(
                      decoration: BoxDecoration(
                        color: item.isCurrent ? context.themeColors.primary : null,
                      ),
                      children: <Widget>[
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: getPaddingAll6,
                            child: TextView(
                              text: item.time,
                              textSize: 24.textSize(context),
                              textColor: item.isCurrent
                                  ? context.themeColors.onPrimary
                                  : context.themeColors.onSecondary,
                              fontWeight: item.isCurrent ? FontWeight.w500 : null,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: TextView(
                              text: item.activity,
                              textSize: 18.textSize(context),
                              textColor: item.isCurrent
                                  ? context.themeColors.onPrimary
                                  : context.themeColors.onSecondary,
                              fontWeight: item.isCurrent ? FontWeight.w500 : null,
                              maxLines: 1,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
