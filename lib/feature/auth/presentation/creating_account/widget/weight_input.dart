import 'package:erkatoy_afex_ai/design_system/components/erkatoy_text_field.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/creating_account/bloc/create_account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeightInput extends StatelessWidget {
  const WeightInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CreateAccountBloc, CreateAccountState, String>(
      selector: (state) => state.weight,
      builder: (context, weight) {
        if (weight.isNotEmpty) controller.text = weight;
        return SizedBox(
          width: 100,
          child: ErkatoyTextField(
            hintText: 'Vazni',
            controller: controller,
            textInputType: const TextInputType.numberWithOptions(decimal: true),
            inputActionIsNext: false,
            hideErrorText: true,
          ),
        );
      },
    );
  }
}
