import 'package:erkatoy_afex_ai/core/base/base_functions.dart';
import 'package:erkatoy_afex_ai/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseCloudMsgService {
  static final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  static Future<void> initFcm() async {
    final notificationSettings = await _fcm.requestPermission();
    await _fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
    );
    await _fcm.getToken().then((token) {
      printOnDebug('fcm token: $token');
    });
    _backgroundMessage();
    _listenMessages();
  }

  static void _backgroundMessage() {
    FirebaseMessaging.onBackgroundMessage((msg) async {

    });
  }

  static void _listenMessages() async {
    FirebaseMessaging.onMessage.listen((msg) {
      if (msg.notification != null) {
        printOnDebug('msg: ${msg.notification}');
      }
    });
  }
}
