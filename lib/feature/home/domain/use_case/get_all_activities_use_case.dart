import 'package:erkatoy_afex_ai/core/base/use_case.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/repository/home_repository.dart';

class GetAllActivitiesUseCase implements BaseUseCase<AllActivitiesResult> {
  GetAllActivitiesUseCase({required HomeRepository repository}) : _repository = repository;

  final HomeRepository _repository;

  @override
  Future<AllActivitiesResult> execute() => _repository.getAllActivitiesFromApi();
}
