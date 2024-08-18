import 'package:erkatoy_afex_ai/feature/auth/data/remote/dto/child_info_dto.dart';
import 'package:erkatoy_afex_ai/feature/auth/domain/entity/child_info.dart';

extension ChildInfoDtoMapper on ChildInfoDto {
  ChildInfo toChildInfo() => ChildInfo(
        message: message,
        weight: weight!.toDouble(),
        gender: gender,
        birthdayDate: birthdayDate,
        detail: detail,
      );
}
