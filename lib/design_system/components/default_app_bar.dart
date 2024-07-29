import 'package:erkatoy_afex_ai/design_system/components/app_back_button.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    required this.titleText,
    this.centerTitle = true,
    this.backButtonEnabled = false,
  });

  final String titleText;
  final bool centerTitle;
  final bool backButtonEnabled;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      leading: backButtonEnabled ? const AppBackButton() : null,
      title: TextView(
        text: titleText,
        textColor: context.themeColors.onSurface,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
