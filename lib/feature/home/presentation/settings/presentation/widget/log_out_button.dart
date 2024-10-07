import 'dart:ui';

import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/blur_outer_container.dart';
import 'package:erkatoy_afex_ai/design_system/components/erkatoy_button.dart';
import 'package:erkatoy_afex_ai/design_system/components/scale_on_press_button.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/design_system/theme/app_colors.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleOnPress(
      onTap: () {
        _showLogoutDialog(context);
      },
      child: BlurOuterContainer(
        padding: getPaddingAll16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextView(
              text: 'Ilovadan chiqish',
              textSize: 16,
              textColor: context.themeColors.error,
              fontWeight: FontWeight.w500,
            ),
            Icon(Icons.logout_rounded, color: context.themeColors.error)
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showAdaptiveDialog(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AlertDialog(
            contentPadding: getPaddingAll16,
            shape: RoundedRectangleBorder(borderRadius: getBorderAll12),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Lottie.network(
                  'https://lottie.host/30c736dc-d216-4101-ac74-1626c0ed9af5/zOTdF07rZX.json',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                getHeightSize16,
                const TextView(
                  text: 'Chindan ham ilovadan chiqishni xohlaysizmi?',
                  textSize: 16,
                  textColor: AppColors.greyForLines,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),
                getHeightSize20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: ErkatoyButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: 'Bekor qilish',
                        borderRadius: 12,
                        textSize: 16,
                        elevation: 0,
                        textColor: context.themeColors.onSurface.withOpacity(0.8),
                        buttonHeight: 48,
                        buttonColor: context.themeColors.onSurface.withOpacity(0.2),
                        boldStyledTextEnabled: true,
                      ),
                    ),
                    getWidthSize12,
                    Expanded(
                      child: ErkatoyButton(
                        onPressed: () {
                          Navigator.pop(context);
                          context.read<SettingsBloc>().add(OnLogOutUserSettingEvent());
                        },
                        text: 'Chiqish',
                        borderRadius: 12,
                        textSize: 16,
                        elevation: 0,
                        textColor: context.themeColors.surface,
                        buttonHeight: 48,
                        buttonColor: context.themeColors.error,
                        boldStyledTextEnabled: true,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
