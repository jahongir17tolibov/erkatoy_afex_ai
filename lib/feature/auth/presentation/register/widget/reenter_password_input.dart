import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/erkatoy_text_field.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
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
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextView(
              text: 'Parolni tasdiqlang',
              textSize: 12,
              textColor: context.themeColors.onSurface,
            ),
            getHeightSize6,
            ErkatoyTextField.passwordMode(
              hintText: 'Parolni qayta kiriting',
              controller: controller,
              obscureText: state.reObscureState,
              focusNode: focusNode,
              inputActionIsNext: false,
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<RegisterBloc>().add(OnReObscurePressedRegisterEvent());
                },
                icon: Icon(
                  !state.reObscureState ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
              validator: (value) {
                if (value!.length < 8) return 'Parolning uzunligi 8 tadan kam bo`lmasligi kerak!';
                if (value != state.password) return 'Qayta kiritilgan parol noto`g`ri';
                return null;
              },
            ),
          ],
        );
      },
    );
  }
}
