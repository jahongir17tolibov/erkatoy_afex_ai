import 'package:erkatoy_afex_ai/design_system/components/erkatoy_button.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.validateState});

  final bool validateState;

  @override
  Widget build(BuildContext context) {
    return ErkatoyButton(
      onPressed: validateState
          ? () {
              FocusScope.of(context).unfocus();
              // CreatingAccountScreen.open(context, phone: _phoneEditingController.text, pass: _passwordEditingController.text);
              context.read<LoginBloc>().add(OnLoginBtnPressedEvent());
            }
          : null,
      text: 'Kirish',
      buttonHeight: 48,
      buttonColor: context.themeColors.primary,
      textColor: context.themeColors.onPrimary,
      textSize: 16.textSize(context),
    );
  }
}
