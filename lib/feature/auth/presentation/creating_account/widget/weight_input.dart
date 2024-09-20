import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/erkatoy_text_field.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/creating_account/bloc/create_account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeightInput extends StatelessWidget {
  const WeightInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CreateAccountBloc, CreateAccountState, String>(
      selector: (state) => state.weight,
      builder: (context, weight) {
        if (weight.isNotEmpty) controller.text = weight;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextView(
              text: 'Vazni',
              textColor: context.themeColors.onSurface,
              textSize: 12,
            ),
            getHeightSize6,
            ErkatoyTextField(
              hintText: '0 kg',
              controller: controller,
              textInputType: const TextInputType.numberWithOptions(decimal: true),
              inputActionIsNext: false,
              hideErrorText: true,
              suffixIcon: SvgPicture.asset(ImagesConstants.weightIcon, fit: BoxFit.scaleDown),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
                LengthLimitingTextInputFormatter(5),
                WeightInputFormatter(),
              ],
              validator: (value) {
                final doubleValue = double.tryParse(value!.replaceAll(' kg', ''));
                if (doubleValue == null) return '';
                return null;
              },
            ),
          ],
        );
      },
    );
  }
}

class WeightInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    const String suffixText = ' kg';
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9.]'), '');
    return TextEditingValue(
      text: newText.isNotEmpty ? '$newText$suffixText' : newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
