import 'package:erkatoy_afex_ai/design_system/components/erkatoy_button.dart';
import 'package:erkatoy_afex_ai/design_system/components/scale_on_press_button.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/cry_record/bloc/cry_record_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryRecordingButton extends StatelessWidget {
  const CryRecordingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryRecordBloc, CryRecordState>(
      builder: (context, state) {
        return state.status == CryRecordStatus.onLoading
            ? const SizedBox.shrink()
            : ScaleOnPress(
                child: ErkatoyButton(
                  onPressed: () {
                    context.read<CryRecordBloc>().add(OnPressRecordVoiceEvent());
                  },
                  text: _buttonTextOnState(state),
                  textColor: context.themeColors.onPrimary,
                  buttonColor: context.themeColors.primary,
                  boldStyledTextEnabled: true,
                  elevation: 0,
                  borderRadius: 12,
                  buttonHeight: 48,
                ),
              );
      },
    );
  }

  String _buttonTextOnState(CryRecordState state) {
    if (state.cryReason.isEmpty) {
      return 'Boshlash';
    } else if (state.isRecording) {
      return 'To`xtatish';
    }
    return 'Yana eshitish';
  }
}
