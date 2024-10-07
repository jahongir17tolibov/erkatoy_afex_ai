import 'package:erkatoy_afex_ai/feature/home/domain/entity/chat.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/chat/bloc/chat_bloc.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/chat/widget/chat_container.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/chat/widget/chat_logo_on_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_loading.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ChatBloc, ChatState, List<Chat>>(
      selector: (state) => state.chatsList,
      builder: (context, chats) {
        return Expanded(
          child: ListView.builder(
            reverse: true,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            physics: const BouncingScrollPhysics(),
            itemCount: chats.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) return const ChatLoading();

              if (index == chats.length + 1) return const ChatLogoOnListView();

              final item = chats[index - 1];
              return ChatContainer(
                isUser: item.isUser,
                message: item.request,
                currentTime: item.requestTime,
              );
            },
          ),
        );
      },
    );
  }
}
