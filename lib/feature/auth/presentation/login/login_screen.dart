import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/adaptive_loading_view.dart';
import 'package:erkatoy_afex_ai/design_system/components/default_app_bar.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/floating_ui.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/login/bloc/login_bloc.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/login/widget/login_card.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'widget/login_button.dart';

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
      appBar: const DefaultAppBar(backButtonEnabled: true),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.onShowMessage) {
            context.showToast(state.message!);
          } else if (state.status == LoginStatus.onSuccessful) {
            HomeScreen.open(context);
          }

          if (state.status == LoginStatus.onShowDialog) {
            AdaptiveLoadingView.showLoadingDialog(context);
          } else if (state.status == LoginStatus.onHideDialog) {
            AdaptiveLoadingView.hideLoadingDialog(context);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                padding: getAuthPadding,
                child: LoginCard(
                  formKey: _validateForm,
                  onFormChanged: _onFormChanged,
                  passwordEditingController: _passwordEditingController,
                  passwordFocusNode: _passwordFocusNode,
                  phoneEditingController: _phoneEditingController,
                  phoneFocusNode: _phoneFocusNode,
                ),
              ),
            ),
            const LoginButton(),
          ],
        ),
      ),
    );
  }

  void _initControllers() {
    _phoneEditingController.addListener(() {
      String value = _phoneEditingController.text;
      context.read<LoginBloc>().add(OnInputPhoneLoginEvent(value.replaceAll(' ', '')));
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
