import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/blur_outer_container.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/daily_schedule/widget/rotated_arrow.dart';
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
      child: BlurOuterContainer(
        padding: getPaddingAll16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: TextView.boldStyle(
                    text: '$index. $diseaseText',
                    textSize: 16,
                    textColor: context.themeColors.onSurface,
                    textOverflow: isExpanded ? null : TextOverflow.ellipsis,
                    maxLines: isExpanded ? null : 1,
                  ),
                ),
                RotatedArrow(isExpanded: isExpanded),
              ],
            ),
            ExpandedSection(
              key: Key(index.toString()),
              isExpanded: isExpanded,
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                padding: getPaddingAll12,
                width: 1.screenWidth(context),
                decoration: BoxDecoration(
                  color: context.themeColors.onSurface.withOpacity(0.1),
                  borderRadius: getBorderAll12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    HealthRichText(leftText: 'Sabab', rightText: causeText),
                    getHeightSize8,
                    HealthRichText(leftText: 'Yechim', rightText: solutionText),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
