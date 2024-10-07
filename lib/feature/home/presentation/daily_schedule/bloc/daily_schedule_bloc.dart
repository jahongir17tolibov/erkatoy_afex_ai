import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/entity/activity_schedule.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/use_case/get_all_activities_use_case.dart';
import 'package:intl/intl.dart';

part 'daily_schedule_event.dart';
part 'daily_schedule_state.dart';

class DailyScheduleBloc extends Bloc<DailyScheduleEvent, DailyScheduleState> {
  DailyScheduleBloc({required this.getAllActivitiesUseCase}) : super(const DailyScheduleState()) {
    on<OnGetAllActivitiesScheduleEvent>(_onGetAllActivitiesScheduleEvent);
  }

  final GetAllActivitiesUseCase getAllActivitiesUseCase;

  FutureOr<void> _onGetAllActivitiesScheduleEvent(
    OnGetAllActivitiesScheduleEvent event,
    Emitter<DailyScheduleState> emit,
  ) async {
    emit(state.copyWith(status: DailyScheduleStatus.onLoading));
    final currentTime = DateFormat.Hm().tryParse(event.currentTime) ?? DateTime.now();
    await getAllActivitiesUseCase.execute(currentTime).then((result) {
      if (result.errorMessage == null) {
        final List<ActivitySchedule> scheduleList = result.data!;
        emit(state.copyWith(
          status: DailyScheduleStatus.onSuccess,
          schedule: scheduleList,
        ));
      } else {
        emit(state.copyWith(status: DailyScheduleStatus.onError));
      }
    });
  }
}
