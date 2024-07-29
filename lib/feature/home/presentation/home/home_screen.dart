import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/single_child_scroll_with_size.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/home_bloc.dart';
import 'widget/daily_schedule_card.dart';
import 'widget/health_card.dart';
import 'widget/home_app_bar.dart';
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
      appBar: const HomeAppBar(),
      body: SingleChildScrollWithSize(
        statusBarHeight: MediaQuery.of(context).viewPadding.top,
        padding: EdgeInsets.symmetric(horizontal: 0.05.screenWidth(context)),
        screenWithAppBar: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            getHeightSize6,
            const ReasonForCryCard(),
            getHeightSize20,
            const DailyScheduleCard(),
            getHeightSize20,
            const HealthCard(),
          ],
        ),
      ),
    );
  }
}
