import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erkatoy_afex_ai/core/service/permission_service.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/use_case/get_cry_reason_with_audio_use_case.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/use_case/get_current_activity_use_case.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.getCurrentActivityUseCase,
    required this.getCryReasonWithAudioUseCase,
  }) : super(const HomeState()) {
    on<OnGetCurrentActivityHomeEvent>(_onGetCurrentActivityHomeEvent);
    on<OnPressRecordVoiceHomeEvent>(_onPressRecordVoiceHomeEvent);
    on<OnListenRecordedVoiceHomeEvent>(_onListenRecordedVoiceHomeEvent);
  }

  final GetCurrentActivityUseCase getCurrentActivityUseCase;
  final GetCryReasonWithAudioUseCase getCryReasonWithAudioUseCase;

  final FlutterSoundRecorder recorder = FlutterSoundRecorder();
  final FlutterSoundPlayer player = FlutterSoundPlayer();

  FutureOr<void> _onGetCurrentActivityHomeEvent(
    OnGetCurrentActivityHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    await _initializeRecordAudio(emit);
    await getCurrentActivityUseCase.execute().then((result) {
      emit(state.copyWith(
        currentActivity: result.errorMessage == null ? result.data! : result.errorMessage!,
      ));
    });
  }

  FutureOr<void> _onPressRecordVoiceHomeEvent(
    OnPressRecordVoiceHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    final audioRecord = await PermissionService.audioRecordingGranted();
    if (audioRecord) {
      if (state.isRecording) {
        emit(state.copyWith(isRecording: false));
        await recorder.stopRecorder().whenComplete(() async {
          await _uploadRecordedAudioAndGetCryReason(emit);
        });
      } else {
        emit(state.copyWith(isRecording: true));
        await recorder.startRecorder(toFile: state.recordPath);
      }
    }
  }

  FutureOr<void> _onListenRecordedVoiceHomeEvent(
    OnListenRecordedVoiceHomeEvent event,
    Emitter<HomeState> emit,
  ) async {}

  FutureOr<void> _initializeRecordAudio(Emitter<HomeState> emit) async {
    final Directory tempDir = await getTemporaryDirectory();
    await recorder.openRecorder();
    await player.openPlayer();
    emit(state.copyWith(recordPath: '${tempDir.path}/cry_record.aac'));
  }

  FutureOr<void> _uploadRecordedAudioAndGetCryReason(Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    if (state.recordPath.isNotEmpty) {
      final File file = File(state.recordPath);
      await getCryReasonWithAudioUseCase.execute(file).then((result) {
        if (result.errorMessage == null) {
          emit(state.copyWith(cryReason: result.data!, isLoading: false));
        } else {
          emit(state.copyWith(cryReason: result.errorMessage!, isLoading: false));
        }
      });
    }
  }
}
