import 'package:equatable/equatable.dart';

class HealthDto extends Equatable {
  const HealthDto({this.disease, this.cause, this.solution});

  final String? disease;
  final String? cause;
  final String? solution;

  factory HealthDto.fromJson(Map<String, dynamic> json) {
    return HealthDto(
      disease: json['Disease'] as String?,
      cause: json['Cause'] as String?,
      solution: json['Solution'] as String?,
    );
  }

  @override
  List<Object?> get props => [disease, cause, solution];
}
