import 'package:hive/hive.dart';

part 'chat_entity.g.dart';

@HiveType(typeId: 0)
class ChatEntity extends HiveObject {
  ChatEntity({
    required this.id,
    required this.request,
    required this.requestTime,
    required this.isUser,
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String request;

  @HiveField(2)
  final String requestTime;

  @HiveField(3)
  final bool isUser;
}
