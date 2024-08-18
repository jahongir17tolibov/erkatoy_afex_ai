import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/scale_on_press_button.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleOnPress(
      onTap: () {
        _showLogoutDialog(context);
      },
      child: ListTile(
        title: Padding(
          padding: getPaddingAll10,
          child: TextView(
            text: 'Chiqish',
            textSize: 16.textSize(context),
            textColor: context.themeColors.onSecondary,
          ),
        ),
        tileColor: context.themeColors.secondary,
        shape: RoundedRectangleBorder(borderRadius: getBorderAll16),
        trailing: Icon(Icons.logout_rounded, color: context.themeColors.onSecondary),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: TextView.boldStyle(
            text: 'Chindan ham ilovadan chiqishni xohlaysizmi?',
            textSize: 16.textSize(context),
            textColor: context.themeColors.onSurface,
          ),
          content: TextView(
            text:
                'Chiqishni amalga oshirganingizdan so`ng, telefon raqamingizni va parolingizni qaytadan kiritishingizga to`g`ri keladi',
            textSize: 12.textSize(context),
            textColor: context.themeColors.onSurface,
          ),
          shape: RoundedRectangleBorder(borderRadius: getBorderAll16),
          actionsPadding: getPaddingAll4,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(borderRadius: getBorderAll12),
              ),
              child: TextView(
                text: 'Bekor qilish',
                textColor: context.themeColors.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<SettingsBloc>().add(OnLogOutUserSettingEvent());
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(borderRadius: getBorderAll12),
              ),
              child: TextView(
                text: 'Ha',
                textColor: context.themeColors.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      },
    );
  }
}
