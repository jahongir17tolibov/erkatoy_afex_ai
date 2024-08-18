import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/zen_bloc.dart';
import 'widget/audio_controls_row.dart';
import 'widget/audio_duration_text.dart';

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
  void initState() {
    Future.microtask(() => context.read<ZenBloc>().add(OnInitialZenEvent()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          ImagesConstants.zenMode2Bckg,
          width: 1.screenWidth(context),
          height: 1.screenHeight(context),
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: const BorderSide(color: Colors.orangeAccent),
                    ),
                  ),
                ),
                icon: const Icon(Icons.arrow_back_rounded, color: Colors.orangeAccent)),
            title: const TextView(text: 'Uyqu rejimi', textColor: Colors.orangeAccent),
          ),
          body: Padding(
            padding: getPaddingAll20,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Spacer(),
                const AudioDurationText(),
                getHeightSize10,
                const AudioControlsRow(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
