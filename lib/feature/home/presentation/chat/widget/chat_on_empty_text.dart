import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/chat/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatOnEmptyText extends StatelessWidget {
  const ChatOnEmptyText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ChatBloc, ChatState, bool>(
      selector: (state) => state.chatsList.isEmpty,
      builder: (context, isEmpty) {
        return isEmpty
            ? Padding(
                padding: getPaddingAll20,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextView(
                    text: 'Maslahatlar olmoqchi bo`lsangiz AI yodamchidan tortinmay so`rayvering',
                    textColor: context.themeColors.onSurface.withOpacity(0.2),
                    textSize: 14.textSize(context),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
