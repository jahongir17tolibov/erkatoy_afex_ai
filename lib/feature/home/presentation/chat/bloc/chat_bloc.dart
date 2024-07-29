import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/entity/chat.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/use_case/get_cached_chats_use_case.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/use_case/request_to_ai_chat_use_case.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/use_case/save_chat_to_db_use_case.dart';
import 'package:intl/intl.dart';

part 'chat_event.dart';

part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({
    required this.getCachedChatsUseCase,
    required this.saveChatToDbUseCase,
    required this.requestToAiChatUseCase,
  }) : super(const ChatState()) {
    on<OnGetCachedChatsEvent>(_onGetCachedChatsEvent);
    on<OnRequestToAiChatEvent>(_onRequestToAiChatEvent);
  }

  final GetCachedChatsUseCase getCachedChatsUseCase;
  final SaveChatToDbUseCase saveChatToDbUseCase;
  final RequestToAiChatUseCase requestToAiChatUseCase;

  FutureOr<void> _onGetCachedChatsEvent(
    OnGetCachedChatsEvent event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(status: ChatStatus.onLoading));
    await emit.onEach<List<Chat>>(
      getCachedChatsUseCase.execute(),
      onData: (chats) {
        emit(state.copyWith(status: ChatStatus.onSuccess, chatsList: chats.reversed.toList()));
      },
      onError: (e, st) => emit(state.copyWith(
        status: ChatStatus.onError,
        errorMessage: e.toString(),
      )),
    );
  }

  FutureOr<void> _onRequestToAiChatEvent(
    OnRequestToAiChatEvent event,
    Emitter<ChatState> emit,
  ) async {
    final Chat chat = Chat(
      id: state.chatsList.length + 1,
      request: event.message,
      requestTime: _getCurrentTime(),
      isUser: true,
    );
    await saveChatToDbUseCase.execute(chat).whenComplete(() async {
      await _requestAi(emit, event.message);
    });
  }

  Future<void> _requestAi(Emitter<ChatState> emit, String msg) async {
    emit(state.copyWith(isLoading: true));
    await requestToAiChatUseCase.execute(msg).then((result) async {
      final Chat chat = Chat(
        id: state.chatsList.length + 1,
        request: result,
        requestTime: _getCurrentTime(),
        isUser: false,
      );
      await saveChatToDbUseCase.execute(chat);
      emit(state.copyWith(isLoading: false));
    });
  }

  String _getCurrentTime() {
    final DateTime now = DateTime.now();
    return DateFormat('HH:mm').format(now);
  }
}
