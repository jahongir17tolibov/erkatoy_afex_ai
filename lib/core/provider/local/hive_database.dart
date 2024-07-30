import 'package:erkatoy_afex_ai/core/constants/hive_constants.dart';
import 'package:erkatoy_afex_ai/feature/home/data/local/entity/chat_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(HiveConstants.authTokenBoxName);
    await Hive.openBox(HiveConstants.settingsBoxName);

    Hive.registerAdapter(ChatEntityAdapter());
    await Hive.openBox<ChatEntity>(HiveConstants.chatAdapterBoxName);
  }
}
