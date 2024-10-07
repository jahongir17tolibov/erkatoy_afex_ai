import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/home/widget/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/home_bloc.dart';
import 'widget/daily_schedule_card.dart';
import 'widget/health_card.dart';

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
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          context.read<HomeBloc>().add(OnGetCurrentActivityHomeEvent());
        },
        child: SingleChildScrollView(
          padding: getPaddingAll20,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              getHeightSize10,
              const DailyScheduleCard(),
              getHeightSize12,
              const HealthCard(),
            ],
          ),
        ),
      ),
    );
  }
}
