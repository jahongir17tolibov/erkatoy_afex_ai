import 'dart:async';

import 'package:dio/dio.dart';
import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/core/provider/remote/api_client.dart';
import 'package:erkatoy_afex_ai/core/provider/remote/dio_exception_handler.dart';
import 'package:erkatoy_afex_ai/feature/auth/data/remote/dto/auth_response.dart';
import 'package:erkatoy_afex_ai/feature/auth/data/remote/dto/child_info_dto.dart';

part 'auth_remote_source.dart';

class AuthRemoteSourceImpl implements AuthRemoteSource {
  AuthRemoteSourceImpl({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<AuthResponse> loginUser({required String phone, required String password}) async {
    AuthResponse authResponse;
    try {
      authResponse = await _apiClient.getDio.post(
        'login',
        options: _apiClient.postOptions,
        data: {
          'phone': phone,
          'password': password,
        },
      ).then((response) {
        printOnDebug('msg: ${response.data}');
        return AuthResponse.fromJson(response.data);
      });
    } on DioException catch (e) {
      final exception = DioExceptionHandler.fromDioError(e);
      authResponse = AuthResponse(detail: exception.errorMessage);
    }
    return authResponse;
  }

  @override
  Future<AuthResponse> registerUser({required String phone, required String password}) async {
    AuthResponse authResponse;
    try {
      authResponse = await _apiClient.getDio.post(
        'register',
        options: _apiClient.postOptions,
        data: {
          'phone': phone,
          'password': password,
        },
      ).then((response) => AuthResponse.fromJson(response.data));
    } on DioException catch (e) {
      final exception = DioExceptionHandler.fromDioError(e);
      authResponse = AuthResponse(detail: exception.errorMessage);
    }
    return authResponse;
  }

  @override
  Future<ChildInfoDto> sendChildInfo({
    required String birthDayDate,
    required String gender,
    required double weight,
  }) async {
    final option = await _apiClient.postOptionsWithBearer;
    ChildInfoDto childInfo;
    try {
      childInfo = await _apiClient.getDio.post(
        'child_info',
        options: option,
        data: {
          'birthday': birthDayDate,
          'gender': gender,
          'weight': weight,
        },
      ).then((response) => ChildInfoDto.fromJson(response.data));
    } on DioException catch (e) {
      final exception = DioExceptionHandler.fromDioError(e);
      childInfo = ChildInfoDto(message: exception.errorMessage);
    }
    return childInfo;
  }

  @override
  Future<ChildInfoDto> getChildInfo() async {
    final option = await _apiClient.getOptions;
    ChildInfoDto childInfo;
    try {
      childInfo = await _apiClient.getDio
          .get('get_child_info', options: option)
          .then((response) => ChildInfoDto.fromJson(response.data));
    } on DioException catch (e) {
      final exception = DioExceptionHandler.fromDioError(e);
      childInfo = ChildInfoDto(message: exception.errorMessage);
    }
    return childInfo;
  }
}
