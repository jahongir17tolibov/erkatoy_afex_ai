import 'package:erkatoy_afex_ai/core/base/base_extensions.dart';
import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/default_app_bar.dart';
import 'package:erkatoy_afex_ai/design_system/components/svg_image_view.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/cry_record/widget/cry_recording_button.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/cry_record/widget/recording_rotation_animation_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/cry_record_bloc.dart';

class CryRecordScreen extends StatefulWidget {
  const CryRecordScreen({super.key});

  static const String routePath = '/cry_record';
  static const String routeName = 'cry_record';
  static const String routeBottom = '/cry_record_bottom';

  static void open(BuildContext context) {
    context.pushNamed(routeName);
  }

  @override
  State<CryRecordScreen> createState() => _CryRecordScreenState();
}

class _CryRecordScreenState extends State<CryRecordScreen> {
  @override
  void initState() {
    Future.microtask(() => context.read<CryRecordBloc>().add(OnInitialCryRecordEvent()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(titleText: 'Yordamchi AI', backButtonEnabled: true),
      body: Padding(
        padding: getPaddingAll20,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              const SvgImageView(ImagesConstants.recordImgWithLogo),
              getHeightSize32,
              const RecordingRotationAnimationImg(),
              BlocSelector<CryRecordBloc, CryRecordState, String>(
                selector: (state) => state.cryReason,
                builder: (context, reason) {
                  return TextView.boldStyle(
                    text: reason.capitalize,
                    textColor: context.themeColors.onSurface,
                    textSize: 24,
                  );
                },
              ),
              const Spacer(),
              const CryRecordingButton(),
            ],
          ),
        ),
      ),
    );
  }
}
