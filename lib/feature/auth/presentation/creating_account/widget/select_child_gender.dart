import 'package:erkatoy_afex_ai/feature/auth/presentation/creating_account/widget/gender_radio_button.dart';
import 'package:flutter/material.dart';

class SelectChildGender extends StatelessWidget {
  const SelectChildGender({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GenderRadioButton(gender: 'O`g`il bola'),
          GenderRadioButton(gender: 'Qiz bola'),
        ],
      ),
    );
  }
}
