import 'package:erkatoy_afex_ai/feature/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:erkatoy_afex_ai/feature/on_boarding/widget/on_boarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OnBoardingCubit, OnBoardingState, List<OnBoardingModel>>(
      selector: (state) => state.onBoardingDataList,
      builder: (context, onBoardingDataList) {
        return Expanded(
          child: PageView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: onBoardingDataList.length,
            onPageChanged: (index) {
              context.read<OnBoardingCubit>().onBoardingPageChanged(index);
            },
            itemBuilder: (context, index) {
              final pageItem = onBoardingDataList[index];
              return OnBoardingPage(
                image: pageItem.image,
                title: pageItem.title,
                subtitle: pageItem.subtitle,
              );
            },
          ),
        );
      },
    );
  }
}
