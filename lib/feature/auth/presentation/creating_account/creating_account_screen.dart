import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/adaptive_loading_view.dart';
import 'package:erkatoy_afex_ai/design_system/components/default_app_bar.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/floating_ui.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/creating_account/widget/account_card.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/create_account_bloc.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _weightEditingController = TextEditingController();
  final String suffixText = ' kg';

  @override
  void initState() {
    if (widget.phone.isEmpty) {
      Future.microtask(() => context.read<CreateAccountBloc>().add(OnGetChildInfoCreateAccEvent()));
    }
    _listenController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        titleText: widget.phone.isEmpty ? 'Forma ma`lumotlari' : '',
        backButtonEnabled: widget.phone.isEmpty,
      ),
      body: BlocListener<CreateAccountBloc, CreateAccountState>(
        listener: (context, state) {
          if (state.status == CreateAccountStatus.onShowMessage) {
            context.showToast(state.message);
          } else if (state.status == CreateAccountStatus.onSuccessfulCreated) {
            HomeScreen.open(context);
          } else if (state.status == CreateAccountStatus.onSuccessfulUpdated) {
            context.pop();
          }

          if (state.status == CreateAccountStatus.onShowDialog) {
            AdaptiveLoadingView.showLoadingDialog(context);
          } else if (state.status == CreateAccountStatus.onHideDialog) {
            AdaptiveLoadingView.hideLoadingDialog(context);
          }

          if (widget.phone.isEmpty) {
            _onSetWeight(state.weight);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                padding: getAuthPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AccountCard(
                      weightEditingController: _weightEditingController,
                      isUpdatingAccount: widget.phone.isEmpty,
                      formKey: _formKey,
                    ),
                    getHeightSize20,
                    if (widget.phone.isEmpty)
                      Image.asset(ImagesConstants.updateAccImg, fit: BoxFit.cover),
                  ],
                ),
              ),
            ),
            StartButton(phone: widget.phone, pass: widget.password),
          ],
        ),
      ),
    );
  }

  void _listenController() {
    _weightEditingController.addListener(() {
      final String value = _weightEditingController.text;
      _formatWeight(value);
      context.read<CreateAccountBloc>().add(OnInputWeightCreateAccEvent(value));
    });
  }

  void _formatWeight(String value) {
    if (value.isNotEmpty) {
      final int cursorPosition = _weightEditingController.selection.baseOffset;
      if (cursorPosition > value.length - suffixText.length) {
        _weightEditingController.selection = TextSelection.fromPosition(TextPosition(
          offset: value.length - suffixText.length,
        ));
      }
    }
  }

  void _onSetWeight(String value) {
    if (!value.endsWith(suffixText) && value.isNotEmpty) {
      _weightEditingController.text = '$value$suffixText';
      _formatWeight(value);
    }
  }

  @override
  void dispose() {
    _weightEditingController.dispose();
    super.dispose();
  }
}
