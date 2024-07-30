import 'dart:io';

import 'package:erkatoy_afex_ai/core/base/result_handle.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/entity/activity_schedule.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/entity/chat.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/entity/health.dart';
import 'package:flutter/cupertino.dart';

typedef HealthTipsResult = Result<List<Health>>;
typedef AllActivitiesResult = Result<List<ActivitySchedule>>;
typedef CurrentActivityResult = Result<String>;
typedef CryReasonResult = Result<String>;

abstract interface class HomeRepository {
  Future<HealthTipsResult> getHealthTipsFromApi(int itemCount);

  Future<AllActivitiesResult> getAllActivitiesFromApi();

  Future<CurrentActivityResult> getCurrentActivityFromApi();

  Future<String> requestToAiChat(String request);

  Future<int> saveChatToDb(Chat chat);

  Stream<List<Chat>> getCachedChatsFromDb();

  Future<CryReasonResult> getCryReasonWithAudio(File file);

  @protected
  Future<CryReasonResult> getCryReasonFromApi(String audioUrl);
}
