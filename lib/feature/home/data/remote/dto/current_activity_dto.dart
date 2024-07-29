import 'package:equatable/equatable.dart';

class CurrentActivityDto extends Equatable {
  const CurrentActivityDto({this.time, this.activity, this.message, this.detail});

  final String? time;
  final String? activity;
  final String? message;
  final String? detail;

  factory CurrentActivityDto.fromJson(Map<String, dynamic> json) {
    return CurrentActivityDto(
      time: json['time'] as String?,
      activity: json['activity'] as String?,
      message: json['message'] as String?,
      detail: json['detail'] as String?,
    );
  }

  @override
  List<Object?> get props => [time, activity, message, detail];
}
