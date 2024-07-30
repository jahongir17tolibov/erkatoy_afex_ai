import 'package:equatable/equatable.dart';

class ActivitySchedule extends Equatable {
  const ActivitySchedule({required this.time, required this.activity, this.isCurrent = false});

  final String time;
  final String activity;
  final bool isCurrent;

  ActivitySchedule copyWith({
    String? time,
    String? activity,
    bool? isCurrent,
  }) =>
      ActivitySchedule(
        time: time ?? this.time,
        activity: activity ?? this.activity,
        isCurrent: isCurrent ?? this.isCurrent,
      );

  @override
  List<Object?> get props => [time, activity, isCurrent];
}
