import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/feature/auth/domain/use_case/get_child_info_use_case.dart';
import 'package:erkatoy_afex_ai/feature/auth/domain/use_case/login_use_case.dart';
import 'package:erkatoy_afex_ai/feature/auth/domain/use_case/send_child_info_use_case.dart';

part 'create_account_event.dart';
part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc({
    required this.loginUseCase,
    required this.sendChildInfoUseCase,
    required this.getChildInfoUseCase,
  }) : super(const CreateAccountState()) {
    on<OnGetChildInfoCreateAccEvent>(_onGetChildInfoCreateAccEvent);
    on<OnChangeBirthDayDateCreateAccEvent>(_onChangeBirthDayDateEvent);
    on<OnSelectGenderCreateAccEvent>(_onSelectGenderAuthEvent);
    on<OnInputWeightCreateAccEvent>(_onInputWeightCreateAccEvent);
    on<OnStartButtonPressedCreateAccEvent>(_onStartButtonPressedCreateAccEvent);
    on<OnUpdateChildInfoCreateAccEvent>(_onUpdateChildInfoCreateAccEvent);
    on<OnValidateFormCreateAccountEvent>(_onValidateFormCreateAccountEvent);
  }

  final LoginUseCase loginUseCase;
  final SendChildInfoUseCase sendChildInfoUseCase;
  final GetChildInfoUseCase getChildInfoUseCase;

  FutureOr<void> _onGetChildInfoCreateAccEvent(
    OnGetChildInfoCreateAccEvent event,
    Emitter<CreateAccountState> emit,
  ) async {
    await getChildInfoUseCase.execute().then((result) {
      if (result.errorMessage == null) {
        emit(state.copyWith(
          weight: result.data!.weight.toString(),
          birthdayDate: parseNormalToDateTime(result.data!.birthdayDate!),
          gender: _deFormatGenderText(result.data!.gender!),
        ));
      } else {
        emit(state.copyWith(
          status: CreateAccountStatus.onShowMessage,
          message: result.errorMessage,
        ));
      }
    });
    emit(state.copyWith(status: CreateAccountStatus.pure));
  }

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

  FutureOr<void> _onInputWeightCreateAccEvent(
    OnInputWeightCreateAccEvent event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(state.copyWith(weight: event.value));
  }

  FutureOr<void> _onStartButtonPressedCreateAccEvent(
    OnStartButtonPressedCreateAccEvent event,
    Emitter<CreateAccountState> emit,
  ) async {
    if (state.status != CreateAccountStatus.onShowMessage) {
      emit(state.copyWith(onLoading: true));

      final login = await _loginPhoneNumber(emit, phone: event.phone, pass: event.pass);
      if (login != null) {
        await Future.delayed(const Duration(seconds: 1), () async {
          await _sendChildInfo(emit);
        });
      }
      emit(state.copyWith(onLoading: null));
    }
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

  FutureOr<void> _onUpdateChildInfoCreateAccEvent(
    OnUpdateChildInfoCreateAccEvent event,
    Emitter<CreateAccountState> emit,
  ) async {
    if (state.status != CreateAccountStatus.onShowMessage) {
      emit(state.copyWith(onLoading: true));
      await _sendChildInfo(emit, isUpdate: true);
      emit(state.copyWith(onLoading: null));
    }
  }

  Future<void> _sendChildInfo(Emitter<CreateAccountState> emit, {bool isUpdate = false}) async {
    await sendChildInfoUseCase
        .execute(
      birthDayDate: normalDateTimeFormat(state.birthdayDate!),
      gender: _formatGenderText(),
      weight: double.parse(state.weight.replaceAll(' kg', '')),
    )
        .then((result) async {
      if (result.errorMessage == null) {
        emit(state.copyWith(
          status: CreateAccountStatus.onShowMessage,
          message: result.data!,
          onLoading: false,
        ));
        await Future.delayed(const Duration(milliseconds: 1700), () {
          emit(state.copyWith(
            status: isUpdate
                ? CreateAccountStatus.onSuccessfulUpdated
                : CreateAccountStatus.onSuccessfulCreated,
          ));
        });
      } else {
        emit(state.copyWith(
          status: CreateAccountStatus.onShowMessage,
          message: result.errorMessage!,
          onLoading: false,
        ));
      }
    });
  }

  String _formatGenderText() {
    return state.gender! == 'O`g`il bola' ? 'boy' : 'girl';
  }

  String _deFormatGenderText(String gender) {
    return gender == 'boy' ? 'O`g`il bola' : 'Qiz bola';
  }

  FutureOr<void> _onValidateFormCreateAccountEvent(
    OnValidateFormCreateAccountEvent event,
    Emitter<CreateAccountState> emit,
  ) {
    emit(state.copyWith(isValid: event.isValid));
  }
}
