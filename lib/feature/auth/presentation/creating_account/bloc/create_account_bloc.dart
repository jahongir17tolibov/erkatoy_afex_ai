import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/feature/auth/domain/use_case/login_use_case.dart';
import 'package:erkatoy_afex_ai/feature/auth/domain/use_case/send_child_info_use_case.dart';

part 'create_account_event.dart';

part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc({
    required this.loginUseCase,
    required this.sendChildInfoUseCase,
  }) : super(const CreateAccountState()) {
    on<OnChangeBirthDayDateCreateAccEvent>(_onChangeBirthDayDateEvent);
    on<OnSelectGenderCreateAccEvent>(_onSelectGenderAuthEvent);
    on<OnWeightEditingCreateAccEvent>(_onWeightEditingAuthEvent);
    on<OnStartButtonPressedCreateAccEvent>(_onStartButtonPressedCreateAccEvent);
  }

  final LoginUseCase loginUseCase;
  final SendChildInfoUseCase sendChildInfoUseCase;

  FutureOr<void> _onChangeBirthDayDateEvent(
    OnChangeBirthDayDateCreateAccEvent event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(state.copyWith(birthdayDate: event.date));
  }

  FutureOr<void> _onSelectGenderAuthEvent(
    OnSelectGenderCreateAccEvent event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(state.copyWith(gender: event.gender));
  }

  FutureOr<void> _onWeightEditingAuthEvent(
    OnWeightEditingCreateAccEvent event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(state.copyWith(weight: event.value));
  }

  FutureOr<void> _onStartButtonPressedCreateAccEvent(
    OnStartButtonPressedCreateAccEvent event,
    Emitter<CreateAccountState> emit,
  ) async {
    emit(state.copyWith(onLoading: true));

    final login = await _loginPhoneNumber(emit, phone: event.phone, pass: event.pass);
    if (login != null) {
      await Future.delayed(const Duration(seconds: 3), () async {
        await _sendChildInfo(emit);
      });
    }
    emit(state.copyWith(onLoading: null));
  }

  Future<String?> _loginPhoneNumber(
    Emitter<CreateAccountState> emit, {
    required String phone,
    required String pass,
  }) async {
    return await loginUseCase.execute(phone: phone, password: pass).then((result) async {
      if (result.errorMessage == null) {
        return result.data!;
      }
      emit(state.copyWith(
        status: CreateAccountStatus.onShowMessage,
        message: result.errorMessage!,
        onLoading: false,
      ));
      return null;
    });
  }

  Future<void> _sendChildInfo(Emitter<CreateAccountState> emit) async {
    await sendChildInfoUseCase
        .execute(
      birthDayDate: normalDateTimeFormat(state.birthdayDate!),
      gender: _formatGenderText(),
      weight: double.parse(state.weight),
    )
        .then((result) async {
      printOnDebug('_sendChildInfo: $result');
      if (result.errorMessage == null) {
        emit(state.copyWith(
          status: CreateAccountStatus.onShowMessage,
          message: result.data!,
          onLoading: false,
        ));
        await Future.delayed(const Duration(milliseconds: 1700), () {
          emit(state.copyWith(status: CreateAccountStatus.onSuccess));
        });
      } else {
        emit(state.copyWith(
          status: CreateAccountStatus.onShowMessage,
          message: result.errorMessage!,
          onLoading: false,
        ));
        printOnDebug('on else: ${state.status}');
      }
    });
  }

  String _formatGenderText() {
    return state.gender! == 'O`g`il' ? 'boy' : 'girl';
  }
}
