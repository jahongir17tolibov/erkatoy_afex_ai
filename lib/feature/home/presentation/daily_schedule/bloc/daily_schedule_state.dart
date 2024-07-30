part of 'daily_schedule_bloc.dart';

enum DailyScheduleStatus { pure, onLoading, onSuccess, onError }

class DailyScheduleState extends Equatable {
  const DailyScheduleState({this.status = DailyScheduleStatus.pure, this.schedule = const []});

  final DailyScheduleStatus status;
  final List<ActivitySchedule> schedule;

  DailyScheduleState copyWith({
    DailyScheduleStatus? status,
    List<ActivitySchedule>? schedule,
  }) =>
      DailyScheduleState(
        status: status ?? this.status,
        schedule: schedule ?? this.schedule,
      );

  @override
  List<Object?> get props => [status, schedule];
}
