import 'package:erkatoy_afex_ai/design_system/components/adaptive_loading_view.dart';
import 'package:erkatoy_afex_ai/design_system/components/default_app_bar.dart';
import 'package:erkatoy_afex_ai/design_system/components/retry_button.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/daily_schedule/widget/daily_schedule_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/daily_schedule_bloc.dart';

class DailyScheduleScreen extends StatefulWidget {
  const DailyScheduleScreen({super.key, required this.currentTime});

  final String currentTime;

  static const String routePath = 'daily_schedule/:current_time';
  static const String routeName = 'daily_schedule';

  static void open(BuildContext context, {required String currentTime}) {
    context.pushNamed(routeName, pathParameters: {'current_time': currentTime});
  }

  @override
  State<DailyScheduleScreen> createState() => _DailyScheduleScreenState();
}

class _DailyScheduleScreenState extends State<DailyScheduleScreen> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<DailyScheduleBloc>().add(OnGetAllActivitiesScheduleEvent(widget.currentTime));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(titleText: 'Kunlik jadval', backButtonEnabled: true),
      body: BlocSelector<DailyScheduleBloc, DailyScheduleState, DailyScheduleStatus>(
        selector: (state) => state.status,
        builder: (context, status) {
          switch (status) {
            case DailyScheduleStatus.onSuccess:
              return const DailyScheduleTable();

            case DailyScheduleStatus.onLoading:
              return const Center(child: AdaptiveLoadingView());

            case DailyScheduleStatus.onError:
              return Center(child: RetryButton(onPressed: () {
                context
                    .read<DailyScheduleBloc>()
                    .add(OnGetAllActivitiesScheduleEvent(widget.currentTime));
              }));

            default:
              return Container();
          }
        },
      ),
    );
  }
}
