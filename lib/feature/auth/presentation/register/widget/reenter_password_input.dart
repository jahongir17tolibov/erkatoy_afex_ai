import 'package:erkatoy_afex_ai/design_system/components/erkatoy_text_field.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReEnterPasswordInput extends StatelessWidget {
  const ReEnterPasswordInput({
    super.key,
    required this.focusNode,
    required this.controller,
  });

  final FocusNode focusNode;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return ErkatoyTextField.passwordMode(
          hintText: 'Parolni qayta kiriting',
          controller: controller,
          obscureText: state.reObscureState,
          focusNode: focusNode,
          inputActionIsNext: false,
          onPressSuffixBtn: () {
            context.read<RegisterBloc>().add(OnReObscurePressedRegisterEvent());
          },
          validator: (value) {
            if (value!.length < 8) return 'Parolning uzunligi 8 tadan kam bo`lmasligi kerak!';
            if (value != state.password) return 'Qayta kiritilgan parol noto`g`ri';
            return null;
          },
        );
      },
    );
  }
}
