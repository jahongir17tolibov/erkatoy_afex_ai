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
  late final AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..repeat(reverse: true);

    _animations = List.generate(3, (index) {
      final start = index / 3;
      final end = (index + 1) / 3;

      return Tween<double>(begin: 1, end: 1.2).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeInOut),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        ...List.generate(3, (index) {
          return ScaleTransition(
            scale: _animations[index],
            child: Container(
              width: 8,
              height: 8,
              margin: getPaddingAll4,
              decoration: BoxDecoration(
                color: context.themeColors.onSecondary,
                shape: BoxShape.circle,
              ),
            ),
          );
        }),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
