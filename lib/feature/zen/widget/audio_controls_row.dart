import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/feature/zen/bloc/zen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'audio_control_icons.dart';

class AudioControlsRow extends StatelessWidget {
  const AudioControlsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ZenBloc, ZenState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AudioControlIcons(
              assetPath: ImagesConstants.backIcon,
              onPressed: () {
                context.read<ZenBloc>().add(OnBackPressedZenEvent());
              },
            ),
            AudioControlIcons(
              assetPath: state.audioIsPaused ? ImagesConstants.playIcon : ImagesConstants.pauseIcon,
              onPressed: () {
                context.read<ZenBloc>().add(OnPlayPausePressedZenEvent());
              },
            ),
            AudioControlIcons(
              assetPath: ImagesConstants.nextIcon,
              onPressed: () {
                context.read<ZenBloc>().add(OnNextPressedZenEvent());
              },
            ),
          ],
        );
      },
    );
  }
}
