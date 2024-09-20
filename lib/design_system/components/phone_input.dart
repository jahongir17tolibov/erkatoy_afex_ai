import 'package:erkatoy_afex_ai/core/base/base_extensions.dart';
import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/erkatoy_text_field.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhoneInput extends StatelessWidget {
  const PhoneInput({
    super.key,
    required this.focusNode,
    required this.controller,
  });

  final FocusNode focusNode;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextView(
          text: 'Telefon raqam',
          textSize: 12.textSize(context),
          textColor: context.themeColors.onSurface,
        ),
        getHeightSize6,
        ErkatoyTextField(
          hintText: '+998 -- --- -- --',
          controller: controller,
          focusNode: focusNode,
          textInputType: TextInputType.phone,
          maxLength: 17,
          inputFormatters: <TextInputFormatter>[
            PhoneMaskFormatter(),
          ],
          suffixIcon: IconButton(
            onPressed: null,
            icon: SvgPicture.asset(ImagesConstants.callIcon),
          ),
          validator: (value) {
            final text = value!.replaceAll(' ', '');
            if (!text.phoneNumbIsValid) return 'Format noto`g`ri!';
            return null;
          },
        ),
      ],
    );
  }
}

class PhoneMaskFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(RegExp(r'[^+\d]'), '');

    const List<int> spacingIndices = [4, 7, 11, 14];

    for (final i in spacingIndices) {
      if (newText.length > i) newText = '${newText.substring(0, i)} ${newText.substring(i)}';
    }
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
