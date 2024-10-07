import 'package:erkatoy_afex_ai/core/base/base_extensions.dart';
import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/app_constants.dart';
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
    final currentThemeMode = Theme.of(context).brightness;
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
                padding: getPaddingAll10,
                decoration: BoxDecoration(
                  color: !isUser ? context.themeColors.onSurface.withOpacity(0.1) : null,
                  gradient: isUser ? _gradientBckg(currentThemeMode == Brightness.dark) : null,
                  borderRadius: BorderRadius.only(
                    topLeft: getCircularRadius(16),
                    topRight: getCircularRadius(16),
                    bottomLeft: getCircularRadius(isUser ? 16 : 0),
                    bottomRight: getCircularRadius(isUser ? 0 : 16),
                  ),
                ),
                child: Text.rich(
                  message.parseMarkdown,
                  style: TextStyle(
                    fontFamily: AppConstants.appFontStyle,
                    fontSize: 14.textSize(context),
                    color: isUser
                        ? currentThemeMode == Brightness.dark
                            ? context.themeColors.surface
                            : context.themeColors.onSurface
                        : context.themeColors.onSurface,
                  ),
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

  LinearGradient _gradientBckg(bool isDark) {
    const Color topColor = Color(0xFFFBFF3D);
    const Color bottomColor = Color(0xFF6CF8AB);
    return const LinearGradient(
      colors: [topColor, bottomColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }
}
