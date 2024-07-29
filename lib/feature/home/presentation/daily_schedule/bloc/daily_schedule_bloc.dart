import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'daily_schedule_event.dart';
part 'daily_schedule_state.dart';

class DailyScheduleBloc extends Bloc<DailyScheduleEvent, DailyScheduleState> {
  DailyScheduleBloc() : super(DailyScheduleInitial()) {
    on<DailyScheduleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
