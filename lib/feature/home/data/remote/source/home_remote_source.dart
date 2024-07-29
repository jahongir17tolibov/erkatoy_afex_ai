part of 'home_remote_source_impl.dart';

abstract interface class HomeRemoteSource {
  Future<dynamic> getHealthResponse(int itemsCount);

  Future<AllActivitiesDto> getAllActivitiesResponse();

  Future<CurrentActivityDto> getCurrentActivityResponse();

  Future<String> requestChatAi(String request, String userId);
}
