import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/blur_outer_container.dart';
import 'package:erkatoy_afex_ai/design_system/components/phone_input.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

import 'login_password_input.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({
    super.key,
    required this.formKey,
    required this.onFormChanged,
    required this.phoneFocusNode,
    required this.phoneEditingController,
    required this.passwordFocusNode,
    required this.passwordEditingController,
  });

  final GlobalKey<FormState> formKey;
  final VoidCallback onFormChanged;
  final FocusNode phoneFocusNode;
  final TextEditingController phoneEditingController;
  final FocusNode passwordFocusNode;
  final TextEditingController passwordEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        BlurOuterContainer(
          child: Column(
            children: <Widget>[
              TextView(
                text: 'Profilga kirish',
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
                    LoginPasswordInput(
                      focusNode: passwordFocusNode,
                      controller: passwordEditingController,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
