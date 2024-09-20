import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/feature/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:erkatoy_afex_ai/feature/on_boarding/widget/on_boarding_bottom_view.dart';
import 'package:erkatoy_afex_ai/feature/on_boarding/widget/on_boarding_page_view.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getHeightSizeCustom(30),
              Image.asset(ImagesConstants.appLogoImg, fit: BoxFit.cover),
              OnBoardingPageView(controller: _pageController),
              getHeightSizeCustom(40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: OnBoardingBottomView(
        onNextButtonPressed: () {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
