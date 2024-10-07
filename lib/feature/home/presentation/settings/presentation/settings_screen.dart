import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/blur_outer_container.dart';
import 'package:erkatoy_afex_ai/design_system/components/default_app_bar.dart';
import 'package:erkatoy_afex_ai/design_system/components/svg_image_view.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/register/register_screen.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/settings/presentation/widget/edit_profile_button.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/settings/presentation/widget/log_out_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/settings_bloc.dart';
import 'widget/notification_switcher_setting.dart';
import 'widget/theme_switcher_setting.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  static const String routeName = '/settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(titleText: 'Sozlamalar', centerTitle: true),
      body: BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state.status == SettingsStatus.onUserLogOut) {
            RegisterScreen.open(context);
          }
        },
        child: Padding(
          padding: getPaddingAll20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SvgImageView(ImagesConstants.settingsImg),
              getHeightSize16,
              const EditProfileButton(),
              getHeightSize16,
              BlurOuterContainer(
                padding: getPaddingAll16,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const ThemeSwitcherSetting(),
                    _getDivider,
                    const NotificationSwitcherSetting(),
                  ],
                ),
              ),
              getHeightSize16,
              const LogoutButton(),
              getHeightSize20,
              const TextView(text: 'Ilova versiyasi 1.0.2', textColor: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Divider get _getDivider => Divider(color: context.themeColors.onSurface.withOpacity(0.2));
}
