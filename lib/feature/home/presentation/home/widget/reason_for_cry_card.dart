import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/home/widget/cry_reason_container.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/home/widget/home_cards_container.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/home/widget/record_cry_button.dart';
import 'package:flutter/material.dart';

class ReasonForCryCard extends StatelessWidget {
  const ReasonForCryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeCardsContainer(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextView.boldStyle(
                text: 'Yig`i sababini\naniqlash',
                textSize: 20.textSize(context),
                textColor: context.themeColors.onSecondary,
                maxLines: 2,
              ),
              const RecordCryButton(),
            ],
          ),
          SizedBox(height: 0.05.screenHeight(context)),
          const CryReasonContainer(),
        ],
      ),
    );
  }
}
