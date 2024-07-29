part of 'create_account_bloc.dart';

enum CreateAccountStatus { pure, onSuccess, onShowMessage }

class CreateAccountState extends Equatable {
  const CreateAccountState({
    this.status = CreateAccountStatus.pure,
    this.birthdayDate,
    this.gender,
    this.weight = '',
    this.onLoading,
    this.message = '',
  });

  final CreateAccountStatus status;
  final DateTime? birthdayDate;
  final String? gender;
  final String weight;
  final bool? onLoading;
  final String message;

  CreateAccountState copyWith({
    CreateAccountStatus? status,
    DateTime? birthdayDate,
    String? gender,
    String? weight,
    bool? onLoading,
    String? message,
  }) =>
      CreateAccountState(
        status: status ?? this.status,
        birthdayDate: birthdayDate ?? this.birthdayDate,
        gender: gender ?? this.gender,
        weight: weight ?? this.weight,
        onLoading: onLoading ?? this.onLoading,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [status, birthdayDate, gender, weight, onLoading, message];
}
