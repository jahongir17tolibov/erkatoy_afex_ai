import 'package:erkatoy_afex_ai/feature/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ...List.generate(
              state.onBoardingDataList.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: index == state.pageIndex
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    shape: BoxShape.circle,
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
