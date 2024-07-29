import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/text_view.dart';
import 'package:erkatoy_afex_ai/design_system/extensions/ui_extensions.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/entity/chat.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/chat/bloc/chat_bloc.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/chat/widget/chat_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ChatBloc, ChatState, List<Chat>>(
      selector: (state) => state.chatsList,
      builder: (context, chats) {
        return Expanded(
          child: chats.isNotEmpty
              ? ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  physics: const BouncingScrollPhysics(),
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    final item = chats[index];
                    return ChatContainer(
                      isUser: item.isUser,
                      message: item.request,
                      currentTime: item.requestTime,
                    );
                  },
                )
              : Padding(
                  padding: getPaddingAll20,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextView(
                      text: 'Maslahatlar olmoqchi bo`lsangiz AI yodamchidan tortinmay so`rayvering',
                      textColor: context.themeColors.onSurface.withOpacity(0.6),
                      textSize: 14.textSize(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
