import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/feature/auth/domain/use_case/register_use_case.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required this.registerUseCase}) : super(const RegisterState()) {
    on<OnInputPhoneRegisterEvent>(_onInputPhoneRegisterEvent);
    on<OnInputPasswordRegisterEvent>(_onInputPasswordRegisterEvent);
    on<OnInputRePasswordRegisterEvent>(_onInputRePasswordRegisterEvent);
    on<OnRegisterBtnPressedEvent>(_onRegisterBtnPressedAuthEvent);
    on<OnObscurePressedRegisterEvent>(_onObscurePressedAuthEvent);
    on<OnReObscurePressedRegisterEvent>(_onReObscurePressedAuthEvent);
    on<OnValidateChangedRegisterEvent>(_onValidateChangedRegisterEvent);
  }

  final RegisterUseCase registerUseCase;

  FutureOr<void> _onObscurePressedAuthEvent(
    OnObscurePressedRegisterEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(obscureState: !state.obscureState));
  }

  FutureOr<void> _onReObscurePressedAuthEvent(
    OnReObscurePressedRegisterEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(reObscureState: !state.reObscureState));
  }

  FutureOr<void> _onRegisterBtnPressedAuthEvent(
    OnRegisterBtnPressedEvent event,
    Emitter<RegisterState> emit,
  ) async {
    if (state.status != RegisterStatus.onShowMessage) {
      emit(state.copyWith(onLoading: true));
      await registerUseCase
          .execute(phone: state.phoneNumber, password: state.password)
          .then((result) async {
        if (result.errorMessage == null) {
          printOnDebug(result.data);
          emit(state.copyWith(
            status: RegisterStatus.onShowMessage,
            message: '${result.data!} raqam muvaffaqiyatli ro`yxatdan o`tdi!',
            onLoading: false,
          ));
          await Future.delayed(const Duration(milliseconds: 1700), () {
            emit(state.copyWith(status: RegisterStatus.onSuccessful));
          });
        } else {
          emit(state.copyWith(
            status: RegisterStatus.onShowMessage,
            message: result.errorMessage,
            onLoading: false,
          ));
        }
      });
      emit(state.copyWith(onLoading: null));
    }
  }

  FutureOr<void> _onInputPhoneRegisterEvent(
    OnInputPhoneRegisterEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(phoneNumber: event.value));
  }

  FutureOr<void> _onInputPasswordRegisterEvent(
    OnInputPasswordRegisterEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(password: event.value));
  }

  FutureOr<void> _onInputRePasswordRegisterEvent(
    OnInputRePasswordRegisterEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(rePassword: event.value));
  }

  FutureOr<void> _onValidateChangedRegisterEvent(
    OnValidateChangedRegisterEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(formIsValidate: event.validate));
  }
}
