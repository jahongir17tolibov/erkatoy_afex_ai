import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/app_constants.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/design_system/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ErkatoyTextField extends StatelessWidget {
  const ErkatoyTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.focusNode,
    required this.textInputType,
    this.validator,
    this.isExpand = false,
    this.removeBorders = false,
    this.inputActionIsNext = true,
    this.onEditingComplete,
    this.maxLength,
    this.hideErrorText = false,
    this.suffixIcon,
    this.inputFormatters,
  })  : isReadOnly = false,
        obscureText = false,
        onTap = null;

  const ErkatoyTextField.readOnlyMode({
    super.key,
    required this.hintText,
    this.focusNode,
    this.validator,
    required this.controller,
    this.inputActionIsNext = true,
    this.onEditingComplete,
    this.onTap,
    this.maxLength,
    this.suffixIcon,
    this.inputFormatters,
  })  : isReadOnly = true,
        obscureText = false,
        textInputType = TextInputType.none,
        isExpand = false,
        removeBorders = true,
        hideErrorText = true;

  const ErkatoyTextField.passwordMode({
    super.key,
    required this.hintText,
    this.focusNode,
    this.validator,
    required this.controller,
    required this.obscureText,
    this.inputActionIsNext = true,
    this.onEditingComplete,
    this.onTap,
    this.maxLength,
    this.suffixIcon,
    this.inputFormatters,
  })  : isReadOnly = false,
        textInputType = TextInputType.visiblePassword,
        isExpand = false,
        removeBorders = false,
        hideErrorText = false;

  final String hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final int? maxLength;
  final bool obscureText;
  final bool isReadOnly;
  final bool isExpand;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final bool removeBorders;
  final bool inputActionIsNext;
  final bool hideErrorText;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Theme.of(context).colorScheme.primary,
      textInputAction: inputActionIsNext ? TextInputAction.next : TextInputAction.done,
      maxLength: maxLength,
      keyboardType: textInputType,
      cursorOpacityAnimates: true,
      obscureText: obscureText,
      obscuringCharacter: '●',
      expands: isExpand,
      readOnly: isReadOnly,
      onEditingComplete: onEditingComplete,
      cursorErrorColor: Theme.of(context).colorScheme.error,
      onTap: onTap,
      inputFormatters: inputFormatters,
      textCapitalization: (textInputType == TextInputType.name)
          ? TextCapitalization.sentences
          : TextCapitalization.none,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Maydon bo`sh bo`lmasligi kerak!';
        return validator?.call(value);
      },
      style: TextStyle(
        fontFamily: AppConstants.appFontStyle,
        fontSize: 12,
        color: context.themeColors.onSurface,
      ),
      decoration: InputDecoration(
        enabled: true,
        filled: true,
        isDense: true,
        counterText: '',
        fillColor: context.themeColors.surface,
        hintText: hintText,
        errorStyle: TextStyle(
          fontFamily: AppConstants.appFontStyle,
          fontSize: (hideErrorText ? 0 : 11).textSize(context),
          color: context.themeColors.error,
        ),
        hintStyle: const TextStyle(fontFamily: AppConstants.appFontStyle, fontSize: 12),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.greyForLines, width: 0.2),
          borderRadius: getBorderAll10,
        ),
        suffixIcon: suffixIcon,
        errorBorder: OutlineInputBorder(
          borderRadius: getBorderAll10,
          borderSide: adaptiveBorderSide(
            context,
            color: context.themeColors.error,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: getBorderAll10,
          borderSide: adaptiveBorderSide(
            context,
            color: context.themeColors.primary,
            width: 0.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: getBorderAll10,
          borderSide: adaptiveBorderSide(
            context,
            color: context.themeColors.error,
            width: 0.5,
          ),
        ),
      ),
    );
  }

  BorderSide adaptiveBorderSide(BuildContext context, {required Color color, double? width}) {
    return removeBorders
        ? const BorderSide(color: AppColors.greyForLines)
        : BorderSide(color: color, width: width ?? 1.0);
  }
}
