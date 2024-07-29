part of 'create_account_bloc.dart';

sealed class CreateAccountEvent {}

final class OnChangeBirthDayDateCreateAccEvent extends CreateAccountEvent {
  OnChangeBirthDayDateCreateAccEvent(this.date);

  final DateTime date;
}

final class OnSelectGenderCreateAccEvent extends CreateAccountEvent {
  OnSelectGenderCreateAccEvent(this.gender);

  final String gender;
}

final class OnWeightEditingCreateAccEvent extends CreateAccountEvent {
  OnWeightEditingCreateAccEvent(this.value);

  final String value;
}

final class OnStartButtonPressedCreateAccEvent extends CreateAccountEvent {
  OnStartButtonPressedCreateAccEvent(this.phone, this.pass);

  final String phone;
  final String pass;
}
