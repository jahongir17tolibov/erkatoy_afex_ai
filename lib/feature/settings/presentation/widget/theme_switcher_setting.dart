import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSwitcherSetting extends StatelessWidget {
  const ThemeSwitcherSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SettingsBloc, SettingsState, bool>(
      selector: (state) => state.darkModeEnabled,
      builder: (context, state) {
        return ListTile(
          title: TextView(
            text: 'Qorong`i mazvu',
            textSize: 18.textSize(context),
            textColor: context.themeColors.onSecondary,
          ),
          shape: RoundedRectangleBorder(borderRadius: getBorderAll16),
          trailing: Switch.adaptive(
            value: state,
            onChanged: (value) {
              context.read<SettingsBloc>().add(OnSwitchAppThemeSettingsEvent());
            },
          ),
        );
      },
    );
  }
}
