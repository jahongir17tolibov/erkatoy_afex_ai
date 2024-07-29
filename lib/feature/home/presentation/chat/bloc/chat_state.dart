part of 'chat_bloc.dart';

enum ChatStatus { pure, onLoading, onSuccess, onError }

class ChatState extends Equatable {
  const ChatState({
    this.status = ChatStatus.pure,
    this.chatsList = const [],
    this.isLoading = false,
    this.errorMessage = '',
  });

  final ChatStatus status;
  final List<Chat> chatsList;
  final bool isLoading;
  final String errorMessage;

  ChatState copyWith({
    ChatStatus? status,
    List<Chat>? chatsList,
    bool? isLoading,
    String? errorMessage,
  }) =>
      ChatState(
        status: status ?? this.status,
        chatsList: chatsList ?? this.chatsList,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [status, chatsList, isLoading, errorMessage];
}
