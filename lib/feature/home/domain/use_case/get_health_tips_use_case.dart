import 'package:erkatoy_afex_ai/core/base/use_case.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/repository/home_repository.dart';

class GetHealthTipsUseCase implements BaseUseCaseWithParams<int, HealthTipsResult> {
  GetHealthTipsUseCase({required HomeRepository repository}) : _repository = repository;

  final HomeRepository _repository;

  @override
  Future<HealthTipsResult> execute(int itemCount) => _repository.getHealthTipsFromApi(itemCount);
}
