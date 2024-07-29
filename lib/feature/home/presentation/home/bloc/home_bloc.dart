import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/use_case/get_current_activity_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.getCurrentActivityUseCase}) : super(const HomeState()) {
    on<OnGetCurrentActivityHomeEvent>(_onGetCurrentActivityHomeEvent);
  }

  final GetCurrentActivityUseCase getCurrentActivityUseCase;

  FutureOr<void> _onGetCurrentActivityHomeEvent(
    OnGetCurrentActivityHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    await getCurrentActivityUseCase.execute().then((result) {
      emit(state.copyWith(
        currentActivity: result.errorMessage == null ? result.data! : result.errorMessage!,
      ));
    });
  }
}
