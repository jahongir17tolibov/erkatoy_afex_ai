import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/feature/zen/bloc/zen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AudioDurationText extends StatelessWidget {
  const AudioDurationText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ZenBloc, ZenState, String>(
      selector: (state) => state.liveDuration,
      builder: (context, liveDuration) {
        return Padding(
          padding: getPaddingAll6,
          child: TextView.boldStyle(
            text: liveDuration,
            textSize: 20,
            textColor: Colors.white,
          ),
        );
      },
    );
  }
}
