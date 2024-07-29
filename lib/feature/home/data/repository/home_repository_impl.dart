import 'package:erkatoy_afex_ai/feature/home/data/local/home_local_source.dart';
import 'package:erkatoy_afex_ai/feature/home/data/remote/dto/health_dto.dart';
import 'package:erkatoy_afex_ai/feature/home/data/remote/source/home_remote_source_impl.dart';
import 'package:erkatoy_afex_ai/feature/home/data/repository/mapper/home_mapper.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/entity/chat.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({
    required HomeRemoteSource remoteSource,
    required HomeLocalSource localSource,
  })  : _remoteSource = remoteSource,
        _localSource = localSource;
  final HomeRemoteSource _remoteSource;
  final HomeLocalSource _localSource;

  @override
  Future<AllActivitiesResult> getAllActivitiesFromApi() {
    return _remoteSource.getAllActivitiesResponse().then((data) {
      if (data.detail == null) {
        final activities = data.events!.entries.map((entry) {
          return '${entry.key} - ${entry.value}';
        }).toList();
        return AllActivitiesResult(data: activities);
      }
      return AllActivitiesResult(errorMessage: data.detail!);
    });
  }

  @override
  Future<CurrentActivityResult> getCurrentActivityFromApi() {
    return _remoteSource.getCurrentActivityResponse().then((data) {
      if (data.detail == null) {
        final String activity = '${data.time} - ${data.activity}';
        return CurrentActivityResult(data: activity);
      }
      return CurrentActivityResult(errorMessage: data.detail!);
    });
  }

  @override
  Future<HealthTipsResult> getHealthTipsFromApi(int itemCount) async {
    return _remoteSource.getHealthResponse(itemCount).then((data) {
      if (data is! String) {
        final healthData = data as List<HealthDto>;
        final healthList = healthData.map((it) => it.toHealth()).toList();
        return HealthTipsResult(data: healthList);
      }
      return HealthTipsResult(errorMessage: data);
    });
  }

  @override
  Stream<List<Chat>> getCachedChatsFromDb() async* {
    yield* _localSource
        .getAllChat()
        .map((snapshot) => snapshot.map((data) => data.toChat()).toList());
  }

  @override
  Future<int> saveChatToDb(Chat chat) async {
    return _localSource.saveChat(chat.toChatEntity());
  }

  @override
  Future<String> requestToAiChat(String request) async {
    return await _remoteSource.requestChatAi(request, "+998909001755");
  }
}
