import 'package:erkatoy_afex_ai/core/base/base_extensions.dart';
import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/erkatoy_button.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginBloc, LoginState, bool>(
      selector: (state) => state.isValid,
      builder: (context, validateState) {
        return Padding(
          padding: getPaddingAll20,
          child: ErkatoyButton(
            onPressed: validateState
                ? () {
                    // CreatingAccountScreen.open(context, phone: _phoneEditingController.text, pass: _passwordEditingController.text);
                    context.unFocusingKeyboard(() async {
                      await Future.delayed(const Duration(milliseconds: 500), () {
                        context.read<LoginBloc>().add(OnLoginBtnPressedEvent());
                      });
                    });
                  }
                : null,
            text: 'Kirish',
            buttonHeight: 48,
            buttonColor: context.themeColors.primary,
            textColor: context.themeColors.onPrimary,
            textSize: 16.textSize(context),
          ),
        );
      },
    );
  }
}
