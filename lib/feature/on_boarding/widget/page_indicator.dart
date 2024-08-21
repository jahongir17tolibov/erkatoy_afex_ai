import 'package:erkatoy_afex_ai/feature/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OnBoardingCubit, OnBoardingState, int>(
      selector: (state) => state.pageIndex,
      builder: (context, pageIndex) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ...List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: index == pageIndex ? 32 : 16,
                  height: 8,
                  decoration: BoxDecoration(
                    color: index == pageIndex
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
