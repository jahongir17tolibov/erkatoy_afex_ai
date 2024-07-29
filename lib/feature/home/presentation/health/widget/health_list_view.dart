import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/entity/health.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/health/bloc/health_bloc.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/health/widget/health_list_item.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/health/widget/health_view_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HealthListView extends StatelessWidget {
  const HealthListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HealthBloc, HealthState, List<Health>>(
      selector: (state) => state.healthTipsList,
      builder: (context, healthTipsList) {
        return HealthViewCard(
          child: ListView.builder(
            shrinkWrap: true, // blyat hozircha performance -- bb tursin
            padding: getPaddingAll16,
            itemCount: healthTipsList.length,
            itemBuilder: (context, index) {
              final item = healthTipsList[index];
              return HealthListItem(
                index: index + 1,
                diseaseText: item.disease ?? '',
                causeText: item.cause ?? '',
                solutionText: item.solution ?? '',
                isExpanded: item.isExpanded,
              );
            },
          ),
        );
      },
    );
  }
}
