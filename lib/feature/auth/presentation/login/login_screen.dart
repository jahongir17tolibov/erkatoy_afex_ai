import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/adaptive_loading_view.dart';
import 'package:erkatoy_afex_ai/design_system/components/default_app_bar.dart';
import 'package:erkatoy_afex_ai/design_system/components/phone_input.dart';
import 'package:erkatoy_afex_ai/design_system/components/single_child_scroll_with_size.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/floating_ui.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/login/bloc/login_bloc.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/login/widget/login_button.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/login/widget/login_password_input.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = 'login';

  static open(BuildContext context) {
    context.pushNamed(routeName);
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _validateForm = GlobalKey<FormState>();

  // phone input
  final FocusNode _phoneFocusNode = FocusNode();
  final TextEditingController _phoneEditingController = TextEditingController();

  // password input
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _passwordEditingController = TextEditingController();

  @override
  void initState() {
    _initControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(titleText: 'Kirish', backButtonEnabled: true),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.onShowMessage) {
            context.showSnackBar(state.message!);
          } else if (state.status == LoginStatus.onSuccessful) {
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
          padding: EdgeInsets.symmetric(horizontal: 0.1.screenWidth(context)),
          screenWithAppBar: true,
          child: Center(
            child: Form(
              key: _validateForm,
              onChanged: _onFormChanged,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  PhoneInput(
                    focusNode: _phoneFocusNode,
                    controller: _phoneEditingController,
                  ),
                  getHeightSize10,
                  LoginPasswordInput(
                    focusNode: _passwordFocusNode,
                    controller: _passwordEditingController,
                  ),
                  getHeightSize20,
                  const LoginButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _initControllers() {
    _phoneEditingController.addListener(() {
      String value = _phoneEditingController.text;
      context.read<LoginBloc>().add(OnInputPhoneLoginEvent(value));
    });
    _passwordEditingController.addListener(() {
      String value = _passwordEditingController.text;
      context.read<LoginBloc>().add(OnInputPasswordLoginEvent(value));
    });
  }

  void _onFormChanged() {
    if (_phoneEditingController.text.isNotEmpty && _passwordEditingController.text.isNotEmpty) {
      final isValid = _validateForm.currentState!.validate();
      context.read<LoginBloc>().add(OnValidateFormLoginEvent(isValid));
    }
  }

  @override
  void dispose() {
    _phoneEditingController.dispose();
    _passwordEditingController.dispose();
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
