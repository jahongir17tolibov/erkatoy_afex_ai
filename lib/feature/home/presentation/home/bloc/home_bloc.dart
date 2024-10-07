import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/use_case/get_cry_reason_with_audio_use_case.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/use_case/get_current_activity_use_case.dart';
import 'package:flutter_sound/flutter_sound.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.getCurrentActivityUseCase,
    required this.getCryReasonWithAudioUseCase,
  }) : super(const HomeState()) {
    on<OnGetCurrentActivityHomeEvent>(_onGetCurrentActivityHomeEvent);
    on<OnBottomNavChangedHomeEvent>(_onBottomNavChangedHomeEvent);
  }

  final GetCurrentActivityUseCase getCurrentActivityUseCase;
  final GetCryReasonWithAudioUseCase getCryReasonWithAudioUseCase;

  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();

  FutureOr<void> _onGetCurrentActivityHomeEvent(
    OnGetCurrentActivityHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    await getCurrentActivityUseCase.execute().then((result) {
      final String activityTime = '${result.data?.time}';
      emit(state.copyWith(
        currentTime: activityTime,
        currentActivity:
            result.errorMessage == null ? result.data!.activity : result.errorMessage ?? '',
      ));
    });
  }

  FutureOr<void> _onBottomNavChangedHomeEvent(
    OnBottomNavChangedHomeEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(currentPageIndex: event.index));
  }

  @override
  Future<void> close() {
    _recorder.closeRecorder();
    return super.close();
  }
}
