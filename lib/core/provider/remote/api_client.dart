import 'dart:async';

import 'package:dio/dio.dart';
import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/constants/hive_constants.dart';
import 'package:erkatoy_afex_ai/core/provider/local/hive_local_storage.dart';

class ApiClient {
  ApiClient({required HiveLocalStorage localStorage}) : _localStorage = localStorage;

  final HiveLocalStorage _localStorage;
  final String _baseUrl = 'http://test.eva.softex.uz/';

  Dio get getDio {
    final BaseOptions baseOptions = BaseOptions(
      baseUrl: _baseUrl,
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      validateStatus: (statusCode) => statusCode != null,
    );
    return Dio(baseOptions);
  }

  Options _postOptions() => Options(headers: _postHeadersOption);
  final Map<String, dynamic> _postHeadersOption = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  FutureOr<Options> _getOptions() async {
    final bearer = await _getBearerToken();
    printOnDebug('apiclient: $bearer');
    return Options(headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $bearer',
    });
  }

  Future<String?> _getBearerToken() => _localStorage.getString(
    boxName: HiveConstants.authTokenBoxName,
    key: HiveConstants.authTokenKey,
  );

  Options get postOptions => _postOptions();
  FutureOr<Options> get getOptions => _getOptions();
}
