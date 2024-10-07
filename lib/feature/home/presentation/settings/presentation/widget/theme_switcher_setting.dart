import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSwitcherSetting extends StatelessWidget {
  const ThemeSwitcherSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SettingsBloc, SettingsState, bool>(
      selector: (state) => state.darkModeEnabled,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextView(
              text: 'Tungi rejim',
              textSize: 16,
              fontWeight: FontWeight.w500,
              textColor: context.themeColors.onSurface,
            ),
            CupertinoSwitch(
              value: state,
              activeColor: context.themeColors.primary,
              onChanged: (value) {
                context.read<SettingsBloc>().add(OnSwitchAppThemeSettingsEvent());
              },
            ),
          ],
        );
      },
    );
  }
}
