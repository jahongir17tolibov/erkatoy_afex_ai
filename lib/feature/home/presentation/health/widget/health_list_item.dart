import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/health/bloc/health_bloc.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/health/widget/health_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'expanded_section.dart';

class HealthListItem extends StatelessWidget {
  const HealthListItem({
    super.key,
    required this.diseaseText,
    required this.causeText,
    required this.solutionText,
    required this.isExpanded,
    required this.index,
  });

  final int index;
  final String diseaseText;
  final String causeText;
  final String solutionText;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<HealthBloc>().add(OnExpandListItemHealthEvent(diseaseText));
      },
      borderRadius: getBorderAll16,
      child: Padding(
        padding: getPaddingAll6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextView.boldStyle(
              text: '$index. $diseaseText',
              textSize: 18.textSize(context),
              textColor: context.themeColors.onSecondary,
            ),
            ExpandedSection(
              isExpanded: isExpanded,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  getHeightSize10,
                  HealthRichText(leftText: 'Sabab', rightText: causeText),
                  getHeightSize20,
                  HealthRichText(leftText: 'Yechim', rightText: solutionText),
                ],
              ),
            ),
            getOnSurfaceDivider(context),
          ],
        ),
      ),
    );
  }
}
