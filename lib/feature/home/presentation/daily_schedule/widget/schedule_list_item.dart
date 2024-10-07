import 'package:erkatoy_afex_ai/design_system/components/blur_outer_container.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class ScheduleListItem extends StatelessWidget {
  const ScheduleListItem({
    super.key,
    required this.time,
    required this.activity,
    required this.isCurrent,
  });

  final String time;
  final String activity;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return BlurOuterContainer(
      borderRadius: 12,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      backgroundColor: isCurrent ? context.themeColors.onSecondary : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 50,
            child: TextView.boldStyle(
              text: time,
              textSize: 16,
              textColor: isCurrent ? context.themeColors.surface : context.themeColors.onSurface,
            ),
          ),
          SizedBox(
            height: 24,
            child: VerticalDivider(
              color: isCurrent
                  ? context.themeColors.surface
                  : context.themeColors.onSurface.withOpacity(0.2),
            ),
          ),
          TextView(
            text: activity,
            textSize: 12,
            textColor: isCurrent ? context.themeColors.surface : context.themeColors.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
