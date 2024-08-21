part of 'login_bloc.dart';

sealed class LoginEvent {}

final class OnObscurePressedLoginEvent extends LoginEvent {}

final class OnLoginBtnPressedEvent extends LoginEvent {}

final class OnInputPhoneLoginEvent extends LoginEvent {
  OnInputPhoneLoginEvent(this.value);

  final String value;
}

final class OnInputPasswordLoginEvent extends LoginEvent {
  OnInputPasswordLoginEvent(this.value);

  final String value;
}

final class OnValidateFormLoginEvent extends LoginEvent {
  OnValidateFormLoginEvent(this.value);

  final bool value;
}
