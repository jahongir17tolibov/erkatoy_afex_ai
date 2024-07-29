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
    on<OnObscurePressedLoginEvent>(_onObscurePressedLoginEvent);
    on<OnLoginBtnPressedEvent>(_onLoginBtnPressedEvent);
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
    emit(state.copyWith(onLoading: true));
    await loginUseCase
        .execute(phone: event.phoneNumber, password: event.password)
        .then((result) async {
      if (result.errorMessage == null) {
        emit(state.copyWith(
          status: LoginStatus.onShowMessage,
          message: '${event.phoneNumber} raqam bilan kirdingiz!',
          onLoading: false,
        ));
        await Future.delayed(const Duration(milliseconds: 1700), () {
          emit(state.copyWith(status: LoginStatus.onSuccessful));
        });
      } else {
        emit(state.copyWith(
          status: LoginStatus.onShowMessage,
          message: result.errorMessage,
          onLoading: false,
        ));
      }
    });
    emit(state.copyWith(onLoading: null));
  }
}
