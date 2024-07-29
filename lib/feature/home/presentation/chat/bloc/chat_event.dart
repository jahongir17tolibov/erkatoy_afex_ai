part of 'chat_bloc.dart';

sealed class ChatEvent {}

final class OnGetCachedChatsEvent extends ChatEvent {}

final class OnRequestToAiChatEvent extends ChatEvent {
  OnRequestToAiChatEvent({required this.message});

  final String message;
}
