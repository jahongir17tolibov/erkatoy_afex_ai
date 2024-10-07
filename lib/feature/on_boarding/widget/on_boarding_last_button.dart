import 'package:erkatoy_afex_ai/design_system/components/erkatoy_button.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/register/register_screen.dart';
import 'package:erkatoy_afex_ai/feature/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingLastButton extends StatelessWidget {
  const OnBoardingLastButton({super.key, required this.isLast});

  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isLast ? 48 : 0,
      duration: const Duration(milliseconds: 400),
      child: ErkatoyButton(
        onPressed: () async {
          await context.read<OnBoardingCubit>().onBoardingCompleted().whenComplete(() {
            RegisterScreen.open(context);
          });
        },
        text: 'Qani boshladik unda',
        buttonHeight: 48,
        borderRadius: 12,
        textSize: 16,
        textColor: context.themeColors.surface,
        buttonColor: context.themeColors.primary,
        elevation: 0,
        boldStyledTextEnabled: true,
      ),
    );
  }
}
