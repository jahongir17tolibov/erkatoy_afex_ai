import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/blur_outer_container.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/creating_account/bloc/create_account_bloc.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/creating_account/widget/change_birth_date_button.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/creating_account/widget/select_child_gender.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/creating_account/widget/weight_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({
    super.key,
    required this.weightEditingController,
    required this.isUpdatingAccount,
    required this.formKey,
  });

  final bool isUpdatingAccount;
  final TextEditingController weightEditingController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlurOuterContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextView(
            text: 'Formani ${isUpdatingAccount ? 'o`zgartiring' : 'to`ldiring'}',
            textColor: context.themeColors.onSurface,
            textSize: 20,
            fontWeight: FontWeight.w500,
          ),
          getHeightSize20,
          const ChangeBirthDateButton(),
          getHeightSize16,
          Form(
            key: formKey,
            onChanged: () {
              _onFormChanged(context);
            },
            child: WeightInput(controller: weightEditingController),
          ),
          getHeightSize20,
          const SelectChildGender(),
        ],
      ),
    );
  }

  void _onFormChanged(BuildContext context) {
    if (weightEditingController.text.isNotEmpty) {
      final isValid = formKey.currentState?.validate() ?? false;
      context.read<CreateAccountBloc>().add(OnValidateFormCreateAccountEvent(isValid));
    }
  }
}
