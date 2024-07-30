import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/adaptive_loading_view.dart';
import 'package:erkatoy_afex_ai/design_system/components/default_app_bar.dart';
import 'package:erkatoy_afex_ai/design_system/components/single_child_scroll_with_size.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/floating_ui.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/creating_account/widget/weight_input.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/create_account_bloc.dart';
import 'widget/change_birth_date.dart';
import 'widget/gender_pop_up.dart';
import 'widget/start_button.dart';

class CreatingAccountScreen extends StatefulWidget {
  const CreatingAccountScreen({super.key, required this.phone, required this.password});

  final String phone;
  final String password;

  static const String routePath = 'creating_account/:phone/:pass';
  static const String routeName = 'creating_account';
  static const String settingsRouteName = 'update_child_info';

  static void openReplace(BuildContext context, {required String phone, required String pass}) {
    context.pushReplacementNamed(routeName, pathParameters: {'phone': phone, 'pass': pass});
  }

  static void openPush(BuildContext context) {
    context.pushNamed(settingsRouteName);
  }

  @override
  State<CreatingAccountScreen> createState() => _CreatingAccountScreenState();
}

class _CreatingAccountScreenState extends State<CreatingAccountScreen> {
  final GlobalKey<FormState> _weightFormKey = GlobalKey<FormState>();
  final _weightEditingController = TextEditingController();

  @override
  void initState() {
    _weightEditingController.addListener(() {
      String weightValue = _weightEditingController.text;
      context.read<CreateAccountBloc>().add(OnWeightEditingCreateAccEvent(weightValue));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        titleText: '',
        centerTitle: true,
        backButtonEnabled: widget.phone.isEmpty,
      ),
      body: BlocListener<CreateAccountBloc, CreateAccountState>(
        listener: (context, state) {
          if (state.status == CreateAccountStatus.onShowMessage) {
            context.showSnackBar(state.message);
          } else if (state.status == CreateAccountStatus.onSuccess) {
            HomeScreen.open(context);
          }

          if (state.onLoading != null) {
            state.onLoading!
                ? AdaptiveLoadingView.showLoadingDialog(context)
                : AdaptiveLoadingView.hideLoadingDialog(context);
          }
        },
        child: SingleChildScrollWithSize(
          statusBarHeight: MediaQuery.of(context).viewPadding.top,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          screenWithAppBar: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // Container(
              //   margin: getPaddingAll16,
              //   decoration: BoxDecoration(
              //     borderRadius: getCustomBorder(400),
              //     border: Border.fromBorderSide(
              //       BorderSide(color: context.themeColors.secondary, width: 8),
              //     ),
              //   ),
              //   child: Padding(
              //     padding: getPaddingAll4,
              //     child: ClipRRect(
              //       borderRadius: getCustomBorder(400),
              //       child: SvgPicture.asset(
              //         ImagesConstants.gradientImg,
              //         width: 200,
              //         height: 200,
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   ),
              // ),
              Image.asset(ImagesConstants.appLogo, fit: BoxFit.cover, width: 1.screenWidth(context), height: 200),
              TextView(
                text: 'Xush kelibsiz!',
                textSize: 32.textSize(context),
                textColor: context.themeColors.onSurface,
              ),
              getHeightSize10,
              Container(
                width: 1.screenWidth(context),
                padding: EdgeInsets.symmetric(
                  horizontal: 0.08.screenWidth(context),
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: context.themeColors.secondary,
                  borderRadius: getBorderAll20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextView(
                      text:
                          "Ro`yxatdan o`tishni yakunlash uchun\nFarzandingiz ma'lumotlarini kiriting",
                      textSize: 16.textSize(context),
                      textColor: context.themeColors.onSecondary,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                    ),
                    getHeightSize20,
                    const ChangeBirthDate(),
                    getHeightSize20,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        const GenderPopUp(),
                        const Spacer(),
                        getWidthSize4,
                        WeightInput(
                          weightKey: _weightFormKey,
                          controller: _weightEditingController,
                        ),
                        getWidthSize6,
                        TextView.boldStyle(
                          text: 'KG',
                          textColor: context.themeColors.onSurface,
                          textSize: 16.textSize(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              StartButton(phone: widget.phone, pass: widget.password),
              getHeightSize8,
            ],
          ),
        ),
      ),
    );
  }
}
