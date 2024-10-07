import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/notifications/notifications_screen.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Image.asset(
        ImagesConstants.appLogoImg,
        width: 80,
        height: 32,
        fit: BoxFit.cover,
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            NotificationsScreen.open(context);
          },
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)),
          ),
          icon: Icon(
            Icons.notifications_rounded,
            color: context.themeColors.onSurface,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
