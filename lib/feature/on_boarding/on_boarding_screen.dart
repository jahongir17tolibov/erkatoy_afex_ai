import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/feature/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:erkatoy_afex_ai/feature/on_boarding/widget/on_boarding_next_button.dart';
import 'package:erkatoy_afex_ai/feature/on_boarding/widget/on_boarding_page_view.dart';
import 'package:erkatoy_afex_ai/feature/on_boarding/widget/on_boarding_skip_button.dart';
import 'package:erkatoy_afex_ai/feature/on_boarding/widget/page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const String routeName = 'on_boarding';

  static void open(BuildContext context) {
    context.pushReplacementNamed(routeName);
  }

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    Future.microtask(() => context.read<OnBoardingCubit>().initOnBoarding());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: getPaddingAll10,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OnBoardingPageView(controller: _pageController),
                getHeightSize10,
                const PageIndicator(),
                getHeightSize20,
                OnBoardingNextButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn,
                    );
                  },
                ),
                getHeightSize10,
                const OnBoardingSkipButton(),
                getHeightSize10,
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
