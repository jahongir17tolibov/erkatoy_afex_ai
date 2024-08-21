import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/default_app_bar.dart';
import 'package:erkatoy_afex_ai/design_system/components/single_child_scroll_with_size.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/home_bloc.dart';
import 'widget/daily_schedule_card.dart';
import 'widget/health_card.dart';
import 'widget/reason_for_cry_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  static open(BuildContext context) {
    context.go(routeName);
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.microtask(() => context.read<HomeBloc>().add(OnGetCurrentActivityHomeEvent()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(titleText: 'Erkatoy', centerTitle: false),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          context.read<HomeBloc>().add(OnGetCurrentActivityHomeEvent());
        },
        child: SingleChildScrollWithSize(
          statusBarHeight: MediaQuery.of(context).viewPadding.top,
          padding: EdgeInsets.symmetric(horizontal: 0.05.screenWidth(context)),
          screenWithAppBar: true,
          child: Column(
            children: <Widget>[
              getHeightSize10,
              const ReasonForCryCard(),
              getHeightSize20,
              const DailyScheduleCard(),
              getHeightSize20,
              const HomeIconTextCard(iconAsset: ImagesConstants.healthIconSvg, text: 'Salomatlik'),
              getHeightSize20,
              const HomeIconTextCard(iconAsset: ImagesConstants.chatIconSvg, text: 'Chatbot'),
            ],
          ),
        ),
      ),
    );
  }
}
