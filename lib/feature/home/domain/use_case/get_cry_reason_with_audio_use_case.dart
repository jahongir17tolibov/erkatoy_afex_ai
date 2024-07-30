import 'dart:io';

import 'package:erkatoy_afex_ai/core/base/use_case.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/repository/home_repository.dart';

class GetCryReasonWithAudioUseCase implements BaseUseCaseWithParams<File, CryReasonResult> {
  GetCryReasonWithAudioUseCase({required HomeRepository repository}) : _repository = repository;

  final HomeRepository _repository;

  @override
  Future<CryReasonResult> execute(File file) => _repository.getCryReasonWithAudio(file);
}
