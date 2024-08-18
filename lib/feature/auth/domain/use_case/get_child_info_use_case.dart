import 'package:erkatoy_afex_ai/core/base/use_case.dart';
import 'package:erkatoy_afex_ai/feature/auth/domain/repository/auth_repository.dart';

class GetChildInfoUseCase implements BaseUseCase<GetChildInfoResult> {
  GetChildInfoUseCase({required AuthRepository repository}) : _repository = repository;

  final AuthRepository _repository;

  @override
  Future<GetChildInfoResult> execute() => _repository.getChildInfo();
}
