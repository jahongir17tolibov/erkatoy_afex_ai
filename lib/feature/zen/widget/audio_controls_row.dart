import 'dart:ui';

import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/core/service/permission_service.dart';
import 'package:erkatoy_afex_ai/feature/zen/bloc/zen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'audio_control_icons.dart';
import 'audio_duration_text.dart';

class AudioControlsRow extends StatelessWidget {
  const AudioControlsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ZenBloc, ZenState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: getBorderAll16,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Card(
              elevation: 0,
              margin: EdgeInsets.zero,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: getBorderAll20,
                side: const BorderSide(color: Colors.white),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const AudioDurationText(),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AudioControlIcons(
                          assetPath: ImagesConstants.previousIcon,
                          onPressed: () { PermissionService.audio(granted: () {
                              context.read<ZenBloc>().add(OnBackPressedZenEvent());
                            });
                          },
                        ),
                        getWidthSize20,
                        AudioControlIcons(
                          assetPath: state.audioIsPaused
                              ? ImagesConstants.playIcon
                              : ImagesConstants.pauseIcon,
                          onPressed: () {
                            PermissionService.audio(granted: () {
                              context.read<ZenBloc>().add(OnPlayPausePressedZenEvent());
                            });
                          },
                        ),
                        getWidthSize20,
                        AudioControlIcons(
                          assetPath: ImagesConstants.nextIcon,
                          onPressed: () {
                            PermissionService.audio(granted: () {
                              context.read<ZenBloc>().add(OnNextPressedZenEvent());
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
