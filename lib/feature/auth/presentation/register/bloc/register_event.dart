part of 'register_bloc.dart';

sealed class RegisterEvent {}

final class OnObscurePressedRegisterEvent extends RegisterEvent {}

final class OnReObscurePressedRegisterEvent extends RegisterEvent {}

final class OnRegisterBtnPressedEvent extends RegisterEvent {}

final class OnInputPhoneRegisterEvent extends RegisterEvent {
  OnInputPhoneRegisterEvent(this.value);

  final String value;
}

final class OnInputPasswordRegisterEvent extends RegisterEvent {
  OnInputPasswordRegisterEvent(this.value);

  final String value;
}

final class OnInputRePasswordRegisterEvent extends RegisterEvent {
  OnInputRePasswordRegisterEvent(this.value);

  final String value;
}

final class OnValidateChangedRegisterEvent extends RegisterEvent {
  OnValidateChangedRegisterEvent(this.validate);

  final bool validate;
}
