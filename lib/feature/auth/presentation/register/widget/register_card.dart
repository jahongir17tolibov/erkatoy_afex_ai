import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/blur_outer_container.dart';
import 'package:erkatoy_afex_ai/design_system/components/phone_input.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/register/widget/already_signed_text_button.dart';
import 'package:flutter/material.dart';

import 'reenter_password_input.dart';
import 'register_password_input.dart';

class RegisterCard extends StatelessWidget {
  const RegisterCard({
    super.key,
    required this.formKey,
    required this.onFormChanged,
    required this.phoneFocusNode,
    required this.phoneEditingController,
    required this.passwordFocusNode,
    required this.passwordEditingController,
    required this.rePasswordFocusNode,
    required this.rePasswordEditingController,
  });

  final GlobalKey<FormState> formKey;
  final VoidCallback onFormChanged;
  final FocusNode phoneFocusNode;
  final TextEditingController phoneEditingController;
  final FocusNode passwordFocusNode;
  final TextEditingController passwordEditingController;
  final FocusNode rePasswordFocusNode;
  final TextEditingController rePasswordEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        BlurOuterContainer(
          child: Column(
            children: <Widget>[
              TextView(
                text: 'Ro`yxatdan o`tish',
                textColor: context.themeColors.onSurface,
                textSize: 20,
                fontWeight: FontWeight.w500,
              ),
              getHeightSize20,
              Form(
                key: formKey,
                onChanged: onFormChanged,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PhoneInput(
                      focusNode: phoneFocusNode,
                      controller: phoneEditingController,
                    ),
                    getHeightSize10,
                    RegisterPasswordInput(
                      focusNode: passwordFocusNode,
                      controller: passwordEditingController,
                      onKeyboardNextBtnPressed: () {
                        rePasswordFocusNode.requestFocus();
                      },
                    ),
                    getHeightSize10,
                    ReEnterPasswordInput(
                      focusNode: rePasswordFocusNode,
                      controller: rePasswordEditingController,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        getHeightSize32,
        const AlreadySignedTextButton(),
      ],
    );
  }
}
