import 'package:erkatoy_afex_ai/design_system/components/erkatoy_button.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/register/register_screen.dart';
import 'package:erkatoy_afex_ai/feature/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OnBoardingCubit, OnBoardingState, int>(
      selector: (state) => state.pageIndex,
      builder: (context, index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          height: index == 2 ? 0 : 48,
          child: ErkatoyButton.outlined(
            onPressed: () async {
              await context.read<OnBoardingCubit>().onBoardingCompleted().whenComplete(() {
                RegisterScreen.open(context);
              });
            },
            elevation: 0,
            text: 'O`tkazib yuborish',
            borderRadius: 12,
            textColor: context.themeColors.primary,
            boldStyledTextEnabled: true,
            borderSideColor: Colors.transparent,
          ),
        );
      },
    );
  }
}
