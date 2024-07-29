import 'package:erkatoy_afex_ai/core/base/use_case.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/repository/home_repository.dart';

class GetCurrentActivityUseCase implements BaseUseCase<CurrentActivityResult> {
  GetCurrentActivityUseCase({required HomeRepository repository}) : _repository = repository;

  final HomeRepository _repository;

  @override
  Future<CurrentActivityResult> execute() => _repository.getCurrentActivityFromApi();
}
