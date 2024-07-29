import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/design_system/components/default_app_bar.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/chat/widget/chat_app_bar.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/chat/widget/chat_input.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/chat/widget/chat_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/chat_bloc.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  static const String routeName = 'chat';

  static void open(BuildContext context) {
    context.pushNamed(routeName);
  }

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _chatEditingController = TextEditingController();
  final FocusNode _chatFocusNode = FocusNode();

  @override
  void initState() {
    Future.microtask(() => context.read<ChatBloc>().add(OnGetCachedChatsEvent()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const ChatListView(),
          ChatInput(controller: _chatEditingController, focusNode: _chatFocusNode),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _chatEditingController.dispose();
    super.dispose();
  }
}
