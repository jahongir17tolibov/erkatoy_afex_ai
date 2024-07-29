import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({
    super.key,
    required this.isUser,
    required this.message,
    required this.currentTime,
  });

  final String message;
  final String currentTime;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        if (isUser) const Spacer(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: getPaddingAll12,
                decoration: BoxDecoration(
                  color: isUser
                      ? context.themeColors.onSecondary.withOpacity(0.2)
                      : context.themeColors.secondary,
                  borderRadius: getBorderAll16,
                ),
                child: TextView(
                  text: message,
                  textSize: 16.textSize(context),
                  textColor:
                      isUser ? context.themeColors.onSurface : context.themeColors.onSecondary,
                ),
              ),
              getHeightSize4,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextView(
                  text: currentTime,
                  textSize: 12.textSize(context),
                  textColor: context.themeColors.onSurface,
                ),
              ),
              getHeightSize10,
            ],
          ),
        ),
      ],
    );
  }
}
