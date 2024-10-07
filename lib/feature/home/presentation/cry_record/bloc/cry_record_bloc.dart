import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erkatoy_afex_ai/core/service/permission_service.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/use_case/get_cry_reason_with_audio_use_case.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:path_provider/path_provider.dart';

part 'cry_record_event.dart';
part 'cry_record_state.dart';

class CryRecordBloc extends Bloc<CryRecordEvent, CryRecordState> {
  CryRecordBloc({required this.getCryReasonWithAudioUseCase}) : super(const CryRecordState()) {
    on<OnInitialCryRecordEvent>(_onInitialCryRecordEvent);
    on<OnPressRecordVoiceEvent>(_onPressRecordVoiceEvent);
  }

  final GetCryReasonWithAudioUseCase getCryReasonWithAudioUseCase;

  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();

  FutureOr<void> _onInitialCryRecordEvent(
    OnInitialCryRecordEvent event,
    Emitter<CryRecordState> emit,
  ) async {
    final Directory tempDir = await getTemporaryDirectory();
    await _recorder.openRecorder();
    emit(state.copyWith(
      status: CryRecordStatus.initial,
      recordPath: '${tempDir.path}/cry_record.aac',
    ));
  }

  FutureOr<void> _onPressRecordVoiceEvent(
    OnPressRecordVoiceEvent event,
    Emitter<CryRecordState> emit,
  ) async {
    final audioRecord = await PermissionService.audioRecordingGranted();
    if (audioRecord) {
      if (state.isRecording) {
        emit(state.copyWith(isRecording: false));
        await _recorder.stopRecorder().whenComplete(() async {
          await _uploadRecordedAudioAndGetCryReason(emit);
        });
      } else {
        emit(state.copyWith(isRecording: true, cryReason: 'Eshitilmoqda...'));
        await _recorder.startRecorder(toFile: state.recordPath);
      }
    }
  }

  FutureOr<void> _uploadRecordedAudioAndGetCryReason(Emitter<CryRecordState> emit) async {
    emit(state.copyWith(status: CryRecordStatus.onLoading));
    if (state.recordPath.isNotEmpty) {
      final File file = File(state.recordPath);
      await getCryReasonWithAudioUseCase.execute(file).then((result) {
        if (result.errorMessage == null) {
          emit(state.copyWith(cryReason: result.data!, status: CryRecordStatus.onSuccess));
        } else {
          emit(state.copyWith(cryReason: result.errorMessage!, status: CryRecordStatus.onError));
        }
      });
    }
  }

  @override
  Future<void> close() {
    _recorder.closeRecorder();
    return super.close();
  }
}
