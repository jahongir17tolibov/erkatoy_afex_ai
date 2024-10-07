import 'package:erkatoy_afex_ai/feature/auth/presentation/register/register_screen.dart';
import 'package:erkatoy_afex_ai/feature/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:erkatoy_afex_ai/feature/on_boarding/widget/on_boarding_last_button.dart';
import 'package:erkatoy_afex_ai/feature/on_boarding/widget/on_boarding_page_navigator_button.dart';
import 'package:erkatoy_afex_ai/feature/on_boarding/widget/page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingBottomView extends StatelessWidget {
  const OnBoardingBottomView({super.key, required this.onNextButtonPressed});

  final VoidCallback onNextButtonPressed;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OnBoardingCubit, OnBoardingState, bool>(
      selector: (state) => state.pageIndex == (state.onBoardingDataList.length - 1),
      builder: (context, isLastItem) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: isLastItem
              ? OnBoardingLastButton(isLast: isLastItem)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    OnBoardingPageNavigatorButton(
                      onPressed: () async {
                        await context
                            .read<OnBoardingCubit>()
                            .onBoardingCompleted()
                            .whenComplete(() {
                          RegisterScreen.open(context);
                        });
                      },
                      text: 'O`tkazish',
                    ),
                    const PageIndicator(),
                    OnBoardingPageNavigatorButton(
                      onPressed: onNextButtonPressed,
                      text: 'Keyingisi',
                    ),
                  ],
                ),
        );
      },
    );
  }
}
