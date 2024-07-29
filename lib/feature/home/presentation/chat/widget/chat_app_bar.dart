import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/app_back_button.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextView(text: 'Yordamchi', textColor: context.themeColors.onSurface),
          getWidthSize10,
          ClipRRect(
            borderRadius: BorderRadius.circular(96),
            child: Image.asset(
              ImagesConstants.afexAiLogoPng,
              width: 36,
              height: 36,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      actions: const [SizedBox(width: 48)],
      leading: const AppBackButton(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
