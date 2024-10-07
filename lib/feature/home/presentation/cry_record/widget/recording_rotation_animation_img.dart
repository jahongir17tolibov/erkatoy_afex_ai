import 'package:erkatoy_afex_ai/core/constants/app_constants.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/cry_record/bloc/cry_record_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class RecordingRotationAnimationImg extends StatelessWidget {
  const RecordingRotationAnimationImg({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CryRecordBloc, CryRecordState, bool>(
      selector: (state) => state.isRecording,
      builder: (context, state) {
        return LottieBuilder.asset(
          AppConstants.recordingWaveLottie,
          animate: true,
          height: state ? null : 0,
          addRepaintBoundary: true,
        );
      },
    );
  }
}
