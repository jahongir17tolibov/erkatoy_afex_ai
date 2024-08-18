import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseCloudMsgService {
  Future<void> initFcm() async {
    final notificationSettings =
        await FirebaseMessaging.instance.requestPermission(provisional: true);
  }
}
