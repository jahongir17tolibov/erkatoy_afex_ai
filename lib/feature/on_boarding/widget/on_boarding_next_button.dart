import 'package:erkatoy_afex_ai/design_system/components/erkatoy_button.dart';
import 'package:erkatoy_afex_ai/design_system/components/scale_on_press_button.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/register/register_screen.dart';
import 'package:erkatoy_afex_ai/feature/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OnBoardingCubit, OnBoardingState, int>(
      selector: (state) => state.pageIndex,
      builder: (context, index) {
        return ScaleOnPress(
          child: ErkatoyButton(
            onPressed: () async {
              index == 2
                  ? await context
                      .read<OnBoardingCubit>()
                      .onBoardingCompleted()
                      .whenComplete(() => RegisterScreen.open(context))
                  : onPressed.call();
            },
            buttonHeight: 48,
            text: 'Davom etish',
            buttonColor: context.themeColors.primary,
            textColor: context.themeColors.onPrimary,
            borderRadius: 12,
          ),
        );
      },
    );
  }
}
