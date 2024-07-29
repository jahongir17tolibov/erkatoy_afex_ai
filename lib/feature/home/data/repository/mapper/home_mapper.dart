import 'package:erkatoy_afex_ai/feature/home/data/local/entity/chat_entity.dart';
import 'package:erkatoy_afex_ai/feature/home/data/remote/dto/health_dto.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/entity/chat.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/entity/health.dart';

extension HealthDtoMapper on HealthDto {
  Health toHealth() => Health(disease: disease!, cause: cause!, solution: solution!);
}

extension ChatEntityMapper on ChatEntity {
  Chat toChat() => Chat(id: id, request: request, requestTime: requestTime, isUser: isUser);
}

extension ChatMapper on Chat {
  ChatEntity toChatEntity() => ChatEntity(
        id: id,
        request: request,
        requestTime: requestTime,
        isUser: isUser,
      );
}
