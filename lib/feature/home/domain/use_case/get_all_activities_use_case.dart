import 'package:erkatoy_afex_ai/core/base/use_case.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/entity/activity_schedule.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/repository/home_repository.dart';
import 'package:intl/intl.dart';

class GetAllActivitiesUseCase implements BaseUseCaseWithParams<DateTime, AllActivitiesResult> {
  GetAllActivitiesUseCase({required HomeRepository repository}) : _repository = repository;

  final HomeRepository _repository;

  @override
  Future<AllActivitiesResult> execute(DateTime currentActivityTime) async {
    final result = await _repository.getAllActivitiesFromApi();
    if (result.errorMessage == null) {
      final nearestTime = _getNearestTime(result.data!, currentActivityTime);
      final List<ActivitySchedule> activitiesList = result.data!.map((date) {
        if (date.time == nearestTime) return date.copyWith(isCurrent: true);
        return date;
      }).toList();
      return AllActivitiesResult(data: activitiesList);
    }
    return result;
  }

  String _getNearestTime(List<ActivitySchedule> scheduleTimes, DateTime currentTime) {
    DateTime? current;

    for (final date in scheduleTimes) {
      final scheduleTime = DateFormat.Hm().parse(date.time);
      if (scheduleTime.isBefore(currentTime)) {
        current = scheduleTime;
      }
    }

    return current != null ? DateFormat('H:mm').format(current) : scheduleTimes.last.time;
  }
}
