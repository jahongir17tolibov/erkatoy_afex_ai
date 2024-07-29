import 'package:erkatoy_afex_ai/core/constants/hive_constants.dart';
import 'package:erkatoy_afex_ai/core/provider/local/hive_local_storage.dart';
import 'package:erkatoy_afex_ai/feature/auth/data/remote/source/auth_remote_source_impl.dart';
import 'package:erkatoy_afex_ai/feature/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteSource remoteSource,
    required HiveLocalStorage localStorage,
  })  : _remoteSource = remoteSource,
        _localStorage = localStorage;
  final AuthRemoteSource _remoteSource;
  final HiveLocalStorage _localStorage;

  @override
  Future<LoginResult> login({required String phone, required String password}) async {
    return await _remoteSource.loginUser(phone: phone, password: password).then((result) async {
      if (result.detail == null) {
        await saveAuthTokenToLocalStorage(result.accessToken!);
        return LoginResult(data: result.accessToken!);
      }
      return LoginResult(errorMessage: result.detail!);
    });
  }

  @override
  Future<RegisterResult> register({required String phone, required String password}) async {
    return await _remoteSource.registerUser(phone: phone, password: password).then((result) {
      if (result.detail == null) {
        return RegisterResult(data: result.phone!);
      }
      return RegisterResult(errorMessage: result.detail!);
    });
  }

  @override
  Future<ChildInfoResult> sendChildInfo({
    required String birthDayDate,
    required String gender,
    required double weight,
  }) async {
    final authToken = await getAuthToken();
    return await _remoteSource
        .sendChildInfo(
      birthDayDate: birthDayDate,
      gender: gender,
      weight: weight,
      bearerToken: authToken!,
    ).then((childInfo) {
      if (childInfo.userId != null) {
        return ChildInfoResult(data: '${childInfo.message} ${childInfo.userId}');
      }
      return ChildInfoResult(errorMessage: childInfo.message);
    });
  }

  Future<void> saveAuthTokenToLocalStorage(String token) async {
    await _localStorage.saveString(
      boxName: HiveConstants.authTokenBoxName,
      key: HiveConstants.authTokenKey,
      value: token,
    );
  }

  Future<String?> getAuthToken() async {
    return await _localStorage.getString(
      boxName: HiveConstants.authTokenBoxName,
      key: HiveConstants.authTokenKey,
    );
  }
}
