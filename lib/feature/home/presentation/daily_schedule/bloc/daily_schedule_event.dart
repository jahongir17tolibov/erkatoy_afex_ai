part of 'daily_schedule_bloc.dart';

sealed class DailyScheduleEvent {}

final class OnGetAllActivitiesScheduleEvent extends DailyScheduleEvent {
  OnGetAllActivitiesScheduleEvent(this.currentTime);

  final String currentTime;
}
