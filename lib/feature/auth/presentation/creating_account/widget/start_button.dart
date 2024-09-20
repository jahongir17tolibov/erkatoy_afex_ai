import 'package:erkatoy_afex_ai/core/base/base_extensions.dart';
import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/erkatoy_button.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/creating_account/bloc/create_account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key, required this.phone, required this.pass});

  final String phone;
  final String pass;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAccountBloc, CreateAccountState>(
      builder: (context, state) {
        printOnDebug('$phone with $pass');
        final bool buttonState = (state.gender != null) &&
            state.weight.isNotEmpty &&
            (state.birthdayDate != null) &&
            context.getConnectivity;
        return Padding(
          padding: getPaddingAll20,
          child: ErkatoyButton(
            onPressed: buttonState
                ? () {
                    context.unFocusingKeyboard(() async {
                      await Future.delayed(const Duration(milliseconds: 500), () {
                        context.read<CreateAccountBloc>().add(phone.isNotEmpty
                            ? OnStartButtonPressedCreateAccEvent(phone, pass)
                            : OnUpdateChildInfoCreateAccEvent());
                      });
                    });
                  }
                : null,
            text: phone.isNotEmpty ? 'Qani boshladik unda' : 'Saqlash',
            buttonHeight: 48,
            textColor: context.themeColors.onPrimary,
            buttonColor: context.themeColors.primary,
            textSize: 16.textSize(context),
          ),
        );
      },
    );
  }
}
