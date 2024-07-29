import 'package:erkatoy_afex_ai/core/base/use_case.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/entity/chat.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/repository/home_repository.dart';

class SaveChatToDbUseCase implements BaseUseCaseWithParams<Chat, int> {
  SaveChatToDbUseCase({required HomeRepository repository}) : _repository = repository;

  final HomeRepository _repository;

  @override
  Future<int> execute(Chat chat) => _repository.saveChatToDb(chat);
}
