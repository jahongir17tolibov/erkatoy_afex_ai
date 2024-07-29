import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/entity/health.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/use_case/get_health_tips_use_case.dart';

part 'health_event.dart';
part 'health_state.dart';

class HealthBloc extends Bloc<HealthEvent, HealthState> {
  HealthBloc({required this.getHealthTipsUseCase}) : super(const HealthState()) {
    on<OnGetHealthTipsListEvent>(_onGetHealthTipsListEvent);
    on<OnExpandListItemHealthEvent>(_onExpandListItemHealthEvent);
  }

  final GetHealthTipsUseCase getHealthTipsUseCase;

  FutureOr<void> _onGetHealthTipsListEvent(
    OnGetHealthTipsListEvent event,
    Emitter<HealthState> emit,
  ) async {
    emit(state.copyWith(status: HealthStatus.onLoading));
    await getHealthTipsUseCase.execute(10).then((result) {
      if (result.errorMessage == null) {
        emit(state.copyWith(status: HealthStatus.onSuccess, healthTipsList: result.data!));
      } else {
        emit(state.copyWith(status: HealthStatus.onError));
        emit(state.copyWith(status: HealthStatus.onShowMessage, message: result.errorMessage!));
      }
    });
  }

  FutureOr<void> _onExpandListItemHealthEvent(
    OnExpandListItemHealthEvent event,
    Emitter<HealthState> emit,
  ) {
    final updatedHealthList = state.healthTipsList.map((model) {
      if (model.disease == event.item) {
        return model.copyWith(isExpanded: !model.isExpanded);
      }
      return model;
    }).toList();
    emit(state.copyWith(healthTipsList: updatedHealthList));
  }
}
