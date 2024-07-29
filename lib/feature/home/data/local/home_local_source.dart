import 'package:erkatoy_afex_ai/core/constants/hive_constants.dart';
import 'package:erkatoy_afex_ai/feature/home/data/local/entity/chat_entity.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeLocalSource {
  Box<ChatEntity> get box => Hive.box<ChatEntity>(HiveConstants.chatAdapterBoxName);

  Future<int> saveChat(ChatEntity chat) async {
    return await box.add(chat);
  }

  Future<void> deleteChatByIndex(int index) async {
    await box.deleteAt(index);
  }

  Stream<List<ChatEntity>> getAllChat() async* {
    yield box.values.toList();
    yield* box.watch().map((event) => box.values.toList());
  }

  Future<int> deleteAllChats() async {
    return await box.clear();
  }
}
