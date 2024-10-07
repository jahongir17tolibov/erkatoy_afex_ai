import 'package:erkatoy_afex_ai/design_system/components/default_app_bar.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  static const String routeName = 'notifications';

  static void open(BuildContext context) {
    context.pushNamed(routeName);
  }

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(titleText: 'Xabarlar', backButtonEnabled: true),
      body: Center(
        child: TextView(
          text: 'Yangi xabarlar yo`q',
          textColor: context.themeColors.onSurface,
          textSize: 16,
        ),
      ),
    );
  }
}
