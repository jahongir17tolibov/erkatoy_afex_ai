import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ZenModeScreen extends StatefulWidget {
  const ZenModeScreen({super.key});

  static const String routePath = '/zen_mode';
  static const String routeBottom = '/zen_mode_bottom';
  static const String routeName = 'zen_mode';

  static void open(BuildContext context) {
    context.pushNamed(routeName);
  }

  @override
  State<ZenModeScreen> createState() => _ZenModeScreenState();
}

class _ZenModeScreenState extends State<ZenModeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextView(text: 'Zen mode'),
      ),
    );
  }
}
