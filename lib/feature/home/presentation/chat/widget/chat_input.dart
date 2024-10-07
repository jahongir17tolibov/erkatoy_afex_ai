import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/app_constants.dart';
import 'package:erkatoy_afex_ai/core/constants/images_constants.dart';
import 'package:erkatoy_afex_ai/design_system/components/svg_image_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/floating_ui.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/chat/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatInput extends StatelessWidget {
  const ChatInput({super.key, required this.controller, required this.focusNode});

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        side: BorderSide(color: context.themeColors.surfaceContainerLow),
      ),
      color: context.themeColors.surface,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                minLines: 1,
                maxLines: 5,
                cursorColor: context.themeColors.primary,
                style: TextStyle(
                  fontFamily: AppConstants.appFontStyle,
                  color: context.themeColors.onSurface,
                ),
                cursorOpacityAnimates: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: getBorderAll12,
                    borderSide: BorderSide.none,
                  ),
                  fillColor: context.themeColors.onSurface.withOpacity(0.1),
                  filled: true,
                  isDense: true,
                  hintText: 'So`rovingizni kiriting',
                  hintStyle: TextStyle(
                    fontFamily: AppConstants.appFontStyle,
                    color: context.themeColors.onSurface.withOpacity(0.8),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                context.checkConnectivity(() {
                  if (controller.text.isNotEmpty) {
                    focusNode.unfocus();
                    context.read<ChatBloc>().add(OnRequestToAiChatEvent(message: controller.text));
                    controller.clear();
                  }
                });
              },
              icon: const SvgImageView(ImagesConstants.sendChatIcon),
            ),
          ],
        ),
      ),
    );
  }
}
