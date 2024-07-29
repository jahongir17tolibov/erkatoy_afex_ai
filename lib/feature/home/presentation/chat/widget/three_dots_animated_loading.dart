import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class ThreeDotsAnimatedLoading extends StatefulWidget {
  const ThreeDotsAnimatedLoading({super.key});

  @override
  State<ThreeDotsAnimatedLoading> createState() => _ThreeDotsAnimatedLoadingState();
}

class _ThreeDotsAnimatedLoadingState extends State<ThreeDotsAnimatedLoading>
    with SingleTickerProviderStateMixin {
  final double beginTweenValue = 0.0;
  final double endTweenValue = 8.0;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 200),
      tween: Tween(begin: beginTweenValue, end: endTweenValue),
      curve: Curves.fastLinearToSlowEaseIn,
      builder: (context, value, child) => Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: context.themeColors.onSecondary,
          borderRadius: getBorderAll12,
        ),
      ),
    );
  }
}
