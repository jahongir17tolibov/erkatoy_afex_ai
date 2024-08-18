import 'package:equatable/equatable.dart';
import 'package:erkatoy_afex_ai/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  const TextView({
    super.key,
    required this.text,
    this.textSize,
    this.textColor,
    this.textOverflow,
    this.maxLines,
    this.textAlign,
    this.fontWeight,
    this.fontStyle,
    this.textDecorations = const AppTextDecorations(),
    this.fixedTextSize = false,
    this.letterSpacing,
  });

  const TextView.boldStyle({
    super.key,
    required this.text,
    this.textSize,
    this.textColor,
    this.textOverflow,
    this.maxLines,
    this.textAlign,
    this.textDecorations = const AppTextDecorations(),
    this.fixedTextSize = false,
    this.letterSpacing,
  })  : fontWeight = FontWeight.bold,
        fontStyle = null;

  final String text;
  final double? textSize;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final Color? textColor;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final AppTextDecorations textDecorations;
  final double? letterSpacing;
  final bool fixedTextSize;

  @override
  Widget build(BuildContext context) => Text(
        text,
        overflow: textOverflow,
        maxLines: maxLines,
        style: TextStyle(
          fontFamily: AppConstants.appFontStyle,
          fontSize: textSize,
          color: textColor,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          decoration: textDecorations.decoration,
          decorationColor: textDecorations.color,
          letterSpacing: letterSpacing,
        ),
        textAlign: textAlign,
        textScaler: fixedTextSize ? TextScaler.noScaling : null,
      );
}

class AppTextDecorations extends Equatable {
  const AppTextDecorations({this.style, this.decoration, this.color});

  final TextDecorationStyle? style;
  final TextDecoration? decoration;
  final Color? color;

  @override
  List<Object?> get props => [style, decoration, color];
}
