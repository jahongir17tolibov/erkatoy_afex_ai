import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erkatoy_afex_ai/feature/auth/domain/use_case/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.loginUseCase,
  }) : super(const LoginState()) {
    on<OnInputPhoneLoginEvent>(_onInputPhoneLoginEvent);
    on<OnInputPasswordLoginEvent>(_onInputPasswordLoginEvent);
    on<OnObscurePressedLoginEvent>(_onObscurePressedLoginEvent);
    on<OnLoginBtnPressedEvent>(_onLoginBtnPressedEvent);
    on<OnValidateFormLoginEvent>(_onValidateFormLoginEvent);
  }

  final LoginUseCase loginUseCase;

  FutureOr<void> _onObscurePressedLoginEvent(
    OnObscurePressedLoginEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(obscureState: !state.obscureState));
  }

  FutureOr<void> _onLoginBtnPressedEvent(
    OnLoginBtnPressedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: LoginStatus.onShowDialog));
    await loginUseCase
        .execute(phone: state.phoneNumber, password: state.password)
        .then((result) async {
      emit(state.copyWith(status: LoginStatus.onHideDialog));
      if (result.errorMessage == null) {
        emit(state.copyWith(
          status: LoginStatus.onShowMessage,
          message: '${state.phoneNumber} raqam bilan kirdingiz!',
        ));
        await Future.delayed(const Duration(milliseconds: 1700), () {
          emit(state.copyWith(status: LoginStatus.onSuccessful));
        });
      } else {
        emit(state.copyWith(
          status: LoginStatus.onShowMessage,
          message: result.errorMessage,
        ));
      }
    });
    emit(state.copyWith(status: LoginStatus.pure));
  }

  FutureOr<void> _onInputPhoneLoginEvent(
    OnInputPhoneLoginEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(phoneNumber: event.value));
  }

  FutureOr<void> _onInputPasswordLoginEvent(
    OnInputPasswordLoginEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(password: event.value));
  }

  FutureOr<void> _onValidateFormLoginEvent(
    OnValidateFormLoginEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(isValid: event.value));
  }
}
