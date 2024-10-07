import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/svg_image_view.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/cry_record/bloc/cry_record_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecordingStatusIcon extends StatelessWidget {
  const RecordingStatusIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CryRecordBloc, CryRecordState, bool>(
      selector: (state) => state.status == CryRecordStatus.onLoading,
      builder: (context, onLoading) {
        return const SvgImageView(ImagesConstants.recordImgWithLogo);
      },
    );
  }
}
