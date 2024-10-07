import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SlideDotIndicator extends StatelessWidget {
  const SlideDotIndicator({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OnBoardingCubit, OnBoardingState, int>(
      selector: (state) => state.onBoardingDataList.length,
      builder: (context, length) {
        return Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(length, (index) {
                return Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: context.themeColors.onSurface.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                double position = 0;
                if (controller.hasClients) {
                  position = controller.page ?? controller.initialPage.toDouble();
                }
                return Positioned(
                  left: position * 20 + (1.screenWidth(context) / 2 - (length * 15) / 2),
                  child: child!,
                );
              },
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: context.themeColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
