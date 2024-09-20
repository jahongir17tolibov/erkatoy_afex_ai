import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/creating_account/bloc/create_account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderRadioButton extends StatelessWidget {
  const GenderRadioButton({super.key, required this.gender});

  final String gender;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CreateAccountBloc, CreateAccountState, String?>(
      selector: (state) => state.gender,
      builder: (context, genderState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio<String>.adaptive(
              value: gender,
              groupValue: genderState,
              activeColor: context.themeColors.primary,
              onChanged: (value) {
                context.read<CreateAccountBloc>().add(OnSelectGenderCreateAccEvent(value!));
              },
            ),
            TextView(text: gender, textColor: context.themeColors.onSurface, textSize: 12),
          ],
        );
      },
    );
  }
}
