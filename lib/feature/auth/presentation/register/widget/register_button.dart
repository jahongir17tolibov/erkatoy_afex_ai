import 'package:erkatoy_afex_ai/design_system/components/erkatoy_button.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RegisterBloc, RegisterState, bool>(
      selector: (state) => state.formIsValidate,
      builder: (context, formIsValidate) {
        return ErkatoyButton(
          onPressed: formIsValidate
              ? () {
                  FocusScope.of(context).unfocus();
                  // HomeScreen.open(context);
                  // CreatingAccountScreen.open(
                  //   context,
                  //   phone: _phoneEditingController.text,
                  //   pass: _passwordEditingController.text,
                  // );
                  context.read<RegisterBloc>().add(OnRegisterBtnPressedEvent());
                }
              : null,
          text: 'Ro`yxatdan o`tish',
          buttonHeight: 48,
          buttonColor: context.themeColors.primary,
          textColor: context.themeColors.onPrimary,
          textSize: 16.textSize(context),
        );
      },
    );
  }
}
