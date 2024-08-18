part of 'create_account_bloc.dart';

enum CreateAccountStatus { pure, onSuccessfulCreated, onSuccessfulUpdated, onShowMessage }

class CreateAccountState extends Equatable {
  const CreateAccountState({
    this.status = CreateAccountStatus.pure,
    this.birthdayDate,
    this.gender,
    this.onLoading,
    this.message = '',
    this.weight = '',
  });

  final CreateAccountStatus status;
  final DateTime? birthdayDate;
  final String? gender;
  final bool? onLoading;
  final String message;
  final String weight;

  CreateAccountState copyWith({
    CreateAccountStatus? status,
    DateTime? birthdayDate,
    String? gender,
    bool? onLoading,
    String? message,
    String? weight,
  }) =>
      CreateAccountState(
        status: status ?? this.status,
        birthdayDate: birthdayDate ?? this.birthdayDate,
        gender: gender ?? this.gender,
        onLoading: onLoading ?? this.onLoading,
        message: message ?? this.message,
        weight: weight ?? this.weight,
      );

  @override
  List<Object?> get props => [status, birthdayDate, gender, onLoading, message, weight];
}
