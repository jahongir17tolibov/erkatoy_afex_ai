import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/erkatoy_button.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class ConnectivityPage extends StatelessWidget {
  const ConnectivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: getPaddingAll10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              ImagesConstants.noConnectionPng,
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
            getHeightSize20,
            TextView(
              text: 'Tarmoq bilan aloqa yo`q!',
              textSize: 24.textSize(context),
              textColor: context.themeColors.onSurface,
            ),
            ErkatoyButton(
              onPressed: () {},
              buttonColor: context.themeColors.primary,
              text: 'Qaytadan urinish',
              textColor: context.themeColors.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
