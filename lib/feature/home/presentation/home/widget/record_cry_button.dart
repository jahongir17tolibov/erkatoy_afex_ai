import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/scale_on_press_button.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class RecordCryButton extends StatelessWidget {
  const RecordCryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, bool>(
      selector: (state) => state.isRecording,
      builder: (context, isRecording) {
        return ScaleOnPress(
          child: GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(OnPressRecordVoiceHomeEvent());
            },
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: context.themeColors.surface.withOpacity(0.8),
                borderRadius: getBorderAll16,
              ),
              child: Center(
                child: !isRecording
                    ? SvgPicture.asset(
                        ImagesConstants.voiceIconSvg,
                        width: 48,
                        height: 48,
                        colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                      )
                    : Icon(Icons.square_rounded, color: context.themeColors.error),
              ),
            ),
          ),
        );
      },
    );
  }
}
