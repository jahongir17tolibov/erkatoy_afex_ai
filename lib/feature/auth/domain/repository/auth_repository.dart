import 'package:erkatoy_afex_ai/core/base/result_handle.dart';
import 'package:erkatoy_afex_ai/feature/auth/domain/entity/child_info.dart';

typedef LoginResult = Result<String>;
typedef RegisterResult = Result<String>;
typedef ChildInfoResult = Result<String>;
typedef GetChildInfoResult = Result<ChildInfo>;

abstract interface class AuthRepository {
  Future<LoginResult> login({required String phone, required String password});

  Future<RegisterResult> register({required String phone, required String password});

  Future<ChildInfoResult> sendChildInfo({
    required String birthDayDate,
    required String gender,
    required double weight,
  });

  Future<GetChildInfoResult> getChildInfo();
}
