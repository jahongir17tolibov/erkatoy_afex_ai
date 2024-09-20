import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/adaptive_loading_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/floating_ui.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/creating_account/creating_account_screen.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/register/widget/register_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/register_bloc.dart';
import 'widget/register_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String routeName = '/register_login';

  static void open(BuildContext context) {
    context.replace(routeName);
  }

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _validateForm = GlobalKey<FormState>();

  // phone input
  final FocusNode _phoneFocusNode = FocusNode();
  final TextEditingController _phoneEditingController = TextEditingController();

  // password input
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _passwordEditingController = TextEditingController();

  // re-password input
  final FocusNode _rePasswordFocusNode = FocusNode();
  final TextEditingController _rePasswordEditingController = TextEditingController();

  @override
  void initState() {
    _initControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state.status == RegisterStatus.onShowMessage) {
            context.showSnackBar(state.message!);
          } else if (state.status == RegisterStatus.onSuccessful) {
            CreatingAccountScreen.openReplace(
              context,
              phone: state.phoneNumber,
              pass: state.password,
            );
          }

          if (state.onLoading != null) {
            state.onLoading!
                ? AdaptiveLoadingView.showLoadingDialog(context)
                : AdaptiveLoadingView.hideLoadingDialog(context);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                padding: getAuthPadding,
                child: RegisterCard(
                  formKey: _validateForm,
                  onFormChanged: _onFormChanged,
                  passwordEditingController: _passwordEditingController,
                  passwordFocusNode: _passwordFocusNode,
                  phoneEditingController: _phoneEditingController,
                  phoneFocusNode: _phoneFocusNode,
                  rePasswordEditingController: _rePasswordEditingController,
                  rePasswordFocusNode: _rePasswordFocusNode,
                ),
              ),
            ),
            const RegisterButton(),
          ],
        ),
      ),
    );
  }

  void _onFormChanged() {
    if (_phoneEditingController.text.isNotEmpty &&
        _passwordEditingController.text.isNotEmpty &&
        _rePasswordEditingController.text.isNotEmpty) {
      final isValid = _validateForm.currentState!.validate();
      context.read<RegisterBloc>().add(OnValidateChangedRegisterEvent(isValid));
    }
  }

  void _initControllers() {
    _phoneEditingController.addListener(() {
      String value = _phoneEditingController.text;
      context.read<RegisterBloc>().add(OnInputPhoneRegisterEvent(value.replaceAll(' ', '')));
    });
    _passwordEditingController.addListener(() {
      String value = _passwordEditingController.text;
      context.read<RegisterBloc>().add(OnInputPasswordRegisterEvent(value));
    });
    _rePasswordEditingController.addListener(() {
      String value = _rePasswordEditingController.text;
      context.read<RegisterBloc>().add(OnInputRePasswordRegisterEvent(value));
    });
  }

  @override
  void dispose() {
    _phoneEditingController.dispose();
    _passwordEditingController.dispose();
    _rePasswordEditingController.dispose();
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    _rePasswordFocusNode.dispose();
    super.dispose();
  }
}
