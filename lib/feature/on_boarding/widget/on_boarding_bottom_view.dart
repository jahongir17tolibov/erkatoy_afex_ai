import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/feature/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'on_boarding_next_button.dart';
import 'on_boarding_skip_button.dart';
import 'page_indicator.dart';

class OnBoardingBottomView extends StatelessWidget {
  const OnBoardingBottomView({super.key, required this.onNextButtonPressed});

  final VoidCallback onNextButtonPressed;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OnBoardingCubit, OnBoardingState, bool>(
      selector: (state) => state.pageIndex == (state.onBoardingDataList.length - 1),
      builder: (context, isLastItem) {
        return Padding(
          padding: getPaddingAll10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const PageIndicator(),
              getHeightSize20,
              OnBoardingNextButton(onPressed: onNextButtonPressed),
              getHeightSize6,
              const OnBoardingSkipButton(),
              getHeightSize6,
            ],
          ),
        );
      },
    );
  }
}
