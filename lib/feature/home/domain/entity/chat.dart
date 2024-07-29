import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  const Chat({
    required this.id,
    required this.request,
    required this.requestTime,
    required this.isUser,
  });

  final int id;
  final String request;
  final String requestTime;
  final bool isUser;

  @override
  List<Object?> get props => [id, request, requestTime, isUser];
}
