import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/adaptive_loading_view.dart';
import 'package:erkatoy_afex_ai/design_system/components/default_app_bar.dart';
import 'package:erkatoy_afex_ai/design_system/components/retry_button.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/health/widget/health_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/health_bloc.dart';

class HealthTipsScreen extends StatefulWidget {
  const HealthTipsScreen({super.key});

  static const String routeName = 'heath_tips';

  static void open(BuildContext context) {
    context.pushNamed(routeName);
  }

  @override
  State<HealthTipsScreen> createState() => _HealthTipsScreenState();
}

class _HealthTipsScreenState extends State<HealthTipsScreen> {
  @override
  void initState() {
    Future.microtask(() => context.read<HealthBloc>().add(OnGetHealthTipsListEvent()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(titleText: 'Salomatlik', backButtonEnabled: true),
      body: Padding(
        padding: getPaddingAll20,
        child: BlocSelector<HealthBloc, HealthState, HealthStatus>(
          selector: (state) => state.status,
          builder: (context, status) {
            switch (status) {
              case HealthStatus.onSuccess:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextView.boldStyle(
                      text: "Bolalarda uchrashi mumkin bo'lgan kasalliklar",
                      textSize: 24.textSize(context),
                      textColor: context.themeColors.onSurface,
                    ),
                    getHeightSize16,
                    const HealthListView(),
                  ],
                );

              case HealthStatus.onLoading:
                return Center(child: AdaptiveLoadingView(color: context.themeColors.onSecondary));

              case HealthStatus.onError:
                return Center(
                  child: RetryButton(
                    onPressed: () {
                      context.read<HealthBloc>().add(OnGetHealthTipsListEvent());
                    },
                    color: context.themeColors.onSecondary,
                  ),
                );

              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
