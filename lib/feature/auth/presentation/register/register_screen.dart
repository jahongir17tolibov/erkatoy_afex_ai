import 'package:erkatoy_afex_ai/core/base/base_extensions.dart';
import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/adaptive_loading_view.dart';
import 'package:erkatoy_afex_ai/design_system/components/single_child_scroll_with_size.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/floating_ui.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/creating_account/creating_account_screen.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/register/widget/already_signed_text_button.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/register/widget/reenter_password_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../design_system/components/phone_input.dart';
import 'bloc/register_bloc.dart';
import 'widget/register_button.dart';
import 'widget/register_password_input.dart';

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
  final GlobalKey<FormState> _validateForm = GlobalKey<FormState>();
  // phone input
  final FocusNode _phoneFocusNode = FocusNode();
  final TextEditingController _phoneEditingController = TextEditingController();

  // password input
  final FocusNode _rePasswordFocusNode = FocusNode();
  final TextEditingController _rePasswordEditingController = TextEditingController();

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: TextView(text: 'Ro`yxatdan o`tish', textColor: context.themeColors.onSurface),
      ),
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state.status == RegisterStatus.onShowMessage) {
            context.showSnackBar(state.message!);
          } else if (state.status == RegisterStatus.onSuccessful) {
            CreatingAccountScreen.openReplace(
              context,
              phone: _phoneEditingController.text,
              pass: _passwordEditingController.text,
            );
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  PhoneInput(
                    focusNode: _phoneFocusNode,
                    controller: _phoneEditingController,
                  ),
                  getHeightSize10,
                  RegisterPasswordInput(
                    focusNode: _passwordFocusNode,
                    controller: _passwordEditingController,
                    onKeyboardNextBtnPressed: () {
                      _rePasswordFocusNode.requestFocus();
                    },
                  ),
                  getHeightSize10,
                  ReEnterPasswordInput(
                    focusNode: _rePasswordFocusNode,
                    controller: _rePasswordEditingController,
                  ),
                  getHeightSize20,
                  RegisterButton(validationState: validationState),
                  getHeightSize8,
                  const AlreadySignedTextButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool get validationState => _validateForm.currentState?.validate() ?? false;

  void _initControllers() {
    _phoneEditingController.addListener(() {
      String value = _phoneEditingController.text;
      context.read<RegisterBloc>().add(OnInputPhoneRegisterEvent(value));
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
