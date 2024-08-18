import 'package:equatable/equatable.dart';

class ChildInfo extends Equatable {
  const ChildInfo({
    this.message,
    this.gender,
    this.weight,
    this.birthdayDate,
    this.detail,
  });

  final String? message;
  final String? gender;
  final double? weight;
  final String? birthdayDate;
  final String? detail;

  @override
  List<Object?> get props => [message, gender, weight, birthdayDate, detail];
}
