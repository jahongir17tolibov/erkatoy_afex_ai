import 'package:erkatoy_afex_ai/core/base/base_extensions.dart';
import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/google_font_style.dart';
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 12, right: 0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              minLines: 1,
              maxLines: 5,
              cursorColor: context.themeColors.primary,
              style: googleFontStyle(fontColor: context.themeColors.onSecondary),
              cursorOpacityAnimates: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: getBorderAll16,
                  borderSide: BorderSide.none,
                ),
                fillColor: context.themeColors.secondary,
                filled: true,
                isDense: true,
                hintText: 'So`rovingizni kiriting',
                hintStyle:
                    googleFontStyle(fontColor: context.themeColors.onSecondary.withOpacity(0.8)),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              if (context.getConnectivity) {
                if (controller.text.isNotEmpty) {
                  focusNode.unfocus();
                  context.read<ChatBloc>().add(OnRequestToAiChatEvent(message: controller.text));
                  controller.clear();
                }
              } else {
                context.showSnackBar('Internet bilan aloqa yo`q!');
              }
            },
            style: IconButton.styleFrom(backgroundColor: context.themeColors.surface),
            icon: Icon(Icons.send_rounded, color: context.themeColors.onSurface),
          )
        ],
      ),
    );
  }
}
