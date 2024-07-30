import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/default_app_bar.dart';
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
      appBar: const DefaultAppBar(titleText: 'Uyqu rejimi', backButtonEnabled: true),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(ImagesConstants.zenModeBckg)),
        ),
        child: Padding(
          padding: getPaddingAll20,
          child: Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

              ],
            ),
          ],),
        ),
      ),
    );
  }
}
