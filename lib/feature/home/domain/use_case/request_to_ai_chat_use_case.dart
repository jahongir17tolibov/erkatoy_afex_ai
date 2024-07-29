import 'package:erkatoy_afex_ai/core/base/use_case.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/repository/home_repository.dart';

class RequestToAiChatUseCase implements BaseUseCaseWithParams<String, String> {
  RequestToAiChatUseCase({required HomeRepository repository}) : _repository = repository;

  final HomeRepository _repository;

  @override
  Future<String> execute(String request) => _repository.requestToAiChat(request);
}
