import 'package:dio/dio.dart';
import 'package:erkatoy_afex_ai/core/provider/remote/api_client.dart';
import 'package:erkatoy_afex_ai/core/provider/remote/dio_exception_handler.dart';
import 'package:erkatoy_afex_ai/feature/home/data/remote/dto/all_activities_dto.dart';
import 'package:erkatoy_afex_ai/feature/home/data/remote/dto/current_activity_dto.dart';
import 'package:erkatoy_afex_ai/feature/home/data/remote/dto/health_dto.dart';

part 'home_remote_source.dart';

class HomeRemoteSourceImpl implements HomeRemoteSource {
  HomeRemoteSourceImpl({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<AllActivitiesDto> getAllActivitiesResponse() async {
    final option = await _apiClient.getOptions;
    AllActivitiesDto allActivitiesDto;
    try {
      allActivitiesDto = await _apiClient.getDio
          .get('all_activities', options: option)
          .then((response) => AllActivitiesDto.fromJson(response.data));
    } on DioException catch (e) {
      final exception = DioExceptionHandler.fromDioError(e);
      allActivitiesDto = AllActivitiesDto(message: exception.errorMessage);
    }
    return allActivitiesDto;
  }

  @override
  Future<CurrentActivityDto> getCurrentActivityResponse() async {
    final option = await _apiClient.getOptions;
    CurrentActivityDto currentActivityDto;
    try {
      currentActivityDto = await _apiClient.getDio
          .get('current_activity', options: option)
          .then((response) => CurrentActivityDto.fromJson(response.data));
    } on DioException catch (e) {
      final exception = DioExceptionHandler.fromDioError(e);
      currentActivityDto = CurrentActivityDto(detail: exception.errorMessage);
    }
    return currentActivityDto;
  }

  @override
  Future<dynamic> getHealthResponse(int itemsCount) async {
    try {
      return await _apiClient.getDio.get('health?limit=$itemsCount&all=true').then((response) {
        if (response.statusCode == 200) {
          final body = response.data as List;
          return body.map((json) => HealthDto.fromJson(json)).toList();
        }
        return response.data['message'] as String;
      });
    } on DioException catch (e) {
      final exception = DioExceptionHandler.fromDioError(e);
      return exception.errorMessage;
    }
  }

  @override
  Future<String> requestChatAi(String request, String userId) async {
    try {
      return await _apiClient.getDio.post(
        'chat',
        options: _apiClient.postOptions,
        data: {
          'message': request,
          'user_id': userId,
        },
      ).then((response) {
        return response.data['output'] as String;
      });
    } on DioException catch (e) {
      final exception = DioExceptionHandler.fromDioError(e);
      return exception.errorMessage;
    }
  }
}
