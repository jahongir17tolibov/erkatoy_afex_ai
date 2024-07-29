import 'package:erkatoy_afex_ai/feature/home/domain/entity/chat.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/repository/home_repository.dart';

class GetCachedChatsUseCase {
  GetCachedChatsUseCase({required HomeRepository repository}) : _repository = repository;

  final HomeRepository _repository;

  Stream<List<Chat>> execute() => _repository.getCachedChatsFromDb();
}
