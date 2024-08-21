import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/hive_constants.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/core/provider/local/hive_local_storage.dart';
import 'package:erkatoy_afex_ai/core/service/connectivity/connectivity_cubit.dart';
import 'package:erkatoy_afex_ai/design_system/components/custom_native_splash.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/di.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/register/register_screen.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/home/home_screen.dart';
import 'package:erkatoy_afex_ai/feature/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.microtask(() => _initSplash());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // BlocListener<ConnectivityCubit, ConnectivityState>(
          //   listener: (context, state) {
          //     printOnDebug(state.isDialogShows);
          //     if (state.isDialogShows != null) {
          //       state.isDialogShows! ? context.showConnectivityDialog() : Navigator.pop(context);
          //     }
          //   },
          //   child:
          Padding(
        padding: getPaddingAll20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            getFullWidth(context),
            Image.asset(ImagesConstants.appLogo, width: 500, height: 500, fit: BoxFit.cover),
            SizedBox(
              width: 0.5.screenWidth(context),
              child: LinearProgressIndicator(
                color: context.themeColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }

  void _initSplash() async {
    CustomNativeSplash.remove();
    await Future.delayed(const Duration(seconds: 2), () async {
      await getOnBoardingKey().then((value) async {
        value
            ? await getAuthToken().then((value) {
                value == null ? RegisterScreen.open(context) : HomeScreen.open(context);
              })
            : OnBoardingScreen.open(context);
      });
      if (!mounted) return;
      context.read<ConnectivityCubit>().observeConnectivity();
    });
  }

  Future<String?> getAuthToken() async {
    return await getIt<HiveLocalStorage>()
        .getString(boxName: HiveConstants.authTokenBoxName, key: HiveConstants.authTokenKey);
  }

  Future<bool> getOnBoardingKey() async {
    final llll = await getIt<HiveLocalStorage>().getBool(
          boxName: HiveConstants.authTokenBoxName,
          key: HiveConstants.onBoardingKey,
        ) ??
        false;
    printOnDebug(llll);
    return llll;
  }
}
