import 'package:erkatoy_afex_ai/core/base/use_case.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/repository/home_repository.dart';

class ClearChatHistoryUseCase implements BaseUseCase<int> {
  ClearChatHistoryUseCase({required HomeRepository repository}) : _repository = repository;

  final HomeRepository _repository;

  @override
  Future<int> execute() => _repository.clearChatHistory();
}
