import 'package:erkatoy_afex_ai/core/base/result_handle.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/entity/chat.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/entity/health.dart';

typedef HealthTipsResult = Result<List<Health>>;
typedef AllActivitiesResult = Result<List<String>>;
typedef CurrentActivityResult = Result<String>;

abstract interface class HomeRepository {
  Future<HealthTipsResult> getHealthTipsFromApi(int itemCount);

  Future<AllActivitiesResult> getAllActivitiesFromApi();

  Future<CurrentActivityResult> getCurrentActivityFromApi();

  Future<String> requestToAiChat(String request);

  Future<int> saveChatToDb(Chat chat);

  Stream<List<Chat>> getCachedChatsFromDb();
}
