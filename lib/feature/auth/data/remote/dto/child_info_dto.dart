import 'package:equatable/equatable.dart';
import 'package:erkatoy_afex_ai/core/base/base_functions.dart';

class ChildInfoDto extends Equatable {
  const ChildInfoDto({
    required this.message,
    this.userId,
    this.gender,
    this.weight,
    this.birthdayDate,
    this.detail,
  });

  final String? message;
  final String? userId;
  final String? gender;
  final num? weight;
  final String? birthdayDate;
  final String? detail;

  factory ChildInfoDto.fromJson(Map<String, dynamic> json) {
    return ChildInfoDto(
      message: json['message'] as String?,
      userId: json['user_id'] as String?,
      gender: json['gender'] as String?,
      weight: json['weight'] as num?,
      birthdayDate: json['birthday'] as String?,
      detail: json['detail'] as String?,
    );
  }

  @override
  List<Object?> get props => [message, userId, gender, weight, birthdayDate, detail];
}
