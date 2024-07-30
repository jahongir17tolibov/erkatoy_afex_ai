import 'dart:ui';

import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  PermissionService._();

  static Future<void> postNotification(VoidCallback granted) async {
    final postNotificationsPerm = await Permission.notification.isGranted;
    if (!postNotificationsPerm) {
      await Permission.notification.request();
    } else {
      granted.call();
    }
  }

  static Future<void> audio(VoidCallback granted) async {
    final audioPerm = await Permission.audio.isGranted;
    if (!audioPerm) {
      await Permission.audio.request();
    } else {
      granted.call();
    }
  }

  static Future<void> microphone(VoidCallback granted) async {
    final microphonePerm = await Permission.microphone.isGranted;
    if (!microphonePerm) {
      await Permission.microphone.request();
    } else {
      granted.call();
    }
  }

  static Future<bool> audioRecordingGranted() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.microphone,
      Permission.audio,
    ].request();

    final microphonePerm = statuses[Permission.microphone]!.isGranted;
    final audioPerm = statuses[Permission.audio]!.isGranted;

    return microphonePerm && audioPerm;
  }
}
